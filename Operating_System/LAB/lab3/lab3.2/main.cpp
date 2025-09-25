#include <bits/stdc++.h>
#include <unistd.h>
#include <sys/wait.h>
#include <ctime>
#include <fstream>
using namespace std;

vector<string> readWords(const string &filename) {
    ifstream file(filename);
    vector<string> words;
    string word;
    while (file >> word) {
        // ทำให้เป็น lower-case และตัดเครื่องหมาย
        transform(word.begin(), word.end(), word.begin(), ::tolower);
        word.erase(remove_if(word.begin(), word.end(),
                             [](char c){ return ispunct(c); }),
                   word.end());
        if (!word.empty())
            words.push_back(word);
    }
    return words;
}

int main() {
    vector<string> bookFiles = {"lotr1.txt", "lotr2.txt", "lotr3.txt"};
    string prepFile = "prepositions.txt";

    // โหลด prepositions ทั้งหมดเข้ามา
    unordered_set<string> preps;
    {
        ifstream pf(prepFile);
        string w;
        while (pf >> w) {
            transform(w.begin(), w.end(), w.begin(), ::tolower);
            preps.insert(w);
        }
    }

    // เตรียม pipe สำหรับ child -> parent
    int pipes[3][2];
    for (int i = 0; i < 3; i++) {
        if (pipe(pipes[i]) == -1) {
            perror("pipe error");
            exit(1);
        }
    }

    // Fork 3 child
    for (int i = 0; i < 3; i++) {
        pid_t pid = fork();
        if (pid == 0) {  // child
            close(pipes[i][0]); // ปิด read end
            // อ่านไฟล์ของตัวเอง
            auto words = readWords(bookFiles[i]);

            // นับ prepositions
            unordered_map<string,int> count;
            for (auto &w : words) {
                if (preps.count(w)) {
                    count[w]++;
                }
            }

            // serialize ผลลัพธ์ส่งผ่าน pipe
            stringstream ss;
            for (auto &p : count) {
                ss << p.first << " " << p.second << "\n";
            }
            string out = ss.str();
            write(pipes[i][1], out.c_str(), out.size());
            close(pipes[i][1]);
            exit(0);
        }
    }

    // Parent process
    unordered_map<string,int> totalCount;
    for (int i = 0; i < 3; i++) {
        close(pipes[i][1]); // ปิด write end
        char buffer[4096];
        ssize_t n = read(pipes[i][0], buffer, sizeof(buffer)-1);
        if (n > 0) {
            buffer[n] = '\0';
            stringstream ss(buffer);
            string w;
            int c;
            while (ss >> w >> c) {
                totalCount[w] += c;
            }
        }
        close(pipes[i][0]);
        wait(NULL);
    }

    // สร้างชื่อไฟล์ output
    time_t now = time(0);
    tm *ltm = localtime(&now);
    char filename[100];
    strftime(filename, sizeof(filename), "output_%Y_%m_%d_%H_%M_%S.csv", ltm);

    ofstream out(filename);
    out << "WORD|COUNT\n";
    for (auto &p : totalCount) {
        out << p.first << "|" << p.second << "\n";
    }
    out.close();

    cout << "Result written to " << filename << endl;
    return 0;
}