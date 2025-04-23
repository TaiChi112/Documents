#include <windows.h>

LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam) {
    if (uMsg == WM_PAINT) {
        PAINTSTRUCT ps;
        HDC hdc = BeginPaint(hwnd, &ps);
        FillRect(hdc, &ps.rcPaint, (HBRUSH)(COLOR_WINDOW+1)); // สีขาว
        EndPaint(hwnd, &ps);
        return 0;
    }
    else if (uMsg == WM_DESTROY) {
        PostQuitMessage(0);
        return 0;
    }
    return DefWindowProc(hwnd, uMsg, wParam, lParam);
}

int main() {
    // Register window class
    WNDCLASS wc = {0};
    wc.lpfnWndProc = WindowProc;
    wc.hInstance = GetModuleHandle(NULL);
    wc.lpszClassName = "MyWindowClass";
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);  // ชี้เมาส์ปกติ
    
    RegisterClass(&wc);

    // Create borderless window
    HWND hwnd = CreateWindowEx(
        0,
        "MyWindowClass",
        "My Custom GUI", // ชื่อหน้าต่าง (แม้จะไม่โชว์ก็มีประโยชน์)
        // WS_POPUP, // ไม่มีกรอบ ไม่มีปุ่ม
        WS_OVERLAPPEDWINDOW,    // << Style ที่ทำให้ move/resize ได้
        100, 100, 640, 480,
        NULL, NULL, GetModuleHandle(NULL), NULL
    );

    ShowWindow(hwnd, SW_SHOW);
    UpdateWindow(hwnd); // บังคับ redraw

    // Event loop
    MSG msg = {0};
    while (GetMessage(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    return 0;
}
