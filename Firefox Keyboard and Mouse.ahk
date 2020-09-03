Menu, Tray, Icon, pifmgr.dll, 13
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

hGui := CreateGui()
; Gui, New, -Caption +ToolWindow +AlwaysOnTop +hwndhGui
   ; ; Gui, Color, Blue
   ; ; Gui, Show, w15 h15 HIDE
    ; Gui, Color, FAFAFA
	; Gui, Add, Picture, x0 y0 w32 h32 , Cursor.png
	; Gui +LastFound +AlwaysOnTop +ToolWindow
	; WinSet, TransColor, FAFAFA
	; Gui -Caption
; MouseGetPos, X, Y

Run Dvorak.ahk
Run Easy Window Organiser.ahk

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

DoFocus = 1
ctrltoggle = 0
shifttoggle = 0
alttoggle = 0
wintoggle = 0
mastertoggle = 0
toggle = 0
toggle2 = 0
FFNow = 0
FFSafe = 0
Full = 0

^Pause::Run, "F:\Documents\AHK Current\Launch Scripts.ahk" ; "

~LButton::
{
IfWinActive, ahk_id %FFSafe%
{
DoFocus := 0
WinWaitNotActive, ahk_id %FFSafe%
DoFocus := 1
return
}
return
}
#if

AppsKey::
{
	; ──────────────────────────────────── This section automatically focuses the firefox window on my second monitor ────────────────────────────────────
	
	FFArray := []
	FCount := 0
	If(DoFocus = 1)
	{
		DetectHiddenWindows Off
		WinGet, FFList, List, ahk_exe firefox.exe
		WinGet, FCount, Count, ahk_exe firefox.exe
		Loop %FCount%
		{
			FFNow := FFList%FCount%
			WinGetPos,X,Y,FFW,FFH, ahk_id %FFNow%
			; MsgBox %FFW% %FFH% %FFNow%
			If (FFW = 1936 && FFH = 1096) ; You may need to change these values or use the x y coordinates to specify the window you want
			{
				FFSafe = %FFNow%
				WinRestore, ahk_id %FFSafe%
				WinMaximize, ahk_id %FFSafe%
				DoFocus := 0
			}
			If (FFW = 1920 && FFH = 1080) ; This is for when a video is fullscreen
			{
				FFSafe = %FFNow%
				ControlSend, ahk_parent, {Esc}, ahk_id %FFSafe%
				ControlSend, ahk_parent, f, ahk_id %FFSafe%
				DoFocus := 0
			}
			FCount--
		}
	}
	
	; ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	toggle := 1
	mastertoggle := 1
	keywait AppsKey
	KeyWait, AppsKey, D T0.2
	if ErrorLevel
		toggle := 0
	else
    	{
		KeyDown := !KeyDown
		If !KeyDown
		{
			toggle2 := 0
			if toggle = 0
			{
				mastertoggle := 0
			}
			VMouse := 0
			SoundBeep, 300, 50
			SoundBeep, 200, 50
		}
		Else
		{
			toggle2 := 1
			mastertoggle := 1
			VMouse := 1
			SetTimer, VirtualMouse, 150
			SoundBeep, 200, 50
			SoundBeep, 300, 50
		}
	}
	if toggle2 = 0
	{
		mastertoggle := 0
	}
	return
}

VirtualMouse:
{
SetTimer, VirtualMouse, Off
Global VMouse
While VMouse = 1 and !GetKeyState("AppsKey")
			{
				MouseGetPos, MX, MY
				if MX+2500<3440
				MX = 3440
				if MX+2500>5380
				MX = 5380
				if MY<360
				MY = 360
				if MY>1440
				MY = 1440
				Gui, %hGui%: Show, % "NA x" MX+2500 . " y" MY
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
	SendInput, {F13 Down}
	ctrltoggle := 1
	keywait Ctrl
	SendInput, {F13 Up}
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
	SendInput, {F13 Down}
	alttoggle := 1
	keywait Alt
	SendInput, {F13 Up}
	alttoggle := 0
	return
}
RCtrl::
{
	SendInput, {F13 Down}
	ctrltoggle := 1
	keywait Ctrl
	SendInput, {F13 Up}
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
	SendInput, {F13 Down}
	alttoggle := 1
	keywait Alt
	SendInput, {F13 Up}
	alttoggle := 0
	return
}
}
#if

; ──────────────────────────────────────── Virtual Mouse ────────────────────────────────────────

CreateGui() {
   Gui, New, -Caption +ToolWindow +AlwaysOnTop +hwndhGui
   ; Gui, Color, Blue
   ; Gui, Show, w15 h15 HIDE
    Gui, Color, FAFAFA
	Gui, Add, Picture, x0 y0 w32 h32 , Cursor.png
	Gui, Show, w32 h32
	Gui +LastFound +AlwaysOnTop +ToolWindow
	WinSet, TransColor, FAFAFA
	Gui -Caption
	Gui, Hide
   Return hGui
}

#If (VMouse = 1)
{
	LButton::
	{
	Gui,+LastFound
	WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	x -= 3440
	y -= 360
	; MsgBox, %x% %y%
	ControlClick, x%x% y%y%, ahk_id %FFSafe%
	return
	}
	
	RButton::
	{
	Gui,+LastFound
	WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	x -= 3440
	y -= 360
	; MsgBox, %x% %y%
	ControlClick, x%x% y%y%, ahk_id %FFSafe%,, R
	return
	}
	
	MButton::
	{
	Gui,+LastFound
	WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	x -= 3440
	y -= 360
	; MsgBox, %x% %y%
	ControlClick, x%x% y%y%, ahk_id %FFSafe%,, M
	return
	}
	
	XButton1::
	{
	Gui,+LastFound
	WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	x -= 3440
	y -= 360
	; MsgBox, %x% %y%
	ControlClick, x%x% y%y%, ahk_id %FFSafe%,, X1
	return
	}
	
	XButton2::
	{
	Gui,+LastFound
	WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	x -= 3440
	y -= 360
	; MsgBox, %x% %y%
	ControlClick, x%x% y%y%, ahk_id %FFSafe%,, X2
	return
	}
	
	; idk why but I couldn't get the scroll wheel to work so I made it send the arrow keys instead
	
	WheelUp::
	{
	; Gui,+LastFound
	; WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	; x -= 3440
	; y -= 360
	; MsgBox, %x% %y%
	; ControlFocus,,ahk_id %FFSafe%
	; ControlClick, , ahk_id %FFSafe%,, WheelUp, 1, NA
	; ControlClick,, ahk_id %FFSafe%,,WheelUp
	ControlSend, ahk_parent, {Up}, ahk_id %FFSafe%
	return
	}
	
	WheelDown::
	{
	; Gui,+LastFound
	; WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	; x -= 3440
	; y -= 360
	; MsgBox, %x% %y%
	; ControlClick,, ahk_id %FFSafe%,, WheelDown, 1
	ControlSend, ahk_parent, {Down}, ahk_id %FFSafe%
	return
	}
	
	WheelLeft::
	{
	; Gui,+LastFound
	; WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	; x -= 3440
	; y -= 360
	; ; MsgBox, %x% %y%
	; ControlClick, x%x% y%y%, ahk_id %FFSafe%,, WL, 1
	ControlSend, ahk_parent, {Left}, ahk_id %FFSafe%
	return
	}
	
	WheelRight::
	{
	; Gui,+LastFound
	; WinGetPos,x,y,w,h, ahk_class AutoHotkeyGUI
	; x -= 3440
	; y -= 360
	; ; MsgBox, %x% %y%
	; ControlClick, x%x% y%y%, ahk_id %FFSafe%,, WR, 1
	ControlSend, ahk_parent, {Right}, ahk_id %FFSafe%
	return
	}
}
#if

