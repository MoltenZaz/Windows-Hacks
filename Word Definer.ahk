Menu, Tray, Icon, shell32.dll, 23

#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;================================================================================================
;  CapsLock processing.  Must double tap CapsLock to toggle CapsLock mode on or off.
;================================================================================================
; Must double tap CapsLock to toggle CapsLock mode on or off.
;CapsLock::
 ;   KeyWait, CapsLock                                                   ; Wait forever until Capslock is released.
  ;  KeyWait, CapsLock, D T0.2                                           ; ErrorLevel = 1 if CapsLock not down within 0.2 seconds.
   ; if ((ErrorLevel = 0) && (A_PriorKey = "CapsLock") )                 ; Is a double tap on CapsLock?
    ;    {
     ;  SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"  ; Toggle the state of CapsLock LED
      ;  }
;return



;================================================================================================
; Hot keys with CapsLock modifier.  See https://autohotkey.com/docs/Hotkeys.htm#combo
;================================================================================================
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

; Do THESAURUS of selected word
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