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
    char month[30]; // ใช้เก็บชื่อไฟล์/เดือน
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
        strncpy(node->month, month.c_str(), 29);
        node->month[29] = '\0';

        node->next = head;
        head = node;
    }
    file.close();
}

// หา total ตาม Region
double findTotalByRegion(SalesRecord *head, const string &region) {
    double total = 0;
    SalesRecord *curr = head;
    while (curr != nullptr) {
        if (region == curr->region) {
            total += curr->amount;
        }
        curr = curr->next;
    }
    return total;
}

// หา total ตาม Product
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

    cout << "===== Sales Record System =====" << endl;
    cout << "1. Find total amount by Region" << endl;
    cout << "2. Find total amount by Product" << endl;
    cout << "3. Find sales record by OrderID" << endl;
    cout << "Choose option (1-3): ";
    int choice;
    cin >> choice;
    cin.ignore(); // flush newline

    pid_t pid = fork();

    if (pid < 0) {
        cerr << "Fork failed!" << endl;
        return 1;
    }

    if (pid == 0) { // Child
        if (choice == 1) {
            cout << "Process ID " << getpid() << ": Please input region: ";
            string region;
            getline(cin, region);

            double total = findTotalByRegion(head, region);
            cout << "Process ID " << getpid()
                 << ": The total amount of region " << region
                 << " from January to March is " << total << endl;

        } else if (choice == 2) {
            cout << "Process ID " << getpid() << ": Please input product name: ";
            string product;
            getline(cin, product);

            double total = findTotalByProduct(head, product);
            cout << "Process ID " << getpid()
                 << ": The total amount of \"" << product
                 << "\" from January to March is " << total << endl;

        } else if (choice == 3) {
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

        } else {
            cout << "Invalid option!" << endl;
        }
    } else { // Parent
        cout << "Process ID " << getpid() << ": Please wait ...." << endl;
        wait(NULL);
    }

    return 0;
}