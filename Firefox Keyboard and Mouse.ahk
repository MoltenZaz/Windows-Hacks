Menu, Tray, NoIcon
#InputLevel 0
#NoEnv
#SingleInstance force
#Include VA.ahk
SendMode Input
SetTitleMatchMode, 2
DetectHiddenWindows On
SetWorkingDir %A_ScriptDir%
#UseHook
#MaxHotkeysPerInterval 10000
SetControlDelay -1
VMouse := 0
SetBatchLines, -1
CoordMode, Mouse
SetWinDelay,0

; Run Dvorak.ahk
; Run Symbol Layer.ahk
; Run Easy Window Organiser.ahk
Run Komorebi.ahk
Run Creative Helper.ahk

DoFocus = 1
ctrltoggle = 0
shifttoggle = 0
alttoggle = 0
wintoggle = 0
mastertoggle = 0
FFNow = 0
FFSafe := ""
Full = 0
xoffset = 0
yoffset = 0

; ; ; ; ; Blacklist for F24 Media controls

; GroupAdd, Blacklist, ahk_exe acad.exe
; GroupAdd, Blacklist, ahk_exe Revit.exe
; GroupAdd, Blacklist, ahk_exe cadwin.exe
GroupAdd, Blacklist, ahk_exe happrentice.exe
GroupAdd, Blacklist, ahk_exe houdinifx.exe
GroupAdd, Blacklist, ahk_exe houdini.exe
GroupAdd, Blacklist, ahk_exe mplay.exe

; GroupAdd, M3GRP, ahk_exe acad.exe
; GroupAdd, M3GRP, ahk_exe Revit.exe
; GroupAdd, M3GRP, ahk_exe cadwin.exe

; GroupAdd, F21GRP, ahk_exe happrentice.exe
; GroupAdd, F21GRP, ahk_exe houdinifx.exe
; GroupAdd, F21GRP, ahk_exe houdini.exe
; GroupAdd, F21GRP, ahk_exe mplay.exe

hGui := CreateGui()
Sleep, 1000
Menu, Tray, Icon
Menu, Tray, Icon, networkexplorer.dll, 15
CreateGui()
{
Gui, New, -Caption +ToolWindow +AlwaysOnTop +hwndhGui
; Gui, Color, Blue
; Gui, Show, w32 h32 HIDE
Gui, Color, FAFAFA
Gui, Add, Picture, x0 y0 w32 h32 , Cursor.png
Gui, Show, w32 h32
Gui +LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, FAFAFA
Gui -Caption
Gui, Hide
Return hGui
}

WinWait, ahk_class MozillaWindowClass
WinGetPos,FFX,FFY,FFW,FFH, ahk_class MozillaWindowClass
WinGet, FFSafe, ID, ahk_class MozillaWindowClass
x = 0
y = 15
x += %FFW%
x -= 150
; x := FFW/2
; y := FFH/2
; x := RegExReplace(x, "\.\d*")
; y := RegExReplace(y, "\.\d*")
Gui, %hGui%: Show, % "NA x" x . " y" y
ControlClick, x%x% y%y%, ahk_id %FFSafe%,,, NA
Gui, %hGui%: Hide
; MsgBox, %x% %y% %FFSafe%

; Proudly Created by Mitchell Thomas

; This script enables me to use firefox in the background.
; If you press the menu/appskey (to the right of the right windows key on a full sized keyboard)
; as a modifier for another key the key you pressed will be sent to firefox in the background.
; This means you can fiddle with firefox without tabbing out of a game!
; When used in conjunction with the "Vimium" extension it enables easy navigation.

; Vimium firefox: https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
; Vimium chrome: https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)

; Here are my Vimium custom key mappings (remove the semicolons): 
; unmapAll
; map <backspace> goBack2
; map \ LinkHints.activateMode
; map | LinkHints.activateModeToOpenInNewTab

; This means by pressing \ an overlay appears on all visable links on a webpage, you then type
; the assigned key combiniation to the link you want to click and vimium shall click it for you!

; I have it setup so that most common hotkey combinations will work (ctrl, alt, shift, ctrl + shift)
; The numpad is setup to change volume for my headphones when pressed without a hotkey, but when ctrl is used it
; will change the volume on my xbox and nintendo switch, which is hooked into line in and the audio out from my monitor's hdmi

; Hold ctrl and use the volume keys/wheel to change the volume of firefox/vlc/plex in the windows mixer. 
; Hold AppsKey and use the volume keys/wheel to control the volume of the application that is currently focused in the same way, including games!
; Use the AppsKey with the numpad to set to a specific volume ie AppsKey+Numpad1 = 10% volume.

; This script could be adapted to work with Google Chrome, 
; I have an older version that works on my github: https://github.com/MoltenZaz/Windows-Hacks/blob/master/Chrome%20Keyboard.ahk
; I think chrome needs the controlfocus command in order for it to work.

; Rarely a game will require you to reload the script after opening it to work, GTA V is the only example i've come across

; You can toggle the script to be always on by double pressing appskey (so that you dont have to keep holding appskey while typing)

; ^Pause::Run, "F:\Documents\AHK Current\Launch Scripts.ahk" ; "

!WheelUp::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolume(4)
return
}
!WheelDown::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolume(-4)
return
}

!+WheelUp::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolume(2)
return
}
!+WheelDown::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolume(-2)
return
}


!Pause::ControlClick, x0 y0, ahk_exe Discord.exe

; XButton1::XButton1
; XButton2::XButton2

~XButton2 & WheelUp::Volume_Up
~XButton2 & WheelDown::Volume_Down

~XButton2 & F16::Media_Next
~XButton2 & F15::Media_Prev

; ~XButton1 & WheelUp::AppVolume("Spotify.exe").AdjustVolume(2)
; ~XButton1 & WheelDown::AppVolume("Spotify.exe").AdjustVolume(-2)

~XButton1 & WheelUp::SendToFF("Key","{Ctrl down}{Alt down}{Up}{Alt up}{Ctrl up}")
~XButton1 & WheelDown::SendToFF("Key","{Ctrl down}{Alt down}{Down}{Alt up}{Ctrl up}")

