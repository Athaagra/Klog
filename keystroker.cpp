#define WINVER 0x0500
#include <windows.h>

int main()
{
    ShellExecute(NULL, "open", "*****", NULL, NULL, SW_SHOWDEFAULT);
    // This structure will be used to create the keyboard
    // input event.
    INPUT ip;

    // Pause for 5 seconds.
    Sleep(75000);

    // Set up a generic keyboard event.
    ip.type = INPUT_KEYBOARD;
    ip.ki.wScan = 0x11; // DirectInput key scancode for the "A" key
    ip.ki.time = 0;
    ip.ki.dwExtraInfo = 0;

    // Press the key (using scancode to specify which key)
    ip.ki.dwFlags = KEYEVENTF_SCANCODE;
    SendInput(1, &ip, sizeof(INPUT));
    //Sleep(5000);
    // Release the key (again, using scancode to specify which key)
    ip.ki.dwFlags = KEYEVENTF_KEYUP | KEYEVENTF_SCANCODE;
    SendInput(1, &ip, sizeof(INPUT));

    // Exit normally
    return 0;
}
