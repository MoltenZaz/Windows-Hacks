Menu, Tray, Icon, shell32.dll, 14

#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Select a word or phrase and press a hotkey to search it on the internet.
;Win+G searches on google.
;Win+Shift+D defines on google.
;Win+T translates on google translate.
;Win+Shift+T searches on thesaurus.com.
;Win+U searches on urban dictionary.
;Win+W opens the wikipedia article.
;Win+Shift+W searches on wikipedia.
;RAlt+Capslock toggles SaRcASM tExT.

NumpadClear::NumpadDown

#IfWinExist, ahk_exe Spotify.exe
{
Media_Next::
{
IfWinNotExist, Spotify Free
{
Send, {LAUNCH_MEDIA}
Sleep, 100
}
Send, {Media_Next}
IfWinNotExist, Spotify Free
{
; Sleep, 500
Send, {LAUNCH_MEDIA}
}
return
}

Media_Prev::
{
IfWinNotExist, Spotify Free
{
Send, {LAUNCH_MEDIA}
Sleep, 100
}
Send, {Media_Prev}
IfWinNotExist, Spotify Free
{
; Sleep, 500
Send, {LAUNCH_MEDIA}
}
return
}

}
#if

#IfWinNotActive,ahk_exe photoshop.exe
F15::
{
while GetKeyState("F15", "P")
{
      MouseClick, WheelLeft, , , 1
      sleep, 50
}
return
}

F16::
{
while GetKeyState("F16", "P")
{
      MouseClick, WheelRight, , , 1
      sleep, 50
}
return
}
#if

#IfWinActive,ahk_exe photoshop.exe
F16::
{
while GetKeyState("F16", "P")
{
      MouseClick, WheelLeft, , , 1
      sleep, 10
}
return
}

F15::
{
while GetKeyState("F15", "P")
{
      MouseClick, WheelRight, , , 1
      sleep, 10
}
return
}
#If

~RAlt & ~Capslock::
{
KeyDown := !KeyDown
If KeyDown
{
	sarcasmtoggle := 1
	SoundBeep, 500, 50
}
Else
{
	sarcasmtoggle := 0
	SoundBeep, 250, 50
	SetCapsLockState, off
}
Return
}

#if (sarcasmtoggle = 1)
{
~a::SarcasmText()
~b::SarcasmText()
~c::SarcasmText()
~d::SarcasmText()
~e::SarcasmText()
~f::SarcasmText()
~g::SarcasmText()
~h::SarcasmText()
~i::SarcasmText()
~j::SarcasmText()
~k::SarcasmText()
~l::SarcasmText()
~m::SarcasmText()
~n::SarcasmText()
~o::SarcasmText()
~p::SarcasmText()
~q::SarcasmText()
~r::SarcasmText()
~s::SarcasmText()
~t::SarcasmText()
~u::SarcasmText()
~v::SarcasmText()
~w::SarcasmText()
~x::SarcasmText()
~y::SarcasmText()
~z::SarcasmText()
}
#if

SarcasmText()
{
Random, rand, 0, 4
if (rand=0)
     SetCapsLockState % !GetKeyState("CapsLock", "T")
if (rand=1)
     SetCapsLockState % !GetKeyState("CapsLock", "T")
if (rand=2)
     SetCapsLockState % !GetKeyState("CapsLock", "T")
if (rand=3)
     SetCapsLockState % !GetKeyState("CapsLock", "T")
if (rand=4)
     return
return
}

; Get DEFINITION of selected word.    
#+d::
{
MouseGetPos, , , id, control
WinGetClass, dclass, ahk_id %id%
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
    noclip = false
    OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    Clipboard:= ""
    Send, ^c                                            ;Copy selected test to clipboard
    ClipWait 0
    If ErrorLevel
        {
		noclip = true
        ;Return
        }
	if noclip = false
	{
    		Run, http://www.google.com/search?q=define+%clipboard%     ; Launch with contents of clipboard
	}
    ClipboardRestore()
	;KeyWait, CapsLock
	;SetCapsLockState, Off
}
Return
}