; ───────────────────────────────────────────────────────────────────────────────────────────────

#InputLevel 0
#if (ctrltoggle = 0 && shifttoggle = 0 && alttoggle = 0 && mastertoggle = 1)
{
; no modifiers go here
a::ControlSend, ahk_parent, a, ahk_id %FFSafe%
b::ControlSend, ahk_parent, b, ahk_id %FFSafe%
c::ControlSend, ahk_parent, c, ahk_id %FFSafe%
d::ControlSend, ahk_parent, d, ahk_id %FFSafe%
e::ControlSend, ahk_parent, e, ahk_id %FFSafe%
f::ControlSend, ahk_parent, f, ahk_id %FFSafe%
g::ControlSend, ahk_parent, g, ahk_id %FFSafe%
h::ControlSend, ahk_parent, h, ahk_id %FFSafe%
i::ControlSend, ahk_parent, i, ahk_id %FFSafe%
j::ControlSend, ahk_parent, j, ahk_id %FFSafe%
k::ControlSend, ahk_parent, k, ahk_id %FFSafe%
l::ControlSend, ahk_parent, l, ahk_id %FFSafe%
m::ControlSend, ahk_parent, m, ahk_id %FFSafe%
n::ControlSend, ahk_parent, n, ahk_id %FFSafe%
o::ControlSend, ahk_parent, o, ahk_id %FFSafe%
p::ControlSend, ahk_parent, p, ahk_id %FFSafe%
q::ControlSend, ahk_parent, q, ahk_id %FFSafe%
r::ControlSend, ahk_parent, r, ahk_id %FFSafe%
s::ControlSend, ahk_parent, s, ahk_id %FFSafe%
t::ControlSend, ahk_parent, t, ahk_id %FFSafe%
u::ControlSend, ahk_parent, u, ahk_id %FFSafe%
v::ControlSend, ahk_parent, v, ahk_id %FFSafe%
w::ControlSend, ahk_parent, w, ahk_id %FFSafe%
x::ControlSend, ahk_parent, x, ahk_id %FFSafe%
y::ControlSend, ahk_parent, y, ahk_id %FFSafe%
z::ControlSend, ahk_parent, z, ahk_id %FFSafe%
`::ControlSend, ahk_parent, ``, ahk_id %FFSafe%
1::ControlSend, ahk_parent, 1, ahk_id %FFSafe%
2::ControlSend, ahk_parent, 2, ahk_id %FFSafe%
3::ControlSend, ahk_parent, 3, ahk_id %FFSafe%
4::ControlSend, ahk_parent, 4, ahk_id %FFSafe%
5::ControlSend, ahk_parent, 5, ahk_id %FFSafe%
6::ControlSend, ahk_parent, 6, ahk_id %FFSafe%
7::ControlSend, ahk_parent, 7, ahk_id %FFSafe%
8::ControlSend, ahk_parent, 8, ahk_id %FFSafe%
9::ControlSend, ahk_parent, 9, ahk_id %FFSafe%
0::ControlSend, ahk_parent, 0, ahk_id %FFSafe%
-::ControlSend, ahk_parent, -, ahk_id %FFSafe%
=::ControlSend, ahk_parent, =, ahk_id %FFSafe%
[::ControlSend, ahk_parent, [, ahk_id %FFSafe%
]::ControlSend, ahk_parent, ], ahk_id %FFSafe%
\::ControlSend, ahk_parent, \, ahk_id %FFSafe%
`;::ControlSend, ahk_parent, `;, ahk_id %FFSafe%
'::ControlSend, ahk_parent, ', ahk_id %FFSafe%
,::ControlSend, ahk_parent, `,, ahk_id %FFSafe%
.::ControlSend, ahk_parent, ., ahk_id %FFSafe%
/::ControlSend, ahk_parent, /, ahk_id %FFSafe%
F1::ControlSend, ahk_parent, {F1}, ahk_id %FFSafe%
F2::ControlSend, ahk_parent, {F2}, ahk_id %FFSafe%
F3::ControlSend, ahk_parent, {F3}, ahk_id %FFSafe%
F4::ControlSend, ahk_parent, {F4}, ahk_id %FFSafe%
F5::ControlSend, ahk_parent, {F5}, ahk_id %FFSafe%
F6::ControlSend, ahk_parent, {F6}, ahk_id %FFSafe%
F7::ControlSend, ahk_parent, {F7}, ahk_id %FFSafe%
F8::ControlSend, ahk_parent, {F8}, ahk_id %FFSafe%
F9::ControlSend, ahk_parent, {F9}, ahk_id %FFSafe%
F10::ControlSend, ahk_parent, {F10}, ahk_id %FFSafe%
F11::ControlSend, ahk_parent, {F11}, ahk_id %FFSafe%
F12::ControlSend, ahk_parent, {F12}, ahk_id %FFSafe%
; Enter::ControlSend, ahk_parent, {Enter}, ahk_id %FFSafe%
Tab::ControlSend, ahk_parent, {Tab}, ahk_id %FFSafe%
; Left::ControlSend, ahk_parent, {Left}, ahk_id %FFSafe%
; Right::ControlSend, ahk_parent, {Right}, ahk_id %FFSafe%
; Up::ControlSend, ahk_parent, {Up}, ahk_id %FFSafe%
; Down::ControlSend, ahk_parent, {Down}, ahk_id %FFSafe%
Backspace::ControlSend, ahk_parent, {Backspace}, ahk_id %FFSafe%
CapsLock::ControlSend, ahk_parent, {Backspace}, ahk_id %FFSafe%
; Delete::ControlSend, ahk_parent, {Delete}, ahk_id %FFSafe%
PgUp::ControlSend, ahk_parent, {PgUp}, ahk_id %FFSafe%
PgDn::ControlSend, ahk_parent, {PgDn}, ahk_id %FFSafe%
Space::ControlSend, ahk_parent, {Space}, ahk_id %FFSafe%
Home::ControlSend, ahk_parent, {Home}, ahk_id %FFSafe%
End::ControlSend, ahk_parent, {End}, ahk_id %FFSafe%
Esc::ControlSend, ahk_parent, {Esc}, ahk_id %FFSafe%
NumpadDot::
{
SoundSet, +1, Master, Mute, 10
SoundBeep, 250, 250
return
}
Numpad1::SoundSet, 10, Master
Numpad2::SoundSet, 20, Master
Numpad3::SoundSet, 30, Master
Numpad4::SoundSet, 40, Master
Numpad5::SoundSet, 50, Master
Numpad6::SoundSet, 60, Master
Numpad7::SoundSet, 70, Master
Numpad8::SoundSet, 80, Master
Numpad9::SoundSet, 90, Master
Numpad0::SoundSet, 100, Master

Volume_Up::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolume(2)
return
}
Volume_Down::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolume(-2)
return
}
; WheelUp::
; {
; WinGet, ProcessName, ProcessName, A
; AppVolume(ProcessName).AdjustVolume(2)
; return
; }
; WheelDown::
; {
; WinGet, ProcessName, ProcessName, A
; AppVolume(ProcessName).AdjustVolume(-2)
; return
; }
}
#if

#if (ctrltoggle = 1 && shifttoggle = 0 && alttoggle = 0 && mastertoggle = 1)
{
; ctrl goes here
a::ControlSend, ahk_parent, {Ctrl down}a{Ctrl up}, ahk_id %FFSafe%
b::ControlSend, ahk_parent, {Ctrl down}b{Ctrl up}, ahk_id %FFSafe%
c::ControlSend, ahk_parent, {Ctrl down}c{Ctrl up}, ahk_id %FFSafe%
d::ControlSend, ahk_parent, {Ctrl down}d{Ctrl up}, ahk_id %FFSafe%
e::ControlSend, ahk_parent, {Ctrl down}e{Ctrl up}, ahk_id %FFSafe%
f::ControlSend, ahk_parent, {Ctrl down}f{Ctrl up}, ahk_id %FFSafe%
g::ControlSend, ahk_parent, {Ctrl down}g{Ctrl up}, ahk_id %FFSafe%
h::ControlSend, ahk_parent, {Ctrl down}h{Ctrl up}, ahk_id %FFSafe%
i::ControlSend, ahk_parent, {Ctrl down}i{Ctrl up}, ahk_id %FFSafe%
j::ControlSend, ahk_parent, {Ctrl down}j{Ctrl up}, ahk_id %FFSafe%
k::ControlSend, ahk_parent, {Ctrl down}k{Ctrl up}, ahk_id %FFSafe%
l::ControlSend, ahk_parent, {Ctrl down}l{Ctrl up}, ahk_id %FFSafe%
m::ControlSend, ahk_parent, {Ctrl down}m{Ctrl up}, ahk_id %FFSafe%
n::ControlSend, ahk_parent, {Ctrl down}n{Ctrl up}, ahk_id %FFSafe%
o::ControlSend, ahk_parent, {Ctrl down}o{Ctrl up}, ahk_id %FFSafe%
p::ControlSend, ahk_parent, {Ctrl down}p{Ctrl up}, ahk_id %FFSafe%
q::ControlSend, ahk_parent, {Ctrl down}q{Ctrl up}, ahk_id %FFSafe%
r::ControlSend, ahk_parent, {Ctrl down}r{Ctrl up}, ahk_id %FFSafe%
s::ControlSend, ahk_parent, {Ctrl down}s{Ctrl up}, ahk_id %FFSafe%
t::ControlSend, ahk_parent, {Ctrl down}t{Ctrl up}, ahk_id %FFSafe%
u::ControlSend, ahk_parent, {Ctrl down}u{Ctrl up}, ahk_id %FFSafe%
v::ControlSend, ahk_parent, {Ctrl down}v{Ctrl up}, ahk_id %FFSafe%
w::ControlSend, ahk_parent, {Ctrl down}w{Ctrl up}, ahk_id %FFSafe%
x::ControlSend, ahk_parent, {Ctrl down}x{Ctrl up}, ahk_id %FFSafe%
y::ControlSend, ahk_parent, {Ctrl down}y{Ctrl up}, ahk_id %FFSafe%
z::ControlSend, ahk_parent, {Ctrl down}z{Ctrl up}, ahk_id %FFSafe%
~::ControlSend, ahk_parent, {Ctrl down}``{Ctrl up}, ahk_id %FFSafe%
1::ControlSend, ahk_parent, {Ctrl down}1{Ctrl up}, ahk_id %FFSafe%
2::ControlSend, ahk_parent, {Ctrl down}2{Ctrl up}, ahk_id %FFSafe%
3::ControlSend, ahk_parent, {Ctrl down}3{Ctrl up}, ahk_id %FFSafe%
4::ControlSend, ahk_parent, {Ctrl down}4{Ctrl up}, ahk_id %FFSafe%
5::ControlSend, ahk_parent, {Ctrl down}5{Ctrl up}, ahk_id %FFSafe%
6::ControlSend, ahk_parent, {Ctrl down}6{Ctrl up}, ahk_id %FFSafe%
7::ControlSend, ahk_parent, {Ctrl down}7{Ctrl up}, ahk_id %FFSafe%
8::ControlSend, ahk_parent, {Ctrl down}8{Ctrl up}, ahk_id %FFSafe%
9::ControlSend, ahk_parent, {Ctrl down}9{Ctrl up}, ahk_id %FFSafe%
0::ControlSend, ahk_parent, {Ctrl down}0{Ctrl up}, ahk_id %FFSafe%
-::ControlSend, ahk_parent, {Ctrl down}-{Ctrl up}, ahk_id %FFSafe%
=::ControlSend, ahk_parent, {Ctrl down}={Ctrl up}, ahk_id %FFSafe%
[::ControlSend, ahk_parent, {Ctrl down}[{Ctrl up}, ahk_id %FFSafe%
]::ControlSend, ahk_parent, {Ctrl down}]{Ctrl up}, ahk_id %FFSafe%
\::ControlSend, ahk_parent, {Ctrl down}\{Ctrl up}, ahk_id %FFSafe%
`;::ControlSend, ahk_parent, {Ctrl down}`;{Ctrl up}, ahk_id %FFSafe%
'::ControlSend, ahk_parent, {Ctrl down}'{Ctrl up}, ahk_id %FFSafe%
,::ControlSend, ahk_parent, {Ctrl down}`,{Ctrl up}, ahk_id %FFSafe%
.::ControlSend, ahk_parent, {Ctrl down}.{Ctrl up}, ahk_id %FFSafe%
/::ControlSend, ahk_parent, {Ctrl down}/{Ctrl up}, ahk_id %FFSafe%
F1::ControlSend, ahk_parent, {Ctrl down}{F1}{Ctrl up}, ahk_id %FFSafe%
F2::ControlSend, ahk_parent, {Ctrl down}{F2}{Ctrl up}, ahk_id %FFSafe%
F3::ControlSend, ahk_parent, {Ctrl down}{F3}{Ctrl up}, ahk_id %FFSafe%
F4::ControlSend, ahk_parent, {Ctrl down}{F4}{Ctrl up}, ahk_id %FFSafe%
F5::ControlSend, ahk_parent, {Ctrl down}{F5}{Ctrl up}, ahk_id %FFSafe%
F6::ControlSend, ahk_parent, {Ctrl down}{F6}{Ctrl up}, ahk_id %FFSafe%
F7::ControlSend, ahk_parent, {Ctrl down}{F7}{Ctrl up}, ahk_id %FFSafe%
F8::ControlSend, ahk_parent, {Ctrl down}{F8}{Ctrl up}, ahk_id %FFSafe%
F9::ControlSend, ahk_parent, {Ctrl down}{F9}{Ctrl up}, ahk_id %FFSafe%
F10::ControlSend, ahk_parent, {Ctrl down}{F10}{Ctrl up}, ahk_id %FFSafe%
F11::ControlSend, ahk_parent, {Ctrl down}{F11}{Ctrl up}, ahk_id %FFSafe%
F12::ControlSend, ahk_parent, {Ctrl down}{F12}{Ctrl up}, ahk_id %FFSafe%
Enter::
{
WinRestore, ahk_id %FFNow%
WinMaximize, ahk_id %FFNow%
;ControlSend, ahk_parent, ^{Enter}, ahk_id %FFSafe%
return
}
Tab::ControlSend, ahk_parent, {Ctrl down}{Tab}{Ctrl up}, ahk_id %FFSafe%
Left::ControlSend, ahk_parent, {Ctrl down}{Left}{Ctrl up}, ahk_id %FFSafe%
Right::ControlSend, ahk_parent, {Ctrl down}{Right}{Ctrl up}, ahk_id %FFSafe%
Up::ControlSend, ahk_parent, {Ctrl down}{Up}{Ctrl up}, ahk_id %FFSafe%
Down::ControlSend, ahk_parent, {Ctrl down}{Down}{Ctrl up}, ahk_id %FFSafe%
Backspace::ControlSend, ahk_parent, {Ctrl down}{Backspace}{Ctrl up}, ahk_id %FFSafe%
CapsLock::ControlSend, ahk_parent, {Ctrl down}{Backspace}{Ctrl up}, ahk_id %FFSafe%
Delete::ControlSend, ahk_parent, {Ctrl down}{Delete}{Ctrl up}, ahk_id %FFSafe%
PgUp::ControlSend, ahk_parent, {Ctrl down}{PgUp}{Ctrl up}, ahk_id %FFSafe%
PgDn::ControlSend, ahk_parent, {Ctrl down}{PgDn}{Ctrl up}, ahk_id %FFSafe%
Space::ControlSend, ahk_parent, {Ctrl down}{space}{Ctrl up}, ahk_id %FFSafe%
Home::ControlSend, ahk_parent, {Ctrl down}{Home}{Ctrl up}, ahk_id %FFSafe%
End::ControlSend, ahk_parent, {Ctrl down}{End}{Ctrl up}, ahk_id %FFSafe%

Numpad1::SoundSet, 10, Master, Volume, 10
Numpad2::SoundSet, 20, Master, Volume, 10
Numpad3::SoundSet, 30, Master, Volume, 10
Numpad4::SoundSet, 40, Master, Volume, 10
Numpad5::SoundSet, 50, Master, Volume, 10
Numpad6::SoundSet, 60, Master, Volume, 10
Numpad7::SoundSet, 70, Master, Volume, 10
Numpad8::SoundSet, 80, Master, Volume, 10
Numpad9::SoundSet, 90, Master, Volume, 10
Numpad0::SoundSet, 100, Master, Volume, 10
}
#if

#if (ctrltoggle = 1 && shifttoggle = 1 && alttoggle = 0 && mastertoggle = 1)
{
; ctrl shift goes here
a::ControlSend, ahk_parent, {Ctrl down}{Shift down}a{Ctrl up}{Shift up}, ahk_id %FFSafe%
b::ControlSend, ahk_parent, {Ctrl down}{Shift down}b{Ctrl up}{Shift up}, ahk_id %FFSafe%
c::ControlSend, ahk_parent, {Ctrl down}{Shift down}c{Ctrl up}{Shift up}, ahk_id %FFSafe%
d::ControlSend, ahk_parent, {Ctrl down}{Shift down}d{Ctrl up}{Shift up}, ahk_id %FFSafe%
e::ControlSend, ahk_parent, {Ctrl down}{Shift down}e{Ctrl up}{Shift up}, ahk_id %FFSafe%
f::ControlSend, ahk_parent, {Ctrl down}{Shift down}f{Ctrl up}{Shift up}, ahk_id %FFSafe%
g::ControlSend, ahk_parent, {Ctrl down}{Shift down}g{Ctrl up}{Shift up}, ahk_id %FFSafe%
h::ControlSend, ahk_parent, {Ctrl down}{Shift down}h{Ctrl up}{Shift up}, ahk_id %FFSafe%
i::ControlSend, ahk_parent, {Ctrl down}{Shift down}i{Ctrl up}{Shift up}, ahk_id %FFSafe%
j::ControlSend, ahk_parent, {Ctrl down}{Shift down}j{Ctrl up}{Shift up}, ahk_id %FFSafe%
k::ControlSend, ahk_parent, {Ctrl down}{Shift down}k{Ctrl up}{Shift up}, ahk_id %FFSafe%
l::ControlSend, ahk_parent, {Ctrl down}{Shift down}l{Ctrl up}{Shift up}, ahk_id %FFSafe%
m::ControlSend, ahk_parent, {Ctrl down}{Shift down}m{Ctrl up}{Shift up}, ahk_id %FFSafe%
n::ControlSend, ahk_parent, {Ctrl down}{Shift down}n{Ctrl up}{Shift up}, ahk_id %FFSafe%
o::ControlSend, ahk_parent, {Ctrl down}{Shift down}o{Ctrl up}{Shift up}, ahk_id %FFSafe%
p::ControlSend, ahk_parent, {Ctrl down}{Shift down}p{Ctrl up}{Shift up}, ahk_id %FFSafe%
q::ControlSend, ahk_parent, {Ctrl down}{Shift down}q{Ctrl up}{Shift up}, ahk_id %FFSafe%
r::ControlSend, ahk_parent, {Ctrl down}{Shift down}r{Ctrl up}{Shift up}, ahk_id %FFSafe%
s::ControlSend, ahk_parent, {Ctrl down}{Shift down}s{Ctrl up}{Shift up}, ahk_id %FFSafe%
t::ControlSend, ahk_parent, {Ctrl down}{Shift down}t{Ctrl up}{Shift up}, ahk_id %FFSafe%
u::ControlSend, ahk_parent, {Ctrl down}{Shift down}u{Ctrl up}{Shift up}, ahk_id %FFSafe%
v::ControlSend, ahk_parent, {Ctrl down}{Shift down}v{Ctrl up}{Shift up}, ahk_id %FFSafe%
w::ControlSend, ahk_parent, {Ctrl down}{Shift down}w{Ctrl up}{Shift up}, ahk_id %FFSafe%
x::ControlSend, ahk_parent, {Ctrl down}{Shift down}x{Ctrl up}{Shift up}, ahk_id %FFSafe%
y::ControlSend, ahk_parent, {Ctrl down}{Shift down}y{Ctrl up}{Shift up}, ahk_id %FFSafe%
z::ControlSend, ahk_parent, {Ctrl down}{Shift down}z{Ctrl up}{Shift up}, ahk_id %FFSafe%
Tab::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Tab}{Ctrl up}{Shift up}, ahk_id %FFSafe%
Left::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Left}{Ctrl up}{Shift up}, ahk_id %FFSafe%
Right::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Right}{Ctrl up}{Shift up}, ahk_id %FFSafe%
Up::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Up}{Ctrl up}{Shift up}, ahk_id %FFSafe%
Down::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Down}{Ctrl up}{Shift up}, ahk_id %FFSafe%
Backspace::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Backspace}{Ctrl up}{Shift up}, ahk_id %FFSafe%
CapsLock::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Backspace}{Ctrl up}{Shift up}, ahk_id %FFSafe%
Delete::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Delete}{Ctrl up}{Shift up}, ahk_id %FFSafe%
PgUp::ControlSend, ahk_parent, {Ctrl down}{Shift down}{PgUp}{Ctrl up}{Shift up}, ahk_id %FFSafe%
PgDn::ControlSend, ahk_parent, {Ctrl down}{Shift down}{PgDn}{Ctrl up}{Shift up}, ahk_id %FFSafe%
Home::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Home}{Ctrl up}{Shift up}, ahk_id %FFSafe%
End::ControlSend, ahk_parent, {Ctrl down}{Shift down}{End}{Ctrl up}{Shift up}, ahk_id %FFSafe%
}
#if

#if (ctrltoggle = 0 && shifttoggle = 0 && alttoggle = 1 && mastertoggle = 1)
{
; alt goes here
a::ControlSend, ahk_parent, {Alt down}a{Alt up}, ahk_id %FFSafe%
b::ControlSend, ahk_parent, {Alt down}b{Alt up}, ahk_id %FFSafe%
c::ControlSend, ahk_parent, {Alt down}c{Alt up}, ahk_id %FFSafe%
d::ControlSend, ahk_parent, {Alt down}d{Alt up}, ahk_id %FFSafe%
e::ControlSend, ahk_parent, {Alt down}e{Alt up}, ahk_id %FFSafe%
f::ControlSend, ahk_parent, {Alt down}f{Alt up}, ahk_id %FFSafe%
g::ControlSend, ahk_parent, {Alt down}g{Alt up}, ahk_id %FFSafe%
h::ControlSend, ahk_parent, {Alt down}h{Alt up}, ahk_id %FFSafe%
i::ControlSend, ahk_parent, {Alt down}i{Alt up}, ahk_id %FFSafe%
j::ControlSend, ahk_parent, {Alt down}j{Alt up}, ahk_id %FFSafe%
k::ControlSend, ahk_parent, {Alt down}k{Alt up}, ahk_id %FFSafe%
l::ControlSend, ahk_parent, {Alt down}l{Alt up}, ahk_id %FFSafe%
m::ControlSend, ahk_parent, {Alt down}m{Alt up}, ahk_id %FFSafe%
n::ControlSend, ahk_parent, {Alt down}n{Alt up}, ahk_id %FFSafe%
o::ControlSend, ahk_parent, {Alt down}o{Alt up}, ahk_id %FFSafe%
p::ControlSend, ahk_parent, {Alt down}p{Alt up}, ahk_id %FFSafe%
q::ControlSend, ahk_parent, {Alt down}q{Alt up}, ahk_id %FFSafe%
r::ControlSend, ahk_parent, {Alt down}r{Alt up}, ahk_id %FFSafe%
s::ControlSend, ahk_parent, {Alt down}s{Alt up}, ahk_id %FFSafe%
t::ControlSend, ahk_parent, {Alt down}t{Alt up}, ahk_id %FFSafe%
u::ControlSend, ahk_parent, {Alt down}u{Alt up}, ahk_id %FFSafe%
v::ControlSend, ahk_parent, {Alt down}v{Alt up}, ahk_id %FFSafe%
w::ControlSend, ahk_parent, {Alt down}w{Alt up}, ahk_id %FFSafe%
x::ControlSend, ahk_parent, {Alt down}x{Alt up}, ahk_id %FFSafe%
y::ControlSend, ahk_parent, {Alt down}y{Alt up}, ahk_id %FFSafe%
z::ControlSend, ahk_parent, {Alt down}z{Alt up}, ahk_id %FFSafe%
`::ControlSend, ahk_parent, {Alt down}``{Alt up}, ahk_id %FFSafe%
1::ControlSend, ahk_parent, {Alt down}1{Alt up}, ahk_id %FFSafe%
2::ControlSend, ahk_parent, {Alt down}2{Alt up}, ahk_id %FFSafe%
3::ControlSend, ahk_parent, {Alt down}3{Alt up}, ahk_id %FFSafe%
4::ControlSend, ahk_parent, {Alt down}4{Alt up}, ahk_id %FFSafe%
5::ControlSend, ahk_parent, {Alt down}5{Alt up}, ahk_id %FFSafe%
6::ControlSend, ahk_parent, {Alt down}6{Alt up}, ahk_id %FFSafe%
7::ControlSend, ahk_parent, {Alt down}7{Alt up}, ahk_id %FFSafe%
8::ControlSend, ahk_parent, {Alt down}8{Alt up}, ahk_id %FFSafe%
9::ControlSend, ahk_parent, {Alt down}9{Alt up}, ahk_id %FFSafe%
0::ControlSend, ahk_parent, {Alt down}0{Alt up}, ahk_id %FFSafe%
-::ControlSend, ahk_parent, {Alt down}-{Alt up}, ahk_id %FFSafe%
=::ControlSend, ahk_parent, {Alt down}={Alt up}, ahk_id %FFSafe%
[::ControlSend, ahk_parent, {Alt down}[{Alt up}, ahk_id %FFSafe%
]::ControlSend, ahk_parent, {Alt down}]{Alt up}, ahk_id %FFSafe%
\::ControlSend, ahk_parent, {Alt down}\{Alt up}, ahk_id %FFSafe%
`;::ControlSend, ahk_parent, {Alt down}`;{Alt up}, ahk_id %FFSafe%
'::ControlSend, ahk_parent, {Alt down}'{Alt up}, ahk_id %FFSafe%
,::ControlSend, ahk_parent, {Alt down}`{Alt up},, ahk_id %FFSafe%
.::ControlSend, ahk_parent, {Alt down}.{Alt up}, ahk_id %FFSafe%
/::ControlSend, ahk_parent, {Alt down}/{Alt up}, ahk_id %FFSafe%
F1::ControlSend, ahk_parent, {Alt down}{F1}{Alt up}, ahk_id %FFSafe%
F2::ControlSend, ahk_parent, {Alt down}{F2}{Alt up}, ahk_id %FFSafe%
F3::ControlSend, ahk_parent, {Alt down}{F3}{Alt up}, ahk_id %FFSafe%
F4::ControlSend, ahk_parent, {Alt down}{F4}{Alt up}, ahk_id %FFSafe%
F5::ControlSend, ahk_parent, {Alt down}{F5}{Alt up}, ahk_id %FFSafe%
F6::ControlSend, ahk_parent, {Alt down}{F6}{Alt up}, ahk_id %FFSafe%
F7::ControlSend, ahk_parent, {Alt down}{F7}{Alt up}, ahk_id %FFSafe%
F8::ControlSend, ahk_parent, {Alt down}{F8}{Alt up}, ahk_id %FFSafe%
F9::ControlSend, ahk_parent, {Alt down}{F9}{Alt up}, ahk_id %FFSafe%
F10::ControlSend, ahk_parent, {Alt down}{F10}{Alt up}, ahk_id %FFSafe%
F11::ControlSend, ahk_parent, {Alt down}{F11}{Alt up}, ahk_id %FFSafe%
F12::ControlSend, ahk_parent, {Alt down}{F12}{Alt up}, ahk_id %FFSafe%
Enter::ControlSend, ahk_parent, {Alt down}{Enter}{Alt up}, ahk_id %FFSafe%
Tab::Send, !{tab}
Left::ControlSend, ahk_parent, {Alt down}{Left}{Alt up}, ahk_id %FFSafe%
Right::ControlSend, ahk_parent, {Alt down}{Right}{Alt up}, ahk_id %FFSafe%
Up::ControlSend, ahk_parent, {Alt down}{Up}{Alt up}, ahk_id %FFSafe%
Down::ControlSend, ahk_parent, {Alt down}{Down}{Alt up}, ahk_id %FFSafe%
Backspace::ControlSend, ahk_parent, {Alt down}{Backspace}{Alt up}, ahk_id %FFSafe%
CapsLock::ControlSend, ahk_parent, {Alt down}{Backspace}{Alt up}, ahk_id %FFSafe%
Delete::ControlSend, ahk_parent, {Alt down}{Delete}{Alt up}, ahk_id %FFSafe%
PgUp::ControlSend, ahk_parent, {Alt down}{PgUp}{Alt up}, ahk_id %FFSafe%
PgDn::ControlSend, ahk_parent, {Alt down}{PgDn}{Alt up}, ahk_id %FFSafe%
Space::ControlSend, ahk_parent, {Alt down}{space}{Alt up}, ahk_id %FFSafe%
Home::ControlSend, ahk_parent, {Alt down}{Home}{Alt up}, ahk_id %FFSafe%
End::ControlSend, ahk_parent, {Alt down}{End}{Alt up}, ahk_id %FFSafe%
Numpad1::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(10)
return
}
Numpad2::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(20)
return
}
Numpad3::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(30)
return
}
Numpad4::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(40)
return
}
Numpad5::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(50)
return
}
Numpad6::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(60)
return
}
Numpad7::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(70)
return
}
Numpad8::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(80)
return
}
Numpad9::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(90)
return
}
Numpad0::
{
WinGet, ProcessName, ProcessName, A
AppVolume(ProcessName).AdjustVolumeSet(100)
return
}
}
#if

#if (ctrltoggle = 0 && shifttoggle = 1 && alttoggle = 0 && mastertoggle = 1)
{
; shift goes here
a::ControlSend, ahk_parent, {Shift down}a{Shift up}, ahk_id %FFSafe%
b::ControlSend, ahk_parent, {Shift down}b{Shift up}, ahk_id %FFSafe%
c::ControlSend, ahk_parent, {Shift down}c{Shift up}, ahk_id %FFSafe%
d::ControlSend, ahk_parent, {Shift down}d{Shift up}, ahk_id %FFSafe%
e::ControlSend, ahk_parent, {Shift down}e{Shift up}, ahk_id %FFSafe%
f::ControlSend, ahk_parent, {Shift down}f{Shift up}, ahk_id %FFSafe%
g::ControlSend, ahk_parent, {Shift down}g{Shift up}, ahk_id %FFSafe%
h::ControlSend, ahk_parent, {Shift down}h{Shift up}, ahk_id %FFSafe%
i::ControlSend, ahk_parent, {Shift down}i{Shift up}, ahk_id %FFSafe%
j::ControlSend, ahk_parent, {Shift down}j{Shift up}, ahk_id %FFSafe%
k::ControlSend, ahk_parent, {Shift down}k{Shift up}, ahk_id %FFSafe%
l::ControlSend, ahk_parent, {Shift down}l{Shift up}, ahk_id %FFSafe%
m::ControlSend, ahk_parent, {Shift down}m{Shift up}, ahk_id %FFSafe%
n::ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_id %FFSafe%
o::ControlSend, ahk_parent, {Shift down}o{Shift up}, ahk_id %FFSafe%
p::ControlSend, ahk_parent, {Shift down}p{Shift up}, ahk_id %FFSafe%
q::ControlSend, ahk_parent, {Shift down}q{Shift up}, ahk_id %FFSafe%
r::ControlSend, ahk_parent, {Shift down}r{Shift up}, ahk_id %FFSafe%
s::ControlSend, ahk_parent, {Shift down}s{Shift up}, ahk_id %FFSafe%
t::ControlSend, ahk_parent, {Shift down}t{Shift up}, ahk_id %FFSafe%
u::ControlSend, ahk_parent, {Shift down}u{Shift up}, ahk_id %FFSafe%
v::ControlSend, ahk_parent, {Shift down}v{Shift up}, ahk_id %FFSafe%
w::ControlSend, ahk_parent, {Shift down}w{Shift up}, ahk_id %FFSafe%
x::ControlSend, ahk_parent, {Shift down}x{Shift up}, ahk_id %FFSafe%
y::ControlSend, ahk_parent, {Shift down}y{Shift up}, ahk_id %FFSafe%
z::ControlSend, ahk_parent, {Shift down}z{Shift up}, ahk_id %FFSafe%
`::ControlSend, ahk_parent, {Shift down}``{Shift up}, ahk_id %FFSafe%
1::ControlSend, ahk_parent, {Shift down}1{Shift up}, ahk_id %FFSafe%
2::ControlSend, ahk_parent, {Shift down}2{Shift up}, ahk_id %FFSafe%
3::ControlSend, ahk_parent, {Shift down}3{Shift up}, ahk_id %FFSafe%
4::ControlSend, ahk_parent, {Shift down}4{Shift up}, ahk_id %FFSafe%
5::ControlSend, ahk_parent, {Shift down}5{Shift up}, ahk_id %FFSafe%
6::ControlSend, ahk_parent, {Shift down}6{Shift up}, ahk_id %FFSafe%
7::ControlSend, ahk_parent, {Shift down}7{Shift up}, ahk_id %FFSafe%
8::ControlSend, ahk_parent, {Shift down}8{Shift up}, ahk_id %FFSafe%
9::ControlSend, ahk_parent, {Shift down}9{Shift up}, ahk_id %FFSafe%
0::ControlSend, ahk_parent, {Shift down}0{Shift up}, ahk_id %FFSafe%
-::ControlSend, ahk_parent, {Shift down}-{Shift up}, ahk_id %FFSafe%
=::ControlSend, ahk_parent, {Shift down}={Shift up}, ahk_id %FFSafe%
[::ControlSend, ahk_parent, {Shift down}[{Shift up}, ahk_id %FFSafe%
]::ControlSend, ahk_parent, {Shift down}]{Shift up}, ahk_id %FFSafe%
\::ControlSend, ahk_parent, {Shift down}\{Shift up}, ahk_id %FFSafe%
`;::ControlSend, ahk_parent, {Shift down}`;{Shift up}, ahk_id %FFSafe%
'::ControlSend, ahk_parent, {Shift down}'{Shift up}, ahk_id %FFSafe%
,::ControlSend, ahk_parent, {Shift down}`,{Shift up}, ahk_id %FFSafe%
.::ControlSend, ahk_parent, {Shift down}.{Shift up}, ahk_id %FFSafe%
/::ControlSend, ahk_parent, {Shift down}/{Shift up}, ahk_id %FFSafe%
F1::ControlSend, ahk_parent, {Shift down}{F1}{Shift up}, ahk_id %FFSafe%
F2::ControlSend, ahk_parent, {Shift down}{F2}{Shift up}, ahk_id %FFSafe%
F3::ControlSend, ahk_parent, {Shift down}{F3}{Shift up}, ahk_id %FFSafe%
F4::ControlSend, ahk_parent, {Shift down}{F4}{Shift up}, ahk_id %FFSafe%
F5::ControlSend, ahk_parent, {Shift down}{F5}{Shift up}, ahk_id %FFSafe%
F6::ControlSend, ahk_parent, {Shift down}{F6}{Shift up}, ahk_id %FFSafe%
F7::ControlSend, ahk_parent, {Shift down}{F7}{Shift up}, ahk_id %FFSafe%
F8::ControlSend, ahk_parent, {Shift down}{F8}{Shift up}, ahk_id %FFSafe%
F9::ControlSend, ahk_parent, {Shift down}{F9}{Shift up}, ahk_id %FFSafe%
F10::ControlSend, ahk_parent, {Shift down}{F10}{Shift up}, ahk_id %FFSafe%
F11::ControlSend, ahk_parent, {Shift down}{F11}{Shift up}, ahk_id %FFSafe%
F12::ControlSend, ahk_parent, {Shift down}{F12}{Shift up}, ahk_id %FFSafe%
Enter::ControlSend, ahk_parent, {Shift down}{Enter}{Shift up}, ahk_id %FFSafe%
Tab::ControlSend, ahk_parent, {Shift down}{Tab}{Shift up}, ahk_id %FFSafe%
Left::ControlSend, ahk_parent, {Shift down}{Left}{Shift up}, ahk_id %FFSafe%
Right::ControlSend, ahk_parent, {Shift down}{Right}{Shift up}, ahk_id %FFSafe%
Up::ControlSend, ahk_parent, {Shift down}{Up}{Shift up}, ahk_id %FFSafe%
Down::ControlSend, ahk_parent, {Shift down}{Down}{Shift up}, ahk_id %FFSafe%
Backspace::ControlSend, ahk_parent, {Shift down}{Backspace}{Shift up}, ahk_id %FFSafe%
CapsLock::ControlSend, ahk_parent, {Shift down}{Backspace}{Shift up}, ahk_id %FFSafe%
Delete::ControlSend, ahk_parent, {Shift down}{Delete}{Shift up}, ahk_id %FFSafe%
PgUp::ControlSend, ahk_parent, {Shift down}{PgUp}{Shift up}, ahk_id %FFSafe%
PgDn::ControlSend, ahk_parent, {Shift down}{PgDn}{Shift up}, ahk_id %FFSafe%
Space::ControlSend, ahk_parent, {Shift down}{space}{Shift up}, ahk_id %FFSafe%
Home::ControlSend, ahk_parent, {Shift down}{Home}{Shift up}, ahk_id %FFSafe%
End::ControlSend, ahk_parent, {Shift down}{End}{Shift up}, ahk_id %FFSafe%
}
#if

#If (ctrltoggle = 1 && shifttoggle = 0 && alttoggle = 1 && mastertoggle = 1)
{
Numpad1::
{
AppVolume("firefox.exe").AdjustVolumeSet(10)
AppVolume("Plex.exe").AdjustVolumeSet(10)
AppVolume("vlc.exe").AdjustVolumeSet(10)
AppVolume("Spotify.exe").AdjustVolumeSet(10)
return
}
Numpad2::
{
AppVolume("firefox.exe").AdjustVolumeSet(20)
AppVolume("Plex.exe").AdjustVolumeSet(20)
AppVolume("vlc.exe").AdjustVolumeSet(20)
AppVolume("Spotify.exe").AdjustVolumeSet(20)
return
}
Numpad3::
{
AppVolume("firefox.exe").AdjustVolumeSet(30)
AppVolume("Plex.exe").AdjustVolumeSet(30)
AppVolume("vlc.exe").AdjustVolumeSet(30)
AppVolume("Spotify.exe").AdjustVolumeSet(30)
return
}
Numpad4::
{
AppVolume("firefox.exe").AdjustVolumeSet(40)
AppVolume("Plex.exe").AdjustVolumeSet(40)
AppVolume("vlc.exe").AdjustVolumeSet(40)
AppVolume("Spotify.exe").AdjustVolumeSet(40)
return
}
Numpad5::
{
AppVolume("firefox.exe").AdjustVolumeSet(50)
AppVolume("Plex.exe").AdjustVolumeSet(50)
AppVolume("vlc.exe").AdjustVolumeSet(50)
AppVolume("Spotify.exe").AdjustVolumeSet(50)
return
}
Numpad6::
{
AppVolume("firefox.exe").AdjustVolumeSet(60)
AppVolume("Plex.exe").AdjustVolumeSet(60)
AppVolume("vlc.exe").AdjustVolumeSet(60)
AppVolume("Spotify.exe").AdjustVolumeSet(60)
return
}
Numpad7::
{
AppVolume("firefox.exe").AdjustVolumeSet(70)
AppVolume("Plex.exe").AdjustVolumeSet(70)
AppVolume("vlc.exe").AdjustVolumeSet(70)
AppVolume("Spotify.exe").AdjustVolumeSet(70)
return
}
Numpad8::
{
AppVolume("firefox.exe").AdjustVolumeSet(80)
AppVolume("Plex.exe").AdjustVolumeSet(80)
AppVolume("vlc.exe").AdjustVolumeSet(80)
AppVolume("Spotify.exe").AdjustVolumeSet(80)
return
}
Numpad9::
{
AppVolume("firefox.exe").AdjustVolumeSet(90)
AppVolume("Plex.exe").AdjustVolumeSet(90)
AppVolume("vlc.exe").AdjustVolumeSet(90)
AppVolume("Spotify.exe").AdjustVolumeSet(90)
return
}
Numpad0::
{
AppVolume("firefox.exe").AdjustVolumeSet(100)
AppVolume("Plex.exe").AdjustVolumeSet(100)
AppVolume("vlc.exe").AdjustVolumeSet(100)
AppVolume("Spotify.exe").AdjustVolumeSet(100)
return
}
}
#if

; These hotkeys don't require the appskey

^Volume_Up::
{
AppVolume("firefox.exe").AdjustVolume(2)
AppVolume("Plex.exe").AdjustVolume(2)
AppVolume("vlc.exe").AdjustVolume(2)
AppVolume("Spotify.exe").AdjustVolume(2)
return
}
^Volume_Down::
{
AppVolume("firefox.exe").AdjustVolume(-2)
AppVolume("Plex.exe").AdjustVolume(-2)
AppVolume("vlc.exe").AdjustVolume(-2)
AppVolume("Spotify.exe").AdjustVolume(-2)
return
}

+Volume_Up::AppVolume("Spotify.exe").AdjustVolume(2)
+Volume_Down::AppVolume("Spotify.exe").AdjustVolume(-2)

#+F1::
{
;run "C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe" /1:SetActiveInput mDP /Exit
; run "Nircmd\SoundVolumeView.exe" /Mute "Consoles"
SoundSet, 1, Master, Mute, 10
return
}

#+F2::
{
; run "Nircmd\SoundVolumeView.exe" /Unmute "Consoles"
SoundSet, 0, Master, Mute, 10
run "C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe" /1:SetActiveInput HDMI /Exit
return
}

#+F3::
{
; run "Nircmd\SoundVolumeView.exe" /Unmute "Consoles"
SoundSet, 0, Master, Mute, 10
run "C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe" /1:SetActiveInput HDMI2 /Exit
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