; F19::XButton1
; F14::XButton2

; F14 & WheelUp::Volume_Up
; F14 & WheelDown::Volume_Down

; F19 & WheelUp::AppVolume("Spotify.exe").AdjustVolume(1)
; F19 & WheelDown::AppVolume("Spotify.exe").AdjustVolume(-1)

; #IfWinActive ahk_group ESCGRP
; {
	; F24::Esc
; }
; #if

; #IfWinActive ahk_group M3GRP
; {
	; F24::Esc
	; F20::MButton
; }
; #if

; #IfWinActive ahk_group F21GRP
; {
	; F20::F21
; }
; #if

#IfWinNotActive ahk_group Blacklist
{
	*F24::
	{
		; MB = 1
		; PL = 1
		Send {Media_Play_Pause down}
		KeyWait, F24
		Send {Media_Play_Pause up}
		; If (PL = 1)
			; Send {Media_Play_Pause}
		; MB = 0
		; PL = 0
		return
	}
}
#if

; #If MB = 1 and IfWinNotActive ahk_group Blacklist
; {
	; WheelUp::
	; {
		; AppVolume("Spotify.exe").AdjustVolume(1)
		; PL = 0
		; return
	; }
	; WheelDown::
	; {
		; AppVolume("Spotify.exe").AdjustVolume(-1)
		; PL = 0
		; return
	; }

	; XButton2::
	; {
		; Send {Media_Next}
		; PL = 0
		; return
	; }
	; XButton1::
	; {
		; Send {Media_Prev}
		; PL = 0
		; return
	; }
	; F14::
	; {
		; Send {Media_Next}
		; PL = 0
		; return
	; }
	; ; F24 & F20::Media_Play_Pause
	; ; F24 & 3::Media_Play_Pause
	; ; F24 & F21::Media_Play_Pause
	; ; F24 & `::Media_Play_Pause

	; MButton::
	; {
		; IfWinExist ahk_exe Spotify.exe
		; {
			; DetectHiddenWindows, On
			; WinGet, winInfo, List, ahk_exe Spotify.exe
			; Loop, %winInfo%
			; {
				; thisID := winInfo%A_Index%
				; ControlFocus , , ahk_id %thisID%
				; ControlSend, , {space}, ahk_id %thisID%
			; }
		; }
		; else
		; {
			; run "C:\Users\mkenn\AppData\Roaming\Spotify\Spotify.exe"
			; ; SetTitleMatchMode 2
			; ; Run, "C:\Users\mkenn\AppData\Roaming\Spotify\Spotify.exe", , Min
			; ; WinWait Spotify.exe
			; ; WinShow
		; }
		; PL = 0
		; return
	; }
; }
; #if

; !Delete::
; ;~F24 & XButton1::
; {
; if mastertoggle = 1
; {
; mastertoggle := 0
; VMouse := 0
; }
; else
; {
; mastertoggle := 1
; VMouse := 1
; Gui, %hGui%: Show, % "NA x" 4400 . " y" 800
; SetTimer, VirtualMouse, 100
; }
; SetTimer, SendToFF, 10
; return
; }
; }
; #if

; #IfWinExist, ahk_exe Spotify.exe
; {
; ; #If MB = 1
; ; {
; ~F24 & Media_Next::
; ~F24 & XButton2::
; {
; ; IfWinNotExist, Spotify Free
; ; ; Skip to the Next song.
; ; DetectHiddenWindows, On
; ; WinGet, winInfo, List, ahk_exe Spotify.exe
; ; Loop, %winInfo%
; ; {
    ; ; thisID := winInfo%A_Index%
    ; ; ControlFocus , , ahk_id %thisID%
    ; ; ControlSend, , ^{right}, ahk_id %thisID%
; ; }
; ; return
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

; ~F24 & Media_Prev::
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
; ; }
; ; #if
; #if

; ~LButton::
; {
; IfWinActive, ahk_id %FFSafe%
; {
; DoFocus := 0
; WinWaitNotActive, ahk_id %FFSafe%
; DoFocus := 1
; return
; }
; return
; }
; #if

AppsKey::
{
	; GoSub, SendToFF
	mastertoggle := 1
	VMouse := 1
	Gui, %hGui%: Show, % "NA x" 4400 . " y" 800
	GoSub, VirtualMouse
	return
}

AppsKey Up::
{
	mastertoggle := 0
	VMouse := 0
	return
}

; ──────────────────────────────────── This section automatically focuses the firefox window on my second monitor ────────────────────────────────────
SendToFF(InputType,Key)
{
	global
	FFArray := []
	FCount := 0
		DetectHiddenWindows Off
		WinGet, FFList, List, ahk_exe firefox.exe
		WinGet, FCount, Count, ahk_exe firefox.exe
		Loop %FCount%
		{
			If FCount >= 0
			FFNow := FFList%FCount%
			; MsgBox, now %FFNow% safe %FFSafe%
			Gui,+LastFound
			WinGetPos,gx,gy,gw,gh, ahk_class AutoHotkeyGUI
			; MsgBox, %gx% %gy% %gw% %gh%
			; MsgBox, %gx% %gy% %gw% %gh% %FFSafe%
			; If (gx = "")
			; {
				; ; FFSafe = %FFNow%
				; gx := 3800
				; gy := 800
				; ; Sleep, 500
				; ; SoundBeep
			; }
			WinGetPos,FFX,FFY,FFW,FFH, ahk_id %FFNow%
			If (gx >= FFX && gx < FFX+FFW) && (gy >= FFY && gy < FFY+FFH)
			{
				FFSafe = %FFNow%
				; SoundBeep
			}
			If (FFW = 1920 && FFH = 1080)  ; && (xoffset != 3440 && yoffset != 162) 		; This is for when a video is fullscreen
			{
				FFSafe = %FFNow%
			}
			; If (FFSafe = "")
			; {
				; FFSafe = %FFNow%
				; ; gx = 3800
				; ; gy = 800
				; Sleep, 500
				; SoundBeep
			; }
			If (FFSafe = FFNow)
			{
				; SoundBeep
				If (InputType = "Click")
				{
					x = %gx%
					y = %gy%
					x -= FFX
					y -= FFY
					If (Key = "L")
						ControlClick, x%x% y%y%, ahk_id %FFSafe%,,, NA
					Else
						ControlClick, x%x% y%y%, ahk_id %FFSafe%,, %Key%,, NA	
				}
				If (InputType = "Key")
				{
					ControlSend, ahk_parent, %Key%, ahk_id %FFSafe%
				}
			}
			FCount--
		}
return FFSafe
}
; ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

VirtualMouse:
{
SetTimer, VirtualMouse, Off
Global VMouse
While VMouse = 1
			{
				MouseGetPos, MX, MY
				if MX+2500<3440
				MX = 3440
				if MX+2500>5380
				MX = 5380
				if MY<162
				MY = 162
				if MY>1242
				MY = 1242
				WinMove, Firefox Keyboard and Mouse.ahk,, MX+2500, MY
				Sleep, 1
			}
			Gui, %hGui%: Hide
return
}

#InputLevel 2
#If (mastertoggle = 1)
{
LCtrl::
{
	; SendInput, {F13 Down}
	ctrltoggle := 1
	keywait Ctrl
	; SendInput, {F13 Up}
	ctrltoggle := 0
	return
}

LShift::
{
	shifttoggle := 1
	keywait Shift
	shifttoggle := 0
	return
}

LAlt::
{
	; SendInput, {F13 Down}
	alttoggle := 1
	keywait Alt
	; SendInput, {F13 Up}
	alttoggle := 0
	return
}
RCtrl::
{
	; SendInput, {F13 Down}
	ctrltoggle := 1
	keywait Ctrl
	; SendInput, {F13 Up}
	ctrltoggle := 0
	return
}

RShift::
{
	shifttoggle := 1
	keywait Shift
	shifttoggle := 0
	return
}

RAlt::
{
	; SendInput, {F13 Down}
	alttoggle := 1
	keywait Alt
	; SendInput, {F13 Up}
	alttoggle := 0
	return
}
}
#if

; ──────────────────────────────────────── Virtual Mouse ────────────────────────────────────────

#If (VMouse = 1)
{
	LButton::  ; try to change this to be based on the windows position and do some math so that it always clicks where the gui element is, even when it is moved or resized, have it choose the window based on the monitor rather than the resolution and try making it safe for having multiple
	{
	FFSafe := SendToFF("Click","L")
	; Gui,+LastFound
	; WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	; WinGetPos,fx,fy,fw,fh, ahk_id %FFSafe%
	; MsgBox, x:%x% y:%y% fx:%fx% fy:%fy% %FFSafe%
	; x -= fx
	; y -= fy
	; ControlClick, x%x% y%y%, ahk_id %FFSafe%,,, NA
	; MsgBox, %x% %y%
	return
	}

	RButton::FFSafe := SendToFF("Click","R")
	; {
	; Gui,+LastFound
	; WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	; x -= 3432
	; y -= 154
	; ; MsgBox, %x% %y%
	; ControlClick, x%x% y%y%, ahk_id %FFSafe%,, R,, NA
	; return
	; }
	
	MButton::FFSafe := SendToFF("Click","M")
	; {
	; Gui,+LastFound
	; WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	; x -= 3432
	; y -= 154
	; ; MsgBox, %x% %y%
	; ControlClick, x%x% y%y%, ahk_id %FFSafe%,, M,, NA
	; return
	; }
	
	XButton1::SendToFF("Click","X1")
	; {
	; Gui,+LastFound
	; WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	; x -= 3432
	; y -= 154
	; ; MsgBox, %x% %y%
	; ControlClick, x%x% y%y%, ahk_id %FFSafe%,, X1,, NA
	; return
	; }
	
	XButton2::SendToFF("Click","X2")
	; {
	; Gui,+LastFound
	; WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	; x -= 3432
	; y -= 154
	; ; MsgBox, %x% %y%
	; ControlClick, x%x% y%y%, ahk_id %FFSafe%,, X2,, NA
	; return
	; }
	
	; idk why but I couldn't get the scroll wheel to work so I made it send the arrow keys instead
	
	WheelUp::SendToFF("Key","{Up}")
	WheelDown::SendToFF("Key","{Down}")
	WheelLeft::SendToFF("Key","{Left}")
	WheelRight::SendToFF("Key","{Right}")
}
#if

; ───────────────────────────────────────────────────────────────────────────────────────────────

#InputLevel 0

F21::SendToFF("Key","{Ctrl down}{Alt down}p{Alt up}{Ctrl up}")

F19:: ; SendToFF("Key","{Ctrl down}{Alt down}b{Alt up}{Ctrl up}")
{
	; SendToFF("None","None")
	ControlSend, ahk_parent, {Alt down}{Shift down}{F3}{Alt up}{Shift up}, ahk_id %FFSafe%
	Sleep, 50
	ControlClick, x35 y1050, ahk_id %FFSafe%,,, NA
	; Sleep, 250
	ControlSend, ahk_parent, {Alt down}{Shift down}{F2}{Alt up}{Shift up}, ahk_id %FFSafe%
	return
}

F22:: ; SendToFF("Key","{Ctrl down}{Alt down}n{Alt up}{Ctrl up}")
{
	; SendToFF("None","None")
	ControlSend, ahk_parent, {Alt down}{Shift down}{F3}{Alt up}{Shift up}, ahk_id %FFSafe%
	Sleep, 50
	ControlClick, x145 y1049, ahk_id %FFSafe%,,, NA
	; Sleep, 250
	ControlSend, ahk_parent, {Alt down}{Shift down}{F2}{Alt up}{Shift up}, ahk_id %FFSafe%
	return
}

#if (ctrltoggle = 0 && shifttoggle = 0 && alttoggle = 0 && mastertoggle = 1)
{
	; no modifiers go here
	a::SendToFF("Key","a")
	b::SendToFF("Key","b")
	c::SendToFF("Key","c")
	d::SendToFF("Key","d")
	e::SendToFF("Key","e")
	f::SendToFF("Key","f")
	g::SendToFF("Key","g")
	h::SendToFF("Key","h")
	i::SendToFF("Key","i")
	j::SendToFF("Key","j")
	k::SendToFF("Key","k")
	l::SendToFF("Key","l")
	m::SendToFF("Key","m")
	n::SendToFF("Key","n")
	o::SendToFF("Key","o")
	p::SendToFF("Key","p")
	q::SendToFF("Key","q")
	r::SendToFF("Key","r")
	s::SendToFF("Key","s")
	t::SendToFF("Key","t")
	u::SendToFF("Key","u")
	v::SendToFF("Key","v")
	w::SendToFF("Key","w")
	x::SendToFF("Key","x")
	y::SendToFF("Key","y")
	z::SendToFF("Key","z")
	`::SendToFF("Key","``")
	1::SendToFF("Key","1")
	2::SendToFF("Key","2")
	3::SendToFF("Key","3")
	4::SendToFF("Key","4")
	5::SendToFF("Key","5")
	6::SendToFF("Key","6")
	7::SendToFF("Key","7")
	8::SendToFF("Key","8")
	9::SendToFF("Key","9")
	0::SendToFF("Key","0")
	-::SendToFF("Key","-")
	=::SendToFF("Key","=")
	[::SendToFF("Key","[")
	]::SendToFF("Key","]")
	\::SendToFF("Key","\")
	`;::SendToFF("Key","`;")
	'::SendToFF("Key","'")
	,::SendToFF("Key","`,")
	.::SendToFF("Key",".")
	/::SendToFF("Key","/")
	F1::SendToFF("Key","{F1}")
	F2::SendToFF("Key","{F2}")
	F3::SendToFF("Key","{F3}")
	F4::SendToFF("Key","{F4}")
	F5::SendToFF("Key","{F5}")
	F6::SendToFF("Key","{F6}")
	F7::SendToFF("Key","{F7}")
	F8::SendToFF("Key","{F8}")
	F9::SendToFF("Key","{F9}")
	F10::SendToFF("Key","{F10}")
	F11::SendToFF("Key","{F11}")
	F12::SendToFF("Key","{F12}")
	Enter::SendToFF("Key","{Enter}")
	Tab::SendToFF("Key","{Tab}")
	Left::SendToFF("Key","{Left}")
	Right::SendToFF("Key","{Right}")
	Up::SendToFF("Key","{Up}")
	Down::SendToFF("Key","{Down}")
	Backspace::SendToFF("Key","{Backspace}")
	CapsLock::SendToFF("Key","{Backspace}")
	Delete::SendToFF("Key","{Delete}")
	PgUp::SendToFF("Key","{PgUp}")
	PgDn::SendToFF("Key","{PgDn}")
	Space::SendToFF("Key","{Space}")
	Home::SendToFF("Key","{Home}")
	End::SendToFF("Key","{End}")
	Esc::SendToFF("Key","{Esc}")
	NumpadDot::
	{
		run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /Unmute "Consoles"
		run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 40
		SoundBeep, 250, 100
		SoundBeep, 400, 100
		return
	}
	Numpad1::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 10
	Numpad2::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 20
	Numpad3::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 30
	Numpad4::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 40
	Numpad5::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 50
	Numpad6::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 60
	Numpad7::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 70
	Numpad8::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 80
	Numpad9::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 90
	Numpad0::run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 100
}
#if

#if (ctrltoggle = 1 && shifttoggle = 0 && alttoggle = 0 && mastertoggle = 1)
{
	; ctrl goes here
	a::SendToFF("Key","{Ctrl down}a{Ctrl up}")
	b::SendToFF("Key","{Ctrl down}b{Ctrl up}")
	c::SendToFF("Key","{Ctrl down}c{Ctrl up}")
	d::SendToFF("Key","{Ctrl down}d{Ctrl up}")
	e::SendToFF("Key","{Ctrl down}e{Ctrl up}")
	f::SendToFF("Key","{Ctrl down}f{Ctrl up}")
	g::SendToFF("Key","{Ctrl down}g{Ctrl up}")
	h::SendToFF("Key","{Ctrl down}h{Ctrl up}")
	i::SendToFF("Key","{Ctrl down}i{Ctrl up}")
	j::SendToFF("Key","{Ctrl down}j{Ctrl up}")
	k::SendToFF("Key","{Ctrl down}k{Ctrl up}")
	l::SendToFF("Key","{Ctrl down}l{Ctrl up}")
	m::SendToFF("Key","{Ctrl down}m{Ctrl up}")
	n::SendToFF("Key","{Ctrl down}n{Ctrl up}")
	o::SendToFF("Key","{Ctrl down}o{Ctrl up}")
	p::SendToFF("Key","{Ctrl down}p{Ctrl up}")
	q::SendToFF("Key","{Ctrl down}q{Ctrl up}")
	r::SendToFF("Key","{Ctrl down}r{Ctrl up}")
	s::SendToFF("Key","{Ctrl down}s{Ctrl up}")
	t::SendToFF("Key","{Ctrl down}t{Ctrl up}")
	u::SendToFF("Key","{Ctrl down}u{Ctrl up}")
	v::SendToFF("Key","{Ctrl down}v{Ctrl up}")
	w::SendToFF("Key","{Ctrl down}w{Ctrl up}")
	x::SendToFF("Key","{Ctrl down}x{Ctrl up}")
	y::SendToFF("Key","{Ctrl down}y{Ctrl up}")
	z::SendToFF("Key","{Ctrl down}z{Ctrl up}")
	~::SendToFF("Key","{Ctrl down}``{Ctrl up}")
	1::SendToFF("Key","{Ctrl down}1{Ctrl up}")
	2::SendToFF("Key","{Ctrl down}2{Ctrl up}")
	3::SendToFF("Key","{Ctrl down}3{Ctrl up}")
	4::SendToFF("Key","{Ctrl down}4{Ctrl up}")
	5::SendToFF("Key","{Ctrl down}5{Ctrl up}")
	6::SendToFF("Key","{Ctrl down}6{Ctrl up}")
	7::SendToFF("Key","{Ctrl down}7{Ctrl up}")
	8::SendToFF("Key","{Ctrl down}8{Ctrl up}")
	9::SendToFF("Key","{Ctrl down}9{Ctrl up}")
	0::SendToFF("Key","{Ctrl down}0{Ctrl up}")
	-::SendToFF("Key","{Ctrl down}-{Ctrl up}")
	=::SendToFF("Key","{Ctrl down}={Ctrl up}")
	[::SendToFF("Key","{Ctrl down}[{Ctrl up}")
	]::SendToFF("Key","{Ctrl down}]{Ctrl up}")
	\::SendToFF("Key","{Ctrl down}\{Ctrl up}")
	`;::SendToFF("Key","{Ctrl down}`;{Ctrl up}")
	'::SendToFF("Key","{Ctrl down}'{Ctrl up}")
	,::SendToFF("Key","{Ctrl down}`,{Ctrl up}")
	.::SendToFF("Key","{Ctrl down}.{Ctrl up}")
	/::SendToFF("Key","{Ctrl down}/{Ctrl up}")
	F1::SendToFF("Key","{Ctrl down}{F1}{Ctrl up}")
	F2::SendToFF("Key","{Ctrl down}{F2}{Ctrl up}")
	F3::SendToFF("Key","{Ctrl down}{F3}{Ctrl up}")
	F4::SendToFF("Key","{Ctrl down}{F4}{Ctrl up}")
	F5::SendToFF("Key","{Ctrl down}{F5}{Ctrl up}")
	F6::SendToFF("Key","{Ctrl down}{F6}{Ctrl up}")
	F7::SendToFF("Key","{Ctrl down}{F7}{Ctrl up}")
	F8::SendToFF("Key","{Ctrl down}{F8}{Ctrl up}")
	F9::SendToFF("Key","{Ctrl down}{F9}{Ctrl up}")
	F10::SendToFF("Key","{Ctrl down}{F10}{Ctrl up}")
	F11::SendToFF("Key","{Ctrl down}{F11}{Ctrl up}")
	F12::SendToFF("Key","{Ctrl down}{F12}{Ctrl up}")
	Enter::SendToFF("Key","^{Enter}")
	Tab::SendToFF("Key","{Ctrl down}{Tab}{Ctrl up}")
	Left::SendToFF("Key","{Ctrl down}{Left}{Ctrl up}")
	Right::SendToFF("Key","{Ctrl down}{Right}{Ctrl up}")
	Up::SendToFF("Key","{Ctrl down}{Up}{Ctrl up}")
	Down::SendToFF("Key","{Ctrl down}{Down}{Ctrl up}")
	Backspace::SendToFF("Key","{Ctrl down}{Backspace}{Ctrl up}")
	CapsLock::SendToFF("Key","{Ctrl down}{Backspace}{Ctrl up}")
	Delete::SendToFF("Key","{Ctrl down}{Delete}{Ctrl up}")
	PgUp::SendToFF("Key","{Ctrl down}{PgUp}{Ctrl up}")
	PgDn::SendToFF("Key","{Ctrl down}{PgDn}{Ctrl up}")
	Space::SendToFF("Key","{Ctrl down}{space}{Ctrl up}")
	Home::SendToFF("Key","{Ctrl down}{Home}{Ctrl up}")
	End::SendToFF("Key","{Ctrl down}{End}{Ctrl up}")
	NumpadDot::
	{
		run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /Mute "Consoles"
		run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 0
		SoundBeep, 400, 100
		SoundBeep, 250, 100
		return
	}
}
#if

#if (ctrltoggle = 1 && shifttoggle = 1 && alttoggle = 0 && mastertoggle = 1)
{
	; ctrl shift goes here
	a::SendToFF("Key","{Ctrl down}{Shift down}a{Ctrl up}{Shift up}")
	b::SendToFF("Key","{Ctrl down}{Shift down}b{Ctrl up}{Shift up}")
	c::SendToFF("Key","{Ctrl down}{Shift down}c{Ctrl up}{Shift up}")
	d::SendToFF("Key","{Ctrl down}{Shift down}d{Ctrl up}{Shift up}")
	e::SendToFF("Key","{Ctrl down}{Shift down}e{Ctrl up}{Shift up}")
	f::SendToFF("Key","{Ctrl down}{Shift down}f{Ctrl up}{Shift up}")
	g::SendToFF("Key","{Ctrl down}{Shift down}g{Ctrl up}{Shift up}")
	h::SendToFF("Key","{Ctrl down}{Shift down}h{Ctrl up}{Shift up}")
	i::SendToFF("Key","{Ctrl down}{Shift down}i{Ctrl up}{Shift up}")
	j::SendToFF("Key","{Ctrl down}{Shift down}j{Ctrl up}{Shift up}")
	k::SendToFF("Key","{Ctrl down}{Shift down}k{Ctrl up}{Shift up}")
	l::SendToFF("Key","{Ctrl down}{Shift down}l{Ctrl up}{Shift up}")
	m::SendToFF("Key","{Ctrl down}{Shift down}m{Ctrl up}{Shift up}")
	n::SendToFF("Key","{Ctrl down}{Shift down}n{Ctrl up}{Shift up}")
	o::SendToFF("Key","{Ctrl down}{Shift down}o{Ctrl up}{Shift up}")
	p::SendToFF("Key","{Ctrl down}{Shift down}p{Ctrl up}{Shift up}")
	q::SendToFF("Key","{Ctrl down}{Shift down}q{Ctrl up}{Shift up}")
	r::SendToFF("Key","{Ctrl down}{Shift down}r{Ctrl up}{Shift up}")
	s::SendToFF("Key","{Ctrl down}{Shift down}s{Ctrl up}{Shift up}")
	t::SendToFF("Key","{Ctrl down}{Shift down}t{Ctrl up}{Shift up}")
	u::SendToFF("Key","{Ctrl down}{Shift down}u{Ctrl up}{Shift up}")
	v::SendToFF("Key","{Ctrl down}{Shift down}v{Ctrl up}{Shift up}")
	w::SendToFF("Key","{Ctrl down}{Shift down}w{Ctrl up}{Shift up}")
	x::SendToFF("Key","{Ctrl down}{Shift down}x{Ctrl up}{Shift up}")
	y::SendToFF("Key","{Ctrl down}{Shift down}y{Ctrl up}{Shift up}")
	z::SendToFF("Key","{Ctrl down}{Shift down}z{Ctrl up}{Shift up}")
	Tab::SendToFF("Key","{Ctrl down}{Shift down}{Tab}{Ctrl up}{Shift up}")
	Left::SendToFF("Key","{Ctrl down}{Shift down}{Left}{Ctrl up}{Shift up}")
	Right::SendToFF("Key","{Ctrl down}{Shift down}{Right}{Ctrl up}{Shift up}")
	Up::SendToFF("Key","{Ctrl down}{Shift down}{Up}{Ctrl up}{Shift up}")
	Down::SendToFF("Key","{Ctrl down}{Shift down}{Down}{Ctrl up}{Shift up}")
	Backspace::SendToFF("Key","{Ctrl down}{Shift down}{Backspace}{Ctrl up}{Shift up}")
	CapsLock::SendToFF("Key","{Ctrl down}{Shift down}{Backspace}{Ctrl up}{Shift up}")
	Delete::SendToFF("Key","{Ctrl down}{Shift down}{Delete}{Ctrl up}{Shift up}")
	PgUp::SendToFF("Key","{Ctrl down}{Shift down}{PgUp}{Ctrl up}{Shift up}")
	PgDn::SendToFF("Key","{Ctrl down}{Shift down}{PgDn}{Ctrl up}{Shift up}")
	Home::SendToFF("Key","{Ctrl down}{Shift down}{Home}{Ctrl up}{Shift up}")
	End::SendToFF("Key","{Ctrl down}{Shift down}{End}{Ctrl up}{Shift up}")
}
#if

#if (ctrltoggle = 0 && shifttoggle = 0 && alttoggle = 1 && mastertoggle = 1)
{
	; alt goes here
	a::SendToFF("Key","{Alt down}a{Alt up}")
	b::SendToFF("Key","{Alt down}b{Alt up}")
	c::SendToFF("Key","{Alt down}c{Alt up}")
	d::SendToFF("Key","{Alt down}d{Alt up}")
	e::SendToFF("Key","{Alt down}e{Alt up}")
	f::SendToFF("Key","{Alt down}f{Alt up}")
	g::SendToFF("Key","{Alt down}g{Alt up}")
	h::SendToFF("Key","{Alt down}h{Alt up}")
	i::SendToFF("Key","{Alt down}i{Alt up}")
	j::SendToFF("Key","{Alt down}j{Alt up}")
	k::SendToFF("Key","{Alt down}k{Alt up}")
	l::SendToFF("Key","{Alt down}l{Alt up}")
	m::SendToFF("Key","{Alt down}m{Alt up}")
	n::SendToFF("Key","{Alt down}n{Alt up}")
	o::SendToFF("Key","{Alt down}o{Alt up}")
	p::SendToFF("Key","{Alt down}p{Alt up}")
	q::SendToFF("Key","{Alt down}q{Alt up}")
	r::SendToFF("Key","{Alt down}r{Alt up}")
	s::SendToFF("Key","{Alt down}s{Alt up}")
	t::SendToFF("Key","{Alt down}t{Alt up}")
	u::SendToFF("Key","{Alt down}u{Alt up}")
	v::SendToFF("Key","{Alt down}v{Alt up}")
	w::SendToFF("Key","{Alt down}w{Alt up}")
	x::SendToFF("Key","{Alt down}x{Alt up}")
	y::SendToFF("Key","{Alt down}y{Alt up}")
	z::SendToFF("Key","{Alt down}z{Alt up}")
	`::SendToFF("Key","{Alt down}``{Alt up}")
	1::SendToFF("Key","{Alt down}1{Alt up}")
	2::SendToFF("Key","{Alt down}2{Alt up}")
	3::SendToFF("Key","{Alt down}3{Alt up}")
	4::SendToFF("Key","{Alt down}4{Alt up}")
	5::SendToFF("Key","{Alt down}5{Alt up}")
	6::SendToFF("Key","{Alt down}6{Alt up}")
	7::SendToFF("Key","{Alt down}7{Alt up}")
	8::SendToFF("Key","{Alt down}8{Alt up}")
	9::SendToFF("Key","{Alt down}9{Alt up}")
	0::SendToFF("Key","{Alt down}0{Alt up}")
	-::SendToFF("Key","{Alt down}-{Alt up}")
	=::SendToFF("Key","{Alt down}={Alt up}")
	[::SendToFF("Key","{Alt down}[{Alt up}")
	]::SendToFF("Key","{Alt down}]{Alt up}")
	\::SendToFF("Key","{Alt down}\{Alt up}")
	`;::SendToFF("Key","{Alt down}`;{Alt up}")
	'::SendToFF("Key","{Alt down}'{Alt up}")
	,::SendToFF("Key","{Alt down}`{Alt up},")
	.::SendToFF("Key","{Alt down}.{Alt up}")
	/::SendToFF("Key","{Alt down}/{Alt up}")
	F1::SendToFF("Key","{Alt down}{F1}{Alt up}")
	F2::SendToFF("Key","{Alt down}{F2}{Alt up}")
	F3::SendToFF("Key","{Alt down}{F3}{Alt up}")
	F4::SendToFF("Key","{Alt down}{F4}{Alt up}")
	F5::SendToFF("Key","{Alt down}{F5}{Alt up}")
	F6::SendToFF("Key","{Alt down}{F6}{Alt up}")
	F7::SendToFF("Key","{Alt down}{F7}{Alt up}")
	F8::SendToFF("Key","{Alt down}{F8}{Alt up}")
	F9::SendToFF("Key","{Alt down}{F9}{Alt up}")
	F10::SendToFF("Key","{Alt down}{F10}{Alt up}")
	F11::SendToFF("Key","{Alt down}{F11}{Alt up}")
	F12::SendToFF("Key","{Alt down}{F12}{Alt up}")
	Enter::SendToFF("Key","{Alt down}{Enter}{Alt up}")
	Tab::Send, !{tab}
	Left::SendToFF("Key","{Alt down}{Left}{Alt up}")
	Right::SendToFF("Key","{Alt down}{Right}{Alt up}")
	Up::SendToFF("Key","{Alt down}{Up}{Alt up}")
	Down::SendToFF("Key","{Alt down}{Down}{Alt up}")
	Backspace::SendToFF("Key","{Alt down}{Backspace}{Alt up}")
	CapsLock::SendToFF("Key","{Alt down}{Backspace}{Alt up}")
	Delete::SendToFF("Key","{Alt down}{Delete}{Alt up}")
	PgUp::SendToFF("Key","{Alt down}{PgUp}{Alt up}")
	PgDn::SendToFF("Key","{Alt down}{PgDn}{Alt up}")
	Space::SendToFF("Key","{Alt down}{space}{Alt up}")
	Home::SendToFF("Key","{Alt down}{Home}{Alt up}")
	End::SendToFF("Key","{Alt down}{End}{Alt up}")
	; Insert::Reload
}
#if

#if (ctrltoggle = 0 && shifttoggle = 1 && alttoggle = 0 && mastertoggle = 1)
{
	; shift goes here
	a::SendToFF("Key","{Shift down}a{Shift up}")
	b::SendToFF("Key","{Shift down}b{Shift up}")
	c::SendToFF("Key","{Shift down}c{Shift up}")
	d::SendToFF("Key","{Shift down}d{Shift up}")
	e::SendToFF("Key","{Shift down}e{Shift up}")
	f::SendToFF("Key","{Shift down}f{Shift up}")
	g::SendToFF("Key","{Shift down}g{Shift up}")
	h::SendToFF("Key","{Shift down}h{Shift up}")
	i::SendToFF("Key","{Shift down}i{Shift up}")
	j::SendToFF("Key","{Shift down}j{Shift up}")
	k::SendToFF("Key","{Shift down}k{Shift up}")
	l::SendToFF("Key","{Shift down}l{Shift up}")
	m::SendToFF("Key","{Shift down}m{Shift up}")
	n::SendToFF("Key","{Shift down}n{Shift up}")
	o::SendToFF("Key","{Shift down}o{Shift up}")
	p::SendToFF("Key","{Shift down}p{Shift up}")
	q::SendToFF("Key","{Shift down}q{Shift up}")
	r::SendToFF("Key","{Shift down}r{Shift up}")
	s::SendToFF("Key","{Shift down}s{Shift up}")
	t::SendToFF("Key","{Shift down}t{Shift up}")
	u::SendToFF("Key","{Shift down}u{Shift up}")
	v::SendToFF("Key","{Shift down}v{Shift up}")
	w::SendToFF("Key","{Shift down}w{Shift up}")
	x::SendToFF("Key","{Shift down}x{Shift up}")
	y::SendToFF("Key","{Shift down}y{Shift up}")
	z::SendToFF("Key","{Shift down}z{Shift up}")
	`::SendToFF("Key","{Shift down}``{Shift up}")
	1::SendToFF("Key","{Shift down}1{Shift up}")
	2::SendToFF("Key","{Shift down}2{Shift up}")
	3::SendToFF("Key","{Shift down}3{Shift up}")
	4::SendToFF("Key","{Shift down}4{Shift up}")
	5::SendToFF("Key","{Shift down}5{Shift up}")
	6::SendToFF("Key","{Shift down}6{Shift up}")
	7::SendToFF("Key","{Shift down}7{Shift up}")
	8::SendToFF("Key","{Shift down}8{Shift up}")
	9::SendToFF("Key","{Shift down}9{Shift up}")
	0::SendToFF("Key","{Shift down}0{Shift up}")
	-::SendToFF("Key","{Shift down}-{Shift up}")
	=::SendToFF("Key","{Shift down}={Shift up}")
	[::SendToFF("Key","{Shift down}[{Shift up}")
	]::SendToFF("Key","{Shift down}]{Shift up}")
	\::SendToFF("Key","{Shift down}\{Shift up}")
	`;::SendToFF("Key","{Shift down}`;{Shift up}")
	'::SendToFF("Key","{Shift down}'{Shift up}")
	,::SendToFF("Key","{Shift down}`,{Shift up}")
	.::SendToFF("Key","{Shift down}.{Shift up}")
	/::SendToFF("Key","{Shift down}/{Shift up}")
	F1::SendToFF("Key","{Shift down}{F1}{Shift up}")
	F2::SendToFF("Key","{Shift down}{F2}{Shift up}")
	F3::SendToFF("Key","{Shift down}{F3}{Shift up}")
	F4::SendToFF("Key","{Shift down}{F4}{Shift up}")
	F5::SendToFF("Key","{Shift down}{F5}{Shift up}")
	F6::SendToFF("Key","{Shift down}{F6}{Shift up}")
	F7::SendToFF("Key","{Shift down}{F7}{Shift up}")
	F8::SendToFF("Key","{Shift down}{F8}{Shift up}")
	F9::SendToFF("Key","{Shift down}{F9}{Shift up}")
	F10::SendToFF("Key","{Shift down}{F10}{Shift up}")
	F11::SendToFF("Key","{Shift down}{F11}{Shift up}")
	F12::SendToFF("Key","{Shift down}{F12}{Shift up}")
	Enter::SendToFF("Key","{Shift down}{Enter}{Shift up}")
	Tab::SendToFF("Key","{Shift down}{Tab}{Shift up}")fffffff
	Left::SendToFF("Key","{Shift down}{Left}{Shift up}")
	Right::SendToFF("Key","{Shift down}{Right}{Shift up}")
	Up::SendToFF("Key","{Shift down}{Up}{Shift up}")
	Down::SendToFF("Key","{Shift down}{Down}{Shift up}")
	Backspace::SendToFF("Key","{Shift down}{Backspace}{Shift up}")
	CapsLock::SendToFF("Key","{Shift down}{Backspace}{Shift up}")
	Delete::SendToFF("Key","{Shift down}{Delete}{Shift up}")
	PgUp::SendToFF("Key","{Shift down}{PgUp}{Shift up}")
	PgDn::SendToFF("Key","{Shift down}{PgDn}{Shift up}")
	Space::SendToFF("Key","{Shift down}{space}{Shift up}")
	Home::SendToFF("Key","{Shift down}{Home}{Shift up}")
	End::SendToFF("Key","{Shift down}{End}{Shift up}")
}
#if

AppVolume(app:="", device:="")
{
	return new AppVolume(app, device)
}

class AppVolume
{
	ISAVs := []
	
	__New(app:="", device:="")
	{
		static IID_IASM2 := "{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}"
		, IID_IASC2 := "{BFB7FF88-7239-4FC9-8FA2-07C950BE9C6D}"
		, IID_ISAV := "{87CE5498-68D6-44E5-9215-6DA47EF883D8}"
		
		; Activate the session manager of the given device
		pIMMD := VA_GetDevice(device)
		VA_IMMDevice_Activate(pIMMD, IID_IASM2, 0, 0, pIASM2)
		ObjRelease(pIMMD)
		
		; Enumerate sessions for on this device
		VA_IAudioSessionManager2_GetSessionEnumerator(pIASM2, pIASE)
		ObjRelease(pIASM2)
		
		; Search for audio sessions with a matching process ID or Name
		VA_IAudioSessionEnumerator_GetCount(pIASE, Count)
		Loop, % Count
		{
			; Get this session's IAudioSessionControl2 via its IAudioSessionControl
			VA_IAudioSessionEnumerator_GetSession(pIASE, A_Index-1, pIASC)
			pIASC2 := ComObjQuery(pIASC, IID_IASC2)
			ObjRelease(pIASC)
			
			; If its PID matches save its ISimpleAudioVolume pointer
			VA_IAudioSessionControl2_GetProcessID(pIASC2, PID)
			if (PID == app || this.GetProcessName(PID) == app)
				this.ISAVs.Push(ComObjQuery(pIASC2, IID_ISAV))
			
			ObjRelease(pIASC2)
		}
		
		; Release the IAudioSessionEnumerator
		ObjRelease(pIASE)
	}
	
	__Delete()
	{
		for k, pISAV in this.ISAVs
			ObjRelease(pISAV)
	}
	
	AdjustVolume(Amount)
	{
		return this.SetVolume(this.GetVolume() + Amount)
	}
	
	AdjustVolumeSet(Amount)
	{
		return this.SetVolume(Amount)
	}
	
	GetVolume()
	{
		for k, pISAV in this.ISAVs
		{
			VA_ISimpleAudioVolume_GetMasterVolume(pISAV, fLevel)
			return fLevel * 100
		}
	}
	
	SetVolume(level)
	{
		level := level>100 ? 100 : level<0 ? 0 : level ; Limit to range 0-100
		for k, pISAV in this.ISAVs
			VA_ISimpleAudioVolume_SetMasterVolume(pISAV, level / 100)
		return level
	}
	
	GetMute()
	{
		for k, pISAV in this.ISAVs
		{
			VA_ISimpleAudioVolume_GetMute(pISAV, bMute)
			return bMute
		}
	}
	
	SetMute(bMute)
	{
		for k, pISAV in this.ISAVs
			VA_ISimpleAudioVolume_SetMute(pISAV, bMute)
		return bMute
	}
	
	ToggleMute()
	{
		return this.SetMute(!this.GetMute())
	}
	
	GetProcessName(PID) {
		hProcess := DllCall("OpenProcess"
		, "UInt", 0x1000 ; DWORD dwDesiredAccess (PROCESS_QUERY_LIMITED_INFORMATION)
		, "UInt", False  ; BOOL  bInheritHandle
		, "UInt", PID    ; DWORD dwProcessId
		, "UPtr")
		dwSize := VarSetCapacity(strExeName, 512 * A_IsUnicode, 0) // A_IsUnicode
		DllCall("QueryFullProcessImageName"
		, "UPtr", hProcess  ; HANDLE hProcess
		, "UInt", 0         ; DWORD  dwFlags
		, "Str", strExeName ; LPSTR  lpExeName
		, "UInt*", dwSize   ; PDWORD lpdwSize
		, "UInt")
		DllCall("CloseHandle", "UPtr", hProcess, "UInt")
		SplitPath, strExeName, strExeName
		return strExeName
	}
}


; --- Vista Audio Additions ---

;
; ISimpleAudioVolume : {87CE5498-68D6-44E5-9215-6DA47EF883D8}
;
VA_ISimpleAudioVolume_SetMasterVolume(this, ByRef fLevel, GuidEventContext="") {
	return DllCall(NumGet(NumGet(this+0)+3*A_PtrSize), "ptr", this, "float", fLevel, "ptr", VA_GUID(GuidEventContext))
}
VA_ISimpleAudioVolume_GetMasterVolume(this, ByRef fLevel) {
	return DllCall(NumGet(NumGet(this+0)+4*A_PtrSize), "ptr", this, "float*", fLevel)
}
VA_ISimpleAudioVolume_SetMute(this, ByRef Muted, GuidEventContext="") {
	return DllCall(NumGet(NumGet(this+0)+5*A_PtrSize), "ptr", this, "int", Muted, "ptr", VA_GUID(GuidEventContext))
}
VA_ISimpleAudioVolume_GetMute(this, ByRef Muted) {
	return DllCall(NumGet(NumGet(this+0)+6*A_PtrSize), "ptr", this, "int*", Muted)
}