; GOOGLE the selected text.
#g::
{
MouseGetPos, , , id, control
WinGetClass, dclass, ahk_id %id%
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
	noclip = false
    OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    Clipboard:= ""
    Send, ^c                                            ;Copy selected test to clipboard
    ClipWait 0
    If ErrorLevel
        {
		noclip = true
        ;Return
        }
	if noclip = false
	{
    Run, http://www.google.com/search?q=%clipboard%             ; Launch with contents of clipboard
	}
    ClipboardRestore()
	KeyWait, CapsLock
	SetCapsLockState, Off
}
Return
}

; Do google translate of selected word
#t::
{
MouseGetPos, , , id, control
WinGetClass, dclass, ahk_id %id%
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
    noclip = false
    OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    Clipboard:= ""
    Send, ^c                                            ;Copy selected test to clipboard
    ClipWait 0
    If ErrorLevel
        {
		noclip = true
        ;Return
        }
	if noclip = false
	{
    Run https://translate.google.com/#view=home&op=translate&sl=auto&tl=en&text=%Clipboard%             ; Launch with contents of clipboard
	}
    ClipboardRestore()
	KeyWait, CapsLock
	SetCapsLockState, Off
}
Return
}

; Do THESAURUS of selected word
#+t::
{
MouseGetPos, , , id, control
WinGetClass, dclass, ahk_id %id%
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
    noclip = false
    OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    Clipboard:= ""
    Send, ^c                                            ;Copy selected test to clipboard
    ClipWait 0
    If ErrorLevel
        {
		noclip = true
        ;Return
        }
	if noclip = false
	{
    Run http://www.thesaurus.com/browse/%Clipboard%             ; Launch with contents of clipboard
	}
    ClipboardRestore()
	KeyWait, CapsLock
	SetCapsLockState, Off
}
Return
}

; Do WIKIPEDIA of selected word
#w::
{
MouseGetPos, , , id, control
WinGetClass, dclass, ahk_id %id%
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
    noclip = false
    OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    Clipboard:= ""
    Send, ^c                                            ;Copy selected test to clipboard
    ClipWait 0
    If ErrorLevel
        {
		noclip = true
        ;Return
        }
	if noclip = false
	{
    Run, https://en.wikipedia.org/wiki/%clipboard%              ; Launch with contents of clipboard
	}
    ClipboardRestore()
	KeyWait, CapsLock
	SetCapsLockState, Off
}	
Return
}

;search wikipedia
#+w::
{
MouseGetPos, , , id, control
WinGetClass, dclass, ahk_id %id%
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
    noclip = false
    OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    Clipboard:= ""
    Send, ^c                                            ;Copy selected test to clipboard
    ClipWait 0
    If ErrorLevel
        {
		noclip = true
        ;Return
        }
	if noclip = false
	{
    Run, https://en.wikipedia.org/w/index.php?search=%clipboard%              ; Launch with contents of clipboard
	}
    ClipboardRestore()
	KeyWait, CapsLock
	SetCapsLockState, Off
}	
Return
}

; search urban dictionary for selected word
#u::
{
MouseGetPos, , , id, control
WinGetClass, dclass, ahk_id %id%
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
    noclip = false
    OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    Clipboard:= ""
    Send, ^c                                            ;Copy selected test to clipboard
    ClipWait 0
    If ErrorLevel
        {
		noclip = true
        ;Return
        }
	if noclip = false
	{
    Run, https://www.urbandictionary.com/define.php?term=%clipboard%           ; Launch with contents of clipboard
	}
    ClipboardRestore()
	KeyWait, capslock
	setcapslockstate, Off
}	
Return
}

ClipboardRestore()
{
    Clipboard:= OldClipboard
}

;stop from changing keyboard / language in windows
; #Space::Return

isFullScreen := isWindowFullScreen( "A" )
;MsgBox % isFullScreen ? "Full Screen" : "Windowed"
isWindowFullScreen( winTitle )
{
	;checks if the specified window is full screen
	
	winID := WinExist( winTitle )

	If ( !winID )
		Return false

	WinGet style, Style, ahk_id %WinID%
	WinGetPos ,,,winW,winH, %winTitle%
	; 0x800000 is WS_BORDER.
	; 0x20000000 is WS_MINIMIZE.
	; no border and not minimized
	Return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
}
