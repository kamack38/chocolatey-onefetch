; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
SetBatchLines, -1

winTitle = Au_.exe

WinWait, ahk_exe %winTitle%,, 360
; WinHide, ahk_exe %winTitle%

; Next
sleep, 200
ControlClick, Button2, ahk_exe %winTitle%

; Uninstall
sleep, 200
ControlClick, Button2, ahk_exe %winTitle%

; Wait for uninstall
sleep, 100
ControlGet, available, Enabled,, Button2, ahk_exe %winTitle%
While (available = False) {
    ControlGet, available, Enabled,, Button2, ahk_exe %winTitle%
    sleep, 100
}

; Exit
sleep, 200
ControlClick, Button2, ahk_exe %winTitle%

Exit