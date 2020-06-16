Menu, Tray, Icon, networkexplorer.dll, 15

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

qw := DllCall("LoadKeyboardLayoutW", "Str", "04090409", "Int", 1)
dv := DllCall("LoadKeyboardLayoutW", "Str", "00010409", "Int", 1)
; dv := DllCall("LoadKeyboardLayoutW", "Str", "F0020C09", "Int", 1)
dvorak = 1
Sleep, 1000
SetLayout(dv)

#If (dvorak = 1)
~LControl::SetLayout(qw)
~LControl up::SetLayout(dv)
~RControl::SetLayout(qw)
~RControl up::SetLayout(dv)
~LAlt::SetLayout(qw)
~LAlt up::SetLayout(dv)
~RAlt::SetLayout(qw)
~RAlt up::SetLayout(dv)
~LWin::SetLayout(qw)
~LWin up::SetLayout(dv)
~RWin::SetLayout(qw)
~RWin up::SetLayout(dv)
#if

SetLayout(language)
{
ControlGetFocus, control, A
PostMessage 0x50, 0, %language%, %control%, A ; WM_INPUTLANGCHANGEREQUEST
}

Insert::
{
If (dvorak = 1)
{
SetLayout(qw)
SoundBeep, 300, 150
SoundBeep, 300, 150
dvorak := 0
}
else
{
SetLayout(dv)
SoundBeep, 300, 50
SoundBeep, 300, 50
SoundBeep, 300, 50
dvorak := 1
}
return
}

~!Insert::
{
SetTimer, Refresh, 60000
return
}

Refresh:
{
Reload
return
}

#IfWinNotActive, ahk_class UnrealWindow
{
CapsLock::Backspace
!Backspace::CapsLock
}
#if

#IfWinActive, ahk_class UnrealWindow
{
CapsLock::Delete
!Backspace::CapsLock
}
#if
