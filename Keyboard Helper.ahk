﻿#NoEnv
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

; a::
; {
; WinGet, active_id, ProcessName, A
; msgbox, %active_id%
; return
; }
GroupAdd, NPMOD, ahk_exe acad.exe
GroupAdd, NPMOD, ahk_exe Revit.exe
GroupAdd, NPMOD, ahk_exe cadwin.exe
#IfWinActive ahk_group NPMOD
~LButton::
{
; msgbox, i
; WinGet, NPMOD, ProcessName, A
run "F:\Documents\AHK Current\Enter NPMOD.lnk" hide
GoSub, LoseFocusNPMOD
WinWaitClose, ahk_group NPMOD
return
}
#if

LoseFocusNPMOD:
{
IfWinExist, ahk_group NPMOD
{
	WinWaitNotActive, ahk_group NPMOD
	run "F:\Documents\AHK Current\Exit NPMOD.lnk" hide
	WinWaitActive, ahk_group NPMOD
	run "F:\Documents\AHK Current\Enter NPMOD.lnk" hide
	GoSub, LoseFocusNPMOD
}
return
}
F1::MsgBox, %NPMOD%
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
		dcheck := 0
		WinGet, active_id, ProcessName, A
		; blacklist
		if (active_id = "Shenzhen.exe" or active_id = "retroarch.exe" or active_id = "attract.exe" or active_id = "picross.exe")
		{
			; msgbox, isthn
			return
		}
		else
		{
			run "F:\Documents\AHK Current\Enter Gaming.lnk" hide
			run "F:\Documents\AHK Current\Enter Gaming ID75.lnk" hide
			; also arrow keys list
			if (active_id = "TetrisEffect-Win64-Shipping.exe" or active_id = "celeste.exe")
			{
				run "F:\Documents\AHK Current\Enter Arrows.lnk" hide
				run "F:\Documents\AHK Current\Enter Arrows ID75.lnk" hide
			}
			SetTimer, LoseFocus, 100
			WinWaitClose, ahk_exe %active_id%
			SetTimer, LoseFocus, Delete
			; also arrow keys list
			if (active_id = "TetrisEffect-Win64-Shipping.exe" or active_id = "celeste.exe")
			{
				run "F:\Documents\AHK Current\Exit Arrows.lnk" hide
				run "F:\Documents\AHK Current\Exit Arrows ID75.lnk" hide
			}
			; change keyboard layer to mtgap
			run "F:\Documents\AHK Current\Exit Gaming.lnk" hide
			run "F:\Documents\AHK Current\Exit Gaming ID75.lnk" hide
		}
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
IfWinNotExist, ahk_exe %active_id%
	Return
run "F:\Documents\AHK Current\Exit Gaming.lnk" hide
run "F:\Documents\AHK Current\Exit Gaming ID75.lnk" hide
; also arrow keys list
if (active_id = "TetrisEffect-Win64-Shipping.exe" or active_id = "celeste.exe")
{
	run "F:\Documents\AHK Current\Exit Arrows.lnk" hide
	run "F:\Documents\AHK Current\Exit Arrows ID75.lnk" hide
}
IfWinExist, ahk_exe %active_id%
WinWaitActive, ahk_exe %active_id%
IfWinNotExist, ahk_exe %active_id%
{
	SetTimer, LoseFocus, Delete
	Return
}
IfWinExist, ahk_exe %active_id%
{
	run "F:\Documents\AHK Current\Enter Gaming.lnk" hide
	run "F:\Documents\AHK Current\Enter Gaming ID75.lnk" hide
	; also arrow keys list
	if (active_id = "TetrisEffect-Win64-Shipping.exe" or active_id = "celeste.exe")
	{
		run "F:\Documents\AHK Current\Enter Arrows.lnk" hide
		run "F:\Documents\AHK Current\Enter Arrows ID75.lnk" hide
	}
	SetTimer, LoseFocus, 500
}
return
}

; #IfWinActive ahk_exe acad.exe
; {
; ~LButton::
; {
	; WinGet, active_work, ProcessName, A
	; run "F:\Documents\AHK Current\Enter Work.lnk" hide
	; SetTimer, LoseFocusWork, 100
	; WinWaitClose, ahk_exe %active_work%
	; if (active_w2 != "acad.exe" and active_w2 != "houdini.exe")
	; {
		; run "F:\Documents\AHK Current\Exit Work.lnk" hide
		; SetTimer, LoseFocusWork, Delete
	; }
; }
; return
; }
; #if

; #IfWinActive ahk_exe houdini.exe
; {
; ~LButton::
; {
	; WinGet, active_work, ProcessName, A
	; run "F:\Documents\AHK Current\Enter Work.lnk" hide
	; SetTimer, LoseFocusWork, 100
	; WinWaitClose, ahk_exe %active_work%
	; if (active_w2 != "acad.exe" and active_w2 != "houdini.exe")
	; {
		; run "F:\Documents\AHK Current\Exit Work.lnk" hide
		; SetTimer, LoseFocusWork, Delete
	; }
; }
; return
; }
; #if

; LoseFocusWork:
; {
; SetTimer, LoseFocusWork, Off
; WinWaitNotActive, ahk_exe %active_work%
; run "F:\Documents\AHK Current\Exit Work.lnk" hide
; IfWinExist, ahk_exe %active_work%
; WinWaitActive, ahk_exe %active_work%
; run "F:\Documents\AHK Current\Enter Work.lnk" hide
; IfWinExist, ahk_exe %active_work%
; SetTimer, LoseFocusWork, 100
; return
; }