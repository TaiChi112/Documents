#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <unistd.h>   // fork(), getpid()
#include <sys/wait.h> // wait()
#include <cstring>    // strncpy

using namespace std;

struct SalesRecord {
    int orderId;
    char date[11];
    char region[20];
    char product[100];
    double amount;
    char month[10];
    SalesRecord *next;
};

// อ่านข้อมูล CSV
void readCSV(const string &filename, const string &month, SalesRecord *&head) {
    ifstream file(filename);
    if (!file.is_open()) {
        cerr << "Error opening file: " << filename << endl;
        return;
    }

    string line;
    getline(file, line); // ข้าม header

    while (getline(file, line)) {
        stringstream ss(line);
        string orderIdStr, date, region, product, amountStr;

        getline(ss, orderIdStr, ',');
        getline(ss, date, ',');
        getline(ss, region, ',');
        getline(ss, product, ',');
        getline(ss, amountStr, ',');

        SalesRecord *node = new SalesRecord;
        node->orderId = stoi(orderIdStr);
        strncpy(node->date, date.c_str(), 10);
        node->date[10] = '\0';
        strncpy(node->region, region.c_str(), 19);
        node->region[19] = '\0';
        strncpy(node->product, product.c_str(), 99);
        node->product[99] = '\0';
        node->amount = stod(amountStr);
        strncpy(node->month, month.c_str(), 9);
        node->month[9] = '\0';

        node->next = head;
        head = node;
    }
    file.close();
}

// หายอดรวมตาม product
double findTotalByProduct(SalesRecord *head, const string &productName) {
    double total = 0;
    SalesRecord *curr = head;
    while (curr != nullptr) {
        if (productName == curr->product) {
            total += curr->amount;
        }
        curr = curr->next;
    }
    return total;
}

int main() {
    SalesRecord *head = nullptr;

    // โหลดข้อมูลจาก 3 ไฟล์
    readCSV("sales_january.csv", "January", head);
    readCSV("sales_february.csv", "February", head);
    readCSV("sales_march.csv", "March", head);

    pid_t pid = fork();

    if (pid < 0) {
        cerr << "Fork failed!" << endl;
        return 1;
    }

    if (pid == 0) { // Child
        cout << "Process ID " << getpid() << ": Please input product name: ";
        string product;
        getline(cin, product);

        double total = findTotalByProduct(head, product);
        cout << "Process ID " << getpid()
             << ": The total amount of \"" << product
             << "\" from January to March is " << total << endl;
    } else { // Parent
        cout << "Process ID " << getpid() << ": Please wait...." << endl;
        wait(NULL);
    }

    return 0;
}