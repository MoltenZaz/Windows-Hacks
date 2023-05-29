#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2

Sleep, 5000
Run Alt Acceleration Disabler.ahk
; Run Audio Fix.ahk
; Run Creative Helper.ahk
Run Firefox Keyboard and Mouse.ahk
Run Internet Assistant.ahk
; Run MIDI Control.lnk
Run Time Fix.ahk
; Run Numpad Light.ahk
run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /Mute "Consoles"
Sleep, 5000
Send, {Alt}
; Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Synthesia.lnk"
; DetectHiddenWindows, On
; WinWait, Synthesia

; ; WinHide, Synthesia
; ; CoordMode, Mouse, Client
; Sleep, 1
; ControlGet, OutputVar, Hwnd,,, Synthesia
; ControlFocus,,ahk_id %outputvar%
; ;WinShow, Synthesia
; ; WinHide, Synthesia
; ;WinActivate, ahk_exe Synthesia.exe
; ControlFocus,,ahk_id %outputvar%
; ControlClick, x200 y400, ahk_exe Synthesia.exe
; ControlFocus,,ahk_id %outputvar%
; ControlClick, x600 Y375, ahk_exe Synthesia.exe
; ; Sleep, 100
; ; ControlSend, {WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}, Synthesia
; ; Sleep, 100
; ControlFocus,,ahk_id %outputvar%
; ControlClick,, ahk_exe Synthesia.exe,, WheelDown, 20
; ControlFocus,,ahk_id %outputvar%
; ControlClick, x900 y700, ahk_exe Synthesia.exe
; ; Sleep, 1000
; WinHide, Synthesia