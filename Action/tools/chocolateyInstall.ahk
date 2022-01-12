; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
SetBatchLines, -1

winTitle = action_setup.exe

WinWait, ahk_exe %winTitle%,, 360
; WinHide, ahk_exe %winTitle%

; Select Language
sleep, 100
ControlClick, Button1, ahk_exe %winTitle%

; Next
sleep, 100
ControlClick, Button2, ahk_exe %winTitle%

; Agree
WinWait, ahk_exe %winTitle%,, 20
sleep, 100
ControlClick, Button2, ahk_exe %winTitle%

; Wait for install
sleep, 400
ControlGet, available, Enabled,, Button2, ahk_exe %winTitle%
While (available = False) 
    ControlGet, available, Enabled,, Button2, ahk_exe %winTitle%

; Exit
sleep, 200
ControlClick, Button2, ahk_exe %winTitle%

Exit