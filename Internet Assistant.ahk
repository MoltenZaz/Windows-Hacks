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

#Space::return

; F1::F20

~#x::
{
link := "http://192.168.1.135:8123/api/webhook/-luNO5E7VsmbpGIAAfV0c5rHZ"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

~Up & F13:: ; set sound to dac
{
link := "http://192.168.1.135:8123/api/webhook/-luNO5E7VsmbpGIAAfV0c5rHZ"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "Nest Mini" 1
Sleep, 500
SoundSet, 0
Send {Volume_Up}
Send {Volume_Down 50}
Sleep, 1000
; run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Nest Mini" 1
run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "FiiO DAC-E10" 1
run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "FiiO DAC-E10" 2
return
}

~Down & F13:: ; set sound to nest
{
run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "Nest Mini" 1
return
}

F13:: ; light toggle
{
link := "http://192.168.1.135:8123/api/webhook/bedroom-shelly-on-off-Xcvblgf9St8B74w7wxUdrH2s"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

^F13:: ; desk toggle
{
link := "http://192.168.1.135:8123/api/webhook/-uh66rX3WTA-uVLp-keEhMCXl"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

!F13:: ; window toggle
{
link := "http://192.168.1.135:8123/api/webhook/-ZruvR0CI7B7qjT4QZ_d4_q0z"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

+F13:: ; bed toggle
{
link := "http://192.168.1.135:8123/api/webhook/-kRdYSRP_76MSVeWn81EL_5vB"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

#F13:: ; door toggle
{
link := "http://192.168.1.135:8123/api/webhook/-um_OqOss-Xm0lMazNoK28w_V"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

~Space & F13:: ; lamp toggle
{
link := "http://192.168.1.135:8123/api/webhook/-FvIdMrk6DcBbCX-WlXePdmYh"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

~Esc & F13:: ; max brightness and colour temp
{
link := "http://192.168.1.135:8123/api/webhook/-HoxvtKfkiX3vHvv2Je7f1Uni"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

~Backspace & F13:: ; sleep mode
{
link := "http://192.168.1.135:8123/api/webhook/-ssXOar5koCxBm4idW5GkCwUi"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

#IfWinActive, ahk_exe GGST-Win64-Shipping.exe
{
Delete::w
Backspace::m
Esc::Backspace
}
#If

#IfWinActive, ahk_exe cadwin.exe
{
^+z::^y
}
#If

; #IfWinActive, csTimer
; {
	; Joy1::Space
	; Joy2::Space
; }
; #If

#IfWinActive, ahk_exe celeste.exe
{
o::z
e::x
u::c
}
#If

; #IfWinExist, ahk_exe Spotify.exe
; {
; Media_Next::
; {
; IfWinNotExist, Spotify Free
; {
; Send, {LAUNCH_MEDIA}
; Sleep, 100
; }
; Send, {Media_Next}
; IfWinNotExist, Spotify Free
; {
; ; Sleep, 500
; Send, {LAUNCH_MEDIA}
; }
; return
; }

; Media_Prev::
; {
; IfWinNotExist, Spotify Free
; {
; Send, {LAUNCH_MEDIA}
; Sleep, 100
; }
; Send, {Media_Prev}
; IfWinNotExist, Spotify Free
; {
; ; Sleep, 500
; Send, {LAUNCH_MEDIA}
; }
; return
; }

; }
; #if

; #IfWinActive,ahk_exe firefox.exe
; F16::
; {
; while GetKeyState("F16", "P")
; {
;       Send ^{Tab}
;       sleep, 200
; }
; return
; }

; F15::
; {
; while GetKeyState("F15", "P")
; {
;       Send ^+{Tab}
;       sleep, 200
; }
; return
; }
; #If
; #IfWinNotActive,ahk_exe firefox.exe
F15::
{
while GetKeyState("F15", "P")
{
      MouseClick, WheelLeft, , , 1
      sleep, 150
}
return
}

F16::
{
while GetKeyState("F16", "P")
{
      MouseClick, WheelRight, , , 1
      sleep, 150
}
return
}
; #if

; ~RAlt & ~Capslock::
; {
; KeyDown := !KeyDown
; If KeyDown
; {
	; sarcasmtoggle := 1
	; SoundBeep, 500, 50
; }
; Else
; {
	; sarcasmtoggle := 0
	; SoundBeep, 250, 50
	; SetCapsLockState, off
; }
; Return
; }

; #if (sarcasmtoggle = 1)
; {
; ~a::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~b::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~c::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~d::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~e::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~f::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~g::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~h::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~i::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~j::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~k::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~l::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~m::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~n::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~o::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~p::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~q::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~r::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~s::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~t::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~u::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~v::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~w::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~x::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~y::SetCapsLockState % !GetKeyState("CapsLock", "T")
; ~z::SetCapsLockState % !GetKeyState("CapsLock", "T")
; }
; #if

; SarcasmText()
; {
; Random, rand, 0, 4
; if (rand=0)
     ; SetCapsLockState % !GetKeyState("CapsLock", "T")
; if (rand=1)
     ; SetCapsLockState % !GetKeyState("CapsLock", "T")
; if (rand=2)
     ; SetCapsLockState % !GetKeyState("CapsLock", "T")
; if (rand=3)
     ; SetCapsLockState % !GetKeyState("CapsLock", "T")
; if (rand=4)
     ; SetCapsLockState % !GetKeyState("CapsLock", "T")
; return
; }

; Get DEFINITION of selected word.    
; #+d::
; {
; MouseGetPos, , , id, control
; WinGetClass, dclass, ahk_id %id%
; isFullScreen := isWindowFullScreen( "A" )
; IfWinNotActive, ahk_class WorkerW
; IfWinNotActive, ahk_class Progman
; {
; if isFullScreen = 1
; {
; return
; }
; }
; if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
; {
    ; noclip = false
    ; OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    ; Clipboard:= ""
    ; Send, ^c                                            ;Copy selected test to clipboard
    ; ClipWait 0
    ; If ErrorLevel
        ; {
		; noclip = true
        ; ;Return
        ; }
	; if noclip = false
	; {
    		; Run, http://www.google.com/search?q=define+%clipboard%     ; Launch with contents of clipboard
	; }
    ; ClipboardRestore()
	; ;KeyWait, CapsLock
	; ;SetCapsLockState, Off
; }
; Return
; }

; ; GOOGLE the selected text.
; #g::
; {
; MouseGetPos, , , id, control
; WinGetClass, dclass, ahk_id %id%
; isFullScreen := isWindowFullScreen( "A" )
; IfWinNotActive, ahk_class WorkerW
; IfWinNotActive, ahk_class Progman
; {
; if isFullScreen = 1
; {
; return
; }
; }
; if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
; {
	; noclip = false
    ; OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    ; Clipboard:= ""
    ; Send, ^c                                            ;Copy selected test to clipboard
    ; ClipWait 0
    ; If ErrorLevel
        ; {
		; noclip = true
        ; ;Return
        ; }
	; if noclip = false
	; {
    ; Run, http://www.google.com/search?q=%clipboard%             ; Launch with contents of clipboard
	; }
    ; ClipboardRestore()
	; KeyWait, CapsLock
	; SetCapsLockState, Off
; }
; Return
; }

; ; Do google translate of selected word
; #t::
; {
; MouseGetPos, , , id, control
; WinGetClass, dclass, ahk_id %id%
; isFullScreen := isWindowFullScreen( "A" )
; IfWinNotActive, ahk_class WorkerW
; IfWinNotActive, ahk_class Progman
; {
; if isFullScreen = 1
; {
; return
; }
; }
; if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
; {
    ; noclip = false
    ; OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    ; Clipboard:= ""
    ; Send, ^c                                            ;Copy selected test to clipboard
    ; ClipWait 0
    ; If ErrorLevel
        ; {
		; noclip = true
        ; ;Return
        ; }
	; if noclip = false
	; {
    ; Run https://translate.google.com/#view=home&op=translate&sl=auto&tl=en&text=%Clipboard%             ; Launch with contents of clipboard
	; }
    ; ClipboardRestore()
	; KeyWait, CapsLock
	; SetCapsLockState, Off
; }
; Return
; }

; ; Do THESAURUS of selected word
; #+t::
; {
; MouseGetPos, , , id, control
; WinGetClass, dclass, ahk_id %id%
; isFullScreen := isWindowFullScreen( "A" )
; IfWinNotActive, ahk_class WorkerW
; IfWinNotActive, ahk_class Progman
; {
; if isFullScreen = 1
; {
; return
; }
; }
; if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
; {
    ; noclip = false
    ; OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    ; Clipboard:= ""
    ; Send, ^c                                            ;Copy selected test to clipboard
    ; ClipWait 0
    ; If ErrorLevel
        ; {
		; noclip = true
        ; ;Return
        ; }
	; if noclip = false
	; {
    ; Run http://www.thesaurus.com/browse/%Clipboard%             ; Launch with contents of clipboard
	; }
    ; ClipboardRestore()
	; KeyWait, CapsLock
	; SetCapsLockState, Off
; }
; Return
; }

; ; Do WIKIPEDIA of selected word
; #w::
; {
; MouseGetPos, , , id, control
; WinGetClass, dclass, ahk_id %id%
; isFullScreen := isWindowFullScreen( "A" )
; IfWinNotActive, ahk_class WorkerW
; IfWinNotActive, ahk_class Progman
; {
; if isFullScreen = 1
; {
; return
; }
; }
; if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
; {
    ; noclip = false
    ; OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    ; Clipboard:= ""
    ; Send, ^c                                            ;Copy selected test to clipboard
    ; ClipWait 0
    ; If ErrorLevel
        ; {
		; noclip = true
        ; ;Return
        ; }
	; if noclip = false
	; {
    ; Run, https://en.wikipedia.org/wiki/%clipboard%              ; Launch with contents of clipboard
	; }
    ; ClipboardRestore()
	; KeyWait, CapsLock
	; SetCapsLockState, Off
; }	
; Return
; }

; ;search wikipedia
; #+w::
; {
; MouseGetPos, , , id, control
; WinGetClass, dclass, ahk_id %id%
; isFullScreen := isWindowFullScreen( "A" )
; IfWinNotActive, ahk_class WorkerW
; IfWinNotActive, ahk_class Progman
; {
; if isFullScreen = 1
; {
; return
; }
; }
; if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
; {
    ; noclip = false
    ; OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    ; Clipboard:= ""
    ; Send, ^c                                            ;Copy selected test to clipboard
    ; ClipWait 0
    ; If ErrorLevel
        ; {
		; noclip = true
        ; ;Return
        ; }
	; if noclip = false
	; {
    ; Run, https://en.wikipedia.org/w/index.php?search=%clipboard%              ; Launch with contents of clipboard
	; }
    ; ClipboardRestore()
	; KeyWait, CapsLock
	; SetCapsLockState, Off
; }	
; Return
; }

; ; search urban dictionary for selected word
; #u::
; {
; MouseGetPos, , , id, control
; WinGetClass, dclass, ahk_id %id%
; isFullScreen := isWindowFullScreen( "A" )
; IfWinNotActive, ahk_class WorkerW
; IfWinNotActive, ahk_class Progman
; {
; if isFullScreen = 1
; {
; return
; }
; }
; if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
; {
    ; noclip = false
    ; OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    ; Clipboard:= ""
    ; Send, ^c                                            ;Copy selected test to clipboard
    ; ClipWait 0
    ; If ErrorLevel
        ; {
		; noclip = true
        ; ;Return
        ; }
	; if noclip = false
	; {
    ; Run, https://www.urbandictionary.com/define.php?term=%clipboard%           ; Launch with contents of clipboard
	; }
    ; ClipboardRestore()
	; KeyWait, capslock
	; setcapslockstate, Off
; }	
; Return
; }

; ClipboardRestore()
; {
    ; Clipboard:= OldClipboard
; }

; ;stop from changing keyboard / language in windows
; ; #Space::Return

; isFullScreen := isWindowFullScreen( "A" )
; ;MsgBox % isFullScreen ? "Full Screen" : "Windowed"
; isWindowFullScreen( winTitle )
; {
	; ;checks if the specified window is full screen
	
	; winID := WinExist( winTitle )

	; If ( !winID )
		; Return false

	; WinGet style, Style, ahk_id %WinID%
	; WinGetPos ,,,winW,winH, %winTitle%
	; ; 0x800000 is WS_BORDER.
	; ; 0x20000000 is WS_MINIMIZE.
	; ; no border and not minimized
	; Return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
; }