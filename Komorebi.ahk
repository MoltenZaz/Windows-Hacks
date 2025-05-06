#Requires AutoHotkey v2.0

global toggle := 0
global x2_toggle := 0
global testing_id

BlacklistE := ["cadwin.exe","happrentice.exe","houdinifx.exe","houdini.exe","mplay.exe"]
BlacklistC := ["WorkerW","Progman","Windows.UI.Core.CoreWindow"]

GroupAdd("Blacklist", "ahk_exe cadwin.exe")
GroupAdd("Blacklist", "ahk_exe happrentice.exe")
GroupAdd("Blacklist", "ahk_exe houdinifx.exe")
GroupAdd("Blacklist", "ahk_exe houdini.exe")
GroupAdd("Blacklist", "ahk_exe mplay.exe")
GroupAdd("Blacklist", "ahk_class WorkerW")
GroupAdd("Blacklist", "ahk_class Progman")
GroupAdd("Blacklist", "ahk_class Windows.UI.Core.CoreWindow")

#SingleInstance Force
Tray:= A_TrayMenu
A_MaxHotkeysPerInterval := 1000
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
SetKeyDelay(-1)
TraySetIcon("SHELL32.dll","99")
SetControlDelay -1

InstallKeybdHook()

RunWait(format("komorebic.exe {}", "start"), , "Hide")

KomorebicU(cmd) {
	MouseGetPos(&x, &y, &testing_id)
	WinActivate("ahk_class Progman")
	ControlClick "x%x% y%y%", "ahk_class Progman",,,, "NA"
	WinActivate(testing_id)
	RunWait(format("komorebic.exe {}", cmd), , "Hide")
	return
}

Komorebic(cmd) {
	MouseGetPos(, , &testing_id)
	active_exe := WinGetProcessName(testing_id)
	active_class := WinGetClass(testing_id)
	global testing_id := testing_id
	isFullScreen := isWindowFullScreen(testing_id)
	if (isFullScreen != 1)
	{
		for each, word in BlacklistE
		{
			if (active_exe == word)
			{
				; SoundBeep
				return
			}
		}
		for each, word in BlacklistC
		{
			if (active_class == word)
			{
				; SoundBeep
				return
			}
		}
		WinActivate(testing_id)
		RunWait(format("komorebic.exe {}", cmd), , "Hide")
	}
	return
}

F20::
{
	isFullScreen := isWindowFullScreen("A")
	if !WinActive("ahk_group Blacklist")
	{
		if (isFullScreen = 1)
		{
			global toggle := 0
			SendInput "{3 down}"
			KeyWait("F20", "U")
			SendInput "{3 up}"
			return
		}
	}
	if (isFullScreen != "1" or WinActive("ahk_group Blacklist") or WinActive("ahk_class MozillaWindowClass"))
	{
		global toggle := 1
		; SoundBeep
		KeyWait("F20")
		global toggle := 0
		return
	}
	toggle := 0
	return
}

; ──────────────────────────────────────────── FULLSCREEN CHECKER ────────────────────────────────────────────

isWindowFullScreen(winTitle) {
    winID := WinExist(winTitle)
    if (!winID)
        return false

    try {
        style := WinGetStyle(winID)
        WinGetPos(, , &winW, &winH, winTitle)
    } catch {
        return false
    }
    
    ; 0x800000 is WS_BORDER.
    ; 0x20000000 is WS_MINIMIZE.
    ; No border and not minimized
    return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
}

; ────────────────────────────────────────────────────────────────────────────────────────────────────────────

