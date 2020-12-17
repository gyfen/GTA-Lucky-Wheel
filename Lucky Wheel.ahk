#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#SingleInstance force ; only one instance of script can run
;https://github.com/gyfen/GTA-Lucky-Wheel
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

ScriptName := "GTA5LuckyWheelSpinScriptAHK"

delay := 2693 ; Edit this value to change the spinning speed: higher value = slower spin. Utilize Binary Search algorithm to optimize correct value search.

; Use this routine to set your own coordinates of wheel spin dialogue. The
; current number are valid for 2K monitor. Put the coordinates of the white
; area in wheel spin dialogue in xx and yy variables.
f2::
    xx := 485
    yy := 45
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\%ScriptName%, coord_x, %xx%
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\%ScriptName%, coord_y, %yy%
    ; Coordinate of white area in wheel spin dialogue.
    RegRead, spin_coord_x, HKEY_CURRENT_USER\SOFTWARE\%ScriptName%, coord_x
    RegRead, spin_coord_y, HKEY_CURRENT_USER\SOFTWARE\%ScriptName%, coord_y

    Tooltip Wheel spin dialogue coordinates: x = %spin_coord_x%`, y = %spin_coord_y%. Saved to registry. , 0, 0
    SetTimer, RemoveToolTip, 5000
Return

CoordMode, ToolTip, Screen

f1:: ;Start the script.
    start := A_TickCount ; Will be used to determine how much time spent in infinite loop.
    SendInput {enter down}
    DllCall("Sleep",UInt,50)
    SendInput {enter up}
    DllCall("Sleep",UInt,500)
    Loop
    {
        elapsed := A_TickCount-start
        if (elapsed > 4000) {
            Tooltip Sorry`, script failed to detect a wheel spin dialogue. Try to recalibrate the script: press CAPSLOCK to do that. , 0, 0
            SetTimer, RemoveToolTip, 10000
            Break
        }
        ; Coordinate of white area in wheel spin dialogue.
        RegRead, spin_coord_x, HKEY_CURRENT_USER\SOFTWARE\%ScriptName%, coord_x
        RegRead, spin_coord_y, HKEY_CURRENT_USER\SOFTWARE\%ScriptName%, coord_y
        Tooltip Waiting for wheel spin dialogue to appear. %elapsed% ms..., 0, 0
            PixelGetColor, color, spin_coord_x, spin_coord_y, RGB
        If (color = 0xE5E5E5)
        {
            Tooltip Waiting %delay% ms..., 0, 0
            DllCall("Sleep",UInt,delay)
            SendInput {s down}
            DllCall("Sleep",UInt,500)
            SendInput {s up}
            Break
        }
    }
Return

^!a:: ;Kill GTA V

    Process, Close, GTA5.exe
Return

CAPSLOCK::
    Tooltip
    CoordMode, ToolTip, Screen ; makes tooltip to appear at position, relative to screen.
    CoordMode, Mouse, Screen ; makes mouse coordinates to be relative to screen.
    MouseGetPos xx, yy ; get mouse x and y position, store as %xx% and %yy%
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\%ScriptName%, coord_x, %xx%
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\%ScriptName%, coord_y, %yy%
    tooltip Put the cursor over the white area in a wheel spin dialogue and press CAPSLOCK. Cursor coordinates: x = %xx%`, y = %yy%. Saved to registry., 0, 0 ; display tooltip of %xx% %yy% at coordinates x0 y0.
    SetTimer, RemoveToolTip, 2000
    SetCapsLockState, Off
Return

RemoveToolTip:
    ToolTip
return

