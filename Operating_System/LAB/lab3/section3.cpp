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
    char month[20];  // เก็บชื่อไฟล์หรือเดือน
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
        strncpy(node->month, month.c_str(), 19);
        node->month[19] = '\0';

        node->next = head;
        head = node;
    }
    file.close();
}

// ค้นหาตาม OrderID
SalesRecord* findByOrderId(SalesRecord *head, int orderId) {
    SalesRecord *curr = head;
    while (curr != nullptr) {
        if (curr->orderId == orderId) {
            return curr;
        }
        curr = curr->next;
    }
    return nullptr;
}

int main() {
    SalesRecord *head = nullptr;

    // โหลดข้อมูลจาก 3 ไฟล์
    readCSV("sales_january.csv", "sales_january.csv", head);
    readCSV("sales_february.csv", "sales_february.csv", head);
    readCSV("sales_march.csv", "sales_march.csv", head);

    pid_t pid = fork();

    if (pid < 0) {
        cerr << "Fork failed!" << endl;
        return 1;
    }

    if (pid == 0) { // Child process
        cout << "Process ID " << getpid() << ": Please input OrderID: ";
        int orderId;
        cin >> orderId;

        SalesRecord *rec = findByOrderId(head, orderId);
        if (rec) {
            cout << "Process ID " << getpid() << ": Found in " << rec->month << endl;
            cout << "Process ID " << getpid() << ": OrderID = " << rec->orderId << "," << endl;
            cout << "Process ID " << getpid() << ": Date = " << rec->date << "," << endl;
            cout << "Process ID " << getpid() << ": Region = " << rec->region << "," << endl;
            cout << "Process ID " << getpid() << ": Product = " << rec->product << "," << endl;
            cout << "Process ID " << getpid() << ": Amount = " << rec->amount << endl;
        } else {
            cout << "Process ID " << getpid() << ": OrderID " << orderId << " not found." << endl;
        }
    } else { // Parent process
        cout << "Process ID " << getpid() << ": Please wait ...." << endl;
        wait(NULL);
    }

    return 0;
}