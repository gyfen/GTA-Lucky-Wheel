#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

delay := 4250 ;Edit this value to change the spinning speed: higher value = slower spin
isrunning = 0

CoordMode, ToolTip, Screen

f1:: ;Start the script.
    isrunning = 1
    SendInput {enter down}
    DllCall("Sleep",UInt,50)
    SendInput {enter up}
    DllCall("Sleep",UInt,500)
    While (isrunning = 1)
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
            isrunning = 0
        }
    }
    Return

^!a:: ;Kill GTA V
    Process, Close, GTA5.exe
    Return