; i::MsgBox(toggle)
; n::
; {
; global toggle:=1
; return
; }
F18::
{
	If (toggle = 1)
	{
		MouseGetPos(, , &testing_id)
		WinActivate("ahk_class Progman")
		WinActivate(testing_id)
		WinGetPos , , , &H, "A"
		if (H == "1080" or H == "1440")
		{
			; MsgBox(H)
			return
		}
		else
		{
			Komorebic("toggle-maximize")
		}
		; Sleep 100
		; WinActivate("ahk_class Progman")
		; WinActivate(testing_id)
		return
	}
	else
	{
		isFullScreen := isWindowFullScreen("A")
		if !WinActive("ahk_group Blacklist")
		{
			if (isFullScreen = 1)
			{
				SendInput "{4 down}"
				KeyWait("F18", "U")
				SendInput "{4 up}"
				return
			}
		}
		if (WinActive("ahk_class CabinetWClass") or WinActive("ahk_class #32770"))
		{
			Send "!{Up}"
			return
		}
		else
		{
			SendInput "{XButton2 down}"
			KeyWait("F18", "U")
			SendInput "{XButton2 up}"
			return
		}
	}
}
F17::
{
	If (toggle = 1)
	{
		Komorebic("minimize")
		return
	}
	else
	{
		isFullScreen := isWindowFullScreen("A")
		if !WinActive("ahk_group Blacklist")
		{
			if (isFullScreen = 1)
			{
				SendInput "{5 down}"
				KeyWait("F17", "U")
				SendInput "{5 up}"
				return
			}
		}
		SendInput "{XButton1 down}"
		KeyWait("F17", "U")
		SendInput "{XButton1 up}"
		return
	}
}
XButton1::
{
	If (toggle = 1)
	{
		return
	}
	else
	{
		isFullScreen := isWindowFullScreen("A")
		if !WinActive("ahk_group Blacklist")
		{
			if (isFullScreen = 1)
			{
				SendInput "{2 down}"
				KeyWait("XButton1", "U")
				SendInput "{2 up}"
				return
			}
		}
		SendInput "{XButton1 down}"
		KeyWait("XButton1", "U")
		SendInput "{XButton1 up}"
		return
	}
}
XButton2::
{
	If (toggle = 1)
	{
		global x2_toggle := 1
		KeyWait("XButton2")
		global x2_toggle := 0
		return
	}
	else
	{
		isFullScreen := isWindowFullScreen("A")
		if !WinActive("ahk_group Blacklist")
		{
			if (isFullScreen = 1)
			{
				SendInput "{1 down}"
				KeyWait("XButton2", "U")
				SendInput "{1 up}"
				return
			}
		}
		SendInput "{XButton2 down}"
		KeyWait("XButton2", "U")
		SendInput "{XButton2 up}"
		return
	}
}

#HotIf (toggle = 1)
{
	LButton::
	{
		MouseGetPos(, , &testing_id)
		; WinActivate("ahk_class Progman")
		WinActivate(testing_id)
		WinGetPos , , , &H, "A"
		if (H == "1080" or H == "1440")
		{
			; MsgBox(H)
			return
		}
		else
		{
			Komorebic("promote")
			; Sleep 500
			WinActivate("ahk_class Progman")
			WinActivate(testing_id)
		}
		return
	}
	
	RButton::
	{
		MouseGetPos(, , &testing_id)
		; WinActivate("ahk_class Progman")
		WinActivate(testing_id)
		WinGetPos , , , &H, "A"
		if (H == "1080" or H == "1440")
		{
			; MsgBox(H)
			return
		}
		else
		{
			Komorebic("cycle-send-to-monitor next")
			WinActivate("ahk_class Progman")
			WinActivate(testing_id)
		}
		return
	}

	MButton::Komorebic("close")

	WheelUp::
	{
		if (x2_toggle = 1)
		{
			Komorebic("resize-axis vertical increase")
		}
		else
		{
			Komorebic("resize-axis horizontal increase")
		}
		return
	}
	WheelDown::
	{
		if (x2_toggle = 1)
		{
			Komorebic("resize-axis vertical decrease")
		}
		else
		{
			Komorebic("resize-axis horizontal decrease")
		}
		return
	}
	
	; move
	i::Komorebic("move left")
	a::Komorebic("move right")
	e::Komorebic("move up")
	n::Komorebic("move down")
	
	; resize
	=::Komorebic("resize-axis horizontal increase")
	-::Komorebic("resize-axis horizontal decrease")
	+=::Komorebic("resize-axis vertical increase")
	+_::Komorebic("resize-axis vertical decrease")
	
	; flip
	z::Komorebic("flip-layout horizontal")
	q::Komorebic("flip-layout vertical")
	
	; Workspaces
	1::KomorebicU("focus-workspace 0")
	2::KomorebicU("focus-workspace 1")
	3::KomorebicU("focus-workspace 2")
	4::KomorebicU("focus-workspace 3")
	5::KomorebicU("focus-workspace 4")
	6::KomorebicU("focus-workspace 5")
	7::KomorebicU("focus-workspace 6")
	8::KomorebicU("focus-workspace 7")

	; Move windows across workspaces
	+1::Komorebic("move-to-workspace 0")
	+2::Komorebic("move-to-workspace 1")
	+3::Komorebic("move-to-workspace 2")
	+4::Komorebic("move-to-workspace 3")
	+5::Komorebic("move-to-workspace 4")
	+6::Komorebic("move-to-workspace 5")
	+7::Komorebic("move-to-workspace 6")
	+8::Komorebic("move-to-workspace 7")

	; Move windows across workspaces
	!1::Komorebic("send-to-workspace 0")
	!2::Komorebic("send-to-workspace 1")
	!3::Komorebic("send-to-workspace 2")
	!4::Komorebic("send-to-workspace 3")
	!5::Komorebic("send-to-workspace 4")
	!6::Komorebic("send-to-workspace 5")
	!7::Komorebic("send-to-workspace 6")
	!8::Komorebic("send-to-workspace 7")
}
#Hotif

