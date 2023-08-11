#NoEnv
#SingleInstance force
Menu, Tray, Icon, pifmgr.dll, 13
#MaxHotkeysPerInterval 1000
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, -1

; this script changes the layer of my qmk keyboard when entering games and for certain programs
; it requires your keyboard to use raw hid and it also uses hidapitester to send the codes to qmk
; hidapitester sends the number to qmk 1,1 for example and then qmk is preprogammed to know that 1,1 means turn off the gaming layer
; look through my keymap.c and the shortcut links in this repo if you want to learn more

; ──────────────────────────────────────────── FULLSCREEN CHECKER ────────────────────────────────────────────

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

; ────────────────────────────────────────────────────────────────────────────────────────────────────────────
; change left nav layer when in autocad
; when fullscreen is detected capture app id
; when app is closed/alt tabbed change to mtgap
; change back when focussed again (maybe using alt tab detection)
dcheck := 60

#ifWinActive ahk_exe steamwebhelper.exe
~LButton::
{
; msgbox steam
WinWaitNotActive, ahk_exe steamwebhelper.exe
; msgbox nosteam
dcheck := 60
checkfs:
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
IfWinNotActive, ahk_class Windows.UI.Core.CoreWindow
IfWinNotActive, ahk_class MozillaWindowClass
IfWinNotActive, ahk_class Chrome_WidgetWin_1
{
	if isFullScreen = 1 ; try multiple times with delay inbetween before deciding to change to mtgap
	{
		; change keyboard layer to gaming
		run "F:\Documents\AHK Current\Enter Gaming.lnk" hide
		dcheck := 0
		WinGet, active_id, ProcessName, A
		if (active_id = "TetrisEffect-Win64-Shipping.exe" or active_id = "celeste.exe")
		{
			run "F:\Documents\AHK Current\Enter Arrows.lnk" hide
		}
		SetTimer, LoseFocus, 100
		WinWaitClose, ahk_exe %active_id%
		if (active_id = "TetrisEffect-Win64-Shipping.exe" or active_id = "celeste.exe")
		{
			run "F:\Documents\AHK Current\Exit Arrows.lnk" hide
		}
		SetTimer, LoseFocus, Delete
		; change keyboard layer to mtgap
		run "F:\Documents\AHK Current\Exit Gaming.lnk" hide
		; msgbox, fs
		return
	}
	if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman or IfWinActive, ahk_class Windows.UI.Core.CoreWindow or IfWinActive, ahk_class MozillaWindowClass or IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		if dcheck > 0
		{
			dcheck--
			Sleep, 1000
			Goto, checkfs
		}
		return
	}
}
return
}
#if

LoseFocus:
{
SetTimer, LoseFocus, Off
WinWaitNotActive, ahk_exe %active_id%
run "F:\Documents\AHK Current\Exit Gaming.lnk" hide
if (active_id = "TetrisEffect-Win64-Shipping.exe" or active_id = "celeste.exe")
{
	run "F:\Documents\AHK Current\Exit Arrows.lnk" hide
}
IfWinExist, ahk_exe %active_id%
WinWaitActive, ahk_exe %active_id%
run "F:\Documents\AHK Current\Enter Gaming.lnk" hide
if (active_id = "TetrisEffect-Win64-Shipping.exe" or active_id = "celeste.exe")
{
	run "F:\Documents\AHK Current\Enter Arrows.lnk" hide
}
IfWinExist, ahk_exe %active_id%
SetTimer, LoseFocus, 100
return
}

#IfWinActive ahk_exe acad.exe
{
~LButton::
{
	WinGet, active_work, ProcessName, A
	run "F:\Documents\AHK Current\Enter Work.lnk" hide
	SetTimer, LoseFocusWork, 100
	WinWaitClose, ahk_exe %active_work%
	if (active_w2 != "acad.exe" and active_w2 != "houdini.exe")
	{
		run "F:\Documents\AHK Current\Exit Work.lnk" hide
		SetTimer, LoseFocusWork, Delete
	}
}
return
}
#if

#IfWinActive ahk_exe houdini.exe
{
~LButton::
{
	WinGet, active_work, ProcessName, A
	run "F:\Documents\AHK Current\Enter Work.lnk" hide
	SetTimer, LoseFocusWork, 100
	WinWaitClose, ahk_exe %active_work%
	if (active_w2 != "acad.exe" and active_w2 != "houdini.exe")
	{
		run "F:\Documents\AHK Current\Exit Work.lnk" hide
		SetTimer, LoseFocusWork, Delete
	}
}
return
}
#if

LoseFocusWork:
{
SetTimer, LoseFocusWork, Off
WinWaitNotActive, ahk_exe %active_work%
run "F:\Documents\AHK Current\Exit Work.lnk" hide
IfWinExist, ahk_exe %active_work%
WinWaitActive, ahk_exe %active_work%
run "F:\Documents\AHK Current\Enter Work.lnk" hide
IfWinExist, ahk_exe %active_work%
SetTimer, LoseFocusWork, 100
return
}