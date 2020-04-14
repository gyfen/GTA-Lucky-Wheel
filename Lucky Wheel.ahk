#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

delay := 2665 ;Edit this value to change the spinning speed: higher value = slower spin

CoordMode, ToolTip, Screen

f1:: ;Start the script.
    SendInput {enter down}
    DllCall("Sleep",UInt,50)
    SendInput {enter up}
    DllCall("Sleep",UInt,500)
    Loop
    {
        PixelGetColor, color, 106, 38, RGB
        If (color = 0xE5E5E5)
        {
            Tooltip Waiting %delay% ms..., 0, 0
            DllCall("Sleep",UInt,delay)
            SendInput {s down}
            DllCall("Sleep",UInt,500)
            SendInput {s up}
            Tooltip
            Break
        }
    }
    Return

^!a:: ;Kill GTA V
    Process, Close, GTA5.exe
    Return