^!#q::Komorebic("stop")

#q::Komorebic("close")
#m::Komorebic("minimize")

; Focus windows
#j::Komorebic("focus left")
#l::Komorebic("focus down")
#k::Komorebic("focus up")
#`;::Komorebic("focus right")

; #+[::Komorebic("cycle-focus previous")
; #+]::Komorebic("cycle-focus next")

; Move windows
#+j::Komorebic("move left")
#+l::Komorebic("move down")
#+k::Komorebic("move up")
#+`;::Komorebic("move right")

#^j::Komorebic("move left")
#^l::Komorebic("move down")
#^k::Komorebic("move up")
#^`;::Komorebic("move right")

; Stack windows
; #Left::Komorebic("stack left")
; #Down::Komorebic("stack down")
; #Up::Komorebic("stack up")
; #Right::Komorebic("stack right")
; ; #;::Komorebic("unstack")
; #[::Komorebic("cycle-stack previous")
; #]::Komorebic("cycle-stack next")

; Resize
#=::Komorebic("resize-axis horizontal increase")
#-::Komorebic("resize-axis horizontal decrease")
#+=::Komorebic("resize-axis vertical increase")
#+_::Komorebic("resize-axis vertical decrease")
#Enter::Komorebic("promote")
; #z::Komorebic("toggle-maximize")

; Manipulate windows
#t::Komorebic("toggle-float")
#f::Komorebic("toggle-monocle")

; Window manager options
#!r::Komorebic("retile")
; #p::Komorebic("toggle-pause")
#p::	; Komorebic("toggle-pause")
{
	; turn off komorebic, open easy window organiser and close this script
	RunWait(format("komorebic.exe {}", "stop"), , "Hide")
	Run("Easy Window Organiser.ahk",,"Hide")
	ExitApp
}

; Layouts
#^x::Komorebic("flip-layout horizontal")
#^z::Komorebic("flip-layout vertical")

; Workspaces
#1::KomorebicU("focus-workspace 0")
#2::KomorebicU("focus-workspace 1")
#3::KomorebicU("focus-workspace 2")
#4::KomorebicU("focus-workspace 3")
#5::KomorebicU("focus-workspace 4")
#6::KomorebicU("focus-workspace 5")
#7::KomorebicU("focus-workspace 6")
#8::KomorebicU("focus-workspace 7")

; Move windows across workspaces
#+1::Komorebic("move-to-workspace 0")
#+2::Komorebic("move-to-workspace 1")
#+3::Komorebic("move-to-workspace 2")
#+4::Komorebic("move-to-workspace 3")
#+5::Komorebic("move-to-workspace 4")
#+6::Komorebic("move-to-workspace 5")
#+7::Komorebic("move-to-workspace 6")
#+8::Komorebic("move-to-workspace 7")

; Move windows across workspaces
#!1::Komorebic("send-to-workspace 0")
#!2::Komorebic("send-to-workspace 1")
#!3::Komorebic("send-to-workspace 2")
#!4::Komorebic("send-to-workspace 3")
#!5::Komorebic("send-to-workspace 4")
#!6::Komorebic("send-to-workspace 5")
#!7::Komorebic("send-to-workspace 6")
#!8::Komorebic("send-to-workspace 7")