#Requires AutoHotkey v2.0
TraySetIcon("pifmgr.dll","13")
#SingleInstance force
SetWinDelay 0
CoordMode "Mouse"

XB := false

#HotIf (WinActive("ahk_exe cadwin.exe"))
{
	F13::Send "{!}textedit{enter}"
	F14::Send "{!}textchange case upper ok{enter}"
	F15::Send "{!}reference{enter}"
	F16::Send "{!}snapmid{enter}"
	F17::Send "a 0 0 0{enter}"
	F18::Send "{!}cpllock{enter}"
	; F19::Send "{!}notassigned{enter}"
	; F20::Send "{!}notassigned{enter}"
	; F21::Send "{!}notassigned{enter}"
	; F22::Send "{!}notassigned{enter}"
	; F23::Send "{!}notassigned{enter}"
	; F24::Send "{!}notassigned{enter}"
	^+s::Send "{!}saveas{enter}"
	^!s::Send "{!}saveall{enter}"
	^+z::^y
	^Backspace::Send "{ctrl down}{shift down}{left}{shift up}{ctrl up}{backspace}"
}
#HotIf

#HotIf (WinActive("ahk_exe explorer.exe"))
{
	^Backspace::Send "{ctrl down}{shift down}{left}{shift up}{ctrl up}{backspace}"
}
#HotIf

#HotIf WinActive("ahk_exe cadwin.exe") && IsControlActive("CaddsmanWindowClass1", "ahk_exe cadwin.exe") ; ControlGetClassNN(ControlGetFocus("ahk_exe cadwin.exe")) = "CaddsmanWindowClass1"
{
	Left::^Left
	Right::^Right
	Up::^Up
	Down::^Down
	+Left::^+Left
	+Right::^+Right
	+Up::^+Up
	+Down::^+Down
	XButton1::Send "{!}reference{enter}"
	XButton2::Send "{!}snapmid{enter}"
}
#HotIf

; #HotIf WinActive("ahk_exe cadwin.exe") && IsControlActive("CaddsmanWindowClass2", "ahk_exe cadwin.exe") ; ControlGetClassNN(ControlGetFocus("ahk_exe cadwin.exe")) = "CaddsmanWindowClass2"
; {
	; Left::^Left
	; Right::^Right
	; Up::^Up
	; Down::^Down
	; +Left::^+Left
	; +Right::^+Right
	; +Up::^+Up
	; +Down::^+Down
	; XButton1::Send "{!}reference{enter}"
	; XButton2::Send "{!}snapmid{enter}"
; }
; #HotIf

IsControlActive(classNN, winTitle) => (hWnd := WinExist(winTitle)) && WinActive(hWnd) && (focusedCtrl := ControlGetFocus(hWnd)) && ControlGetClassNN(focusedCtrl) = classNN

XButton2::
{
	global XB
	; Send "{XButton2 down}"
	; KeyWait "XButton2"
	; Send "{XButton2 up}"
	; return
	MouseGetPos ,, &KDE_id
	Caddsman := KDE_id
	KDE_Class := WinGetClass(KDE_id)
	if (KDE_Class = "Architect")
	{
		Send "{MButton down}"
		KeyWait "XButton2"
		Send "{MButton up}"
	}
	else
	{
		Send "{XButton2 down}"
		KeyWait "XButton2"
		if (XB = false)
		{
			Send "{XButton2 up}"
			return
		}
		else
		{
			;WinActivate("ahk_class Progman")
			MouseGetPos &X, &Y
			MouseMove 3840, 2160, 0
			Send "{XButton2 up}"
			try
				WinActivate(KDE_id)
			MouseMove X, Y, 0
			XB := false
			return
		}
	}
	return
}

~XButton2 & LButton::
#LButton::
{
	global XB
	; Get the initial mouse position and window id, and
	; abort if the window is maximized.
	MouseGetPos &KDE_X1, &KDE_Y1, &KDE_id
	KDE_Class := WinGetClass(KDE_id)
	; MsgBox(KDE_Class)
	if (KDE_Class = "Architect")
	{
		Send "{MButton down}"
		KeyWait "XButton2"
		Send "{MButton up}"
		return
	}			
	if WinGetMinMax(KDE_id)
		WinRestore(KDE_id)
	; Get the initial window position.
	WinGetPos &KDE_WinX1, &KDE_WinY1, &width, &height, KDE_id ; &width and &height added by Cebolla
	XB := true
	try
		WinActivate(KDE_id)
	Loop
	{
		if !GetKeyState("LButton", "P") ; Break if button has been released.
			break
		MouseGetPos &KDE_X2, &KDE_Y2 ; Get the current mouse position.
		KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
		KDE_Y2 -= KDE_Y1
		KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
		KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
		WinMove KDE_WinX2, KDE_WinY2, width, height, KDE_id ; Move the window to the new position.
	}
}

~XButton2 & RButton::
#RButton::
{
	global XB
	; Get the initial mouse position and window id, and
	; abort if the window is maximized.
	MouseGetPos &KDE_X1, &KDE_Y1, &KDE_id
	if WinGetMinMax(KDE_id)
		return
	; Get the initial window position and size.
	WinGetPos &KDE_WinX1, &KDE_WinY1, &KDE_WinW, &KDE_WinH, KDE_id
	; Define the window region the mouse is currently in.
	; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
	if (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
		KDE_WinLeft := 1
	else
		KDE_WinLeft := -1
	if (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
		KDE_WinUp := 1
	else
		KDE_WinUp := -1
	XB := true
	try
		WinActivate(KDE_id)
	Loop
	{
		if !GetKeyState("RButton", "P") ; Break if button has been released.
			break
		MouseGetPos &KDE_X2, &KDE_Y2 ; Get the current mouse position.
		; Get the current window position and size.
		WinGetPos &KDE_WinX1, &KDE_WinY1, &KDE_WinW, &KDE_WinH, KDE_id
		KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
		KDE_Y2 -= KDE_Y1
		; Then, act according to the defined region.
		WinMove KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
			  , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
			  , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
			  , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
			  , KDE_id
		KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
		KDE_Y1 := (KDE_Y2 + KDE_Y1)
	}
}

~XButton2 & MButton::
#MButton::
{
	MouseGetPos ,, &KDE_id
	; WinClose(KDE_id)
	WinMinimize(KDE_id)
	XB := true
	return
}

~XButton2 & WheelUp::
#WheelUp::
{
	MouseGetPos ,, &KDE_id
	WinMaximize(KDE_id)
	XB := true
	return
}

~XButton2 & WheelDown::
#WheelDown::
{
	MouseGetPos ,, &KDE_id
	; if WinGetMinMax(KDE_id)
		WinRestore(KDE_id)
	; else
		; WinMinimize(KDE_id)
	XB := true
	return
}

^!d::
{
	TimeString := FormatTime(,"dd-MM-yyyy")
	SendInput TimeString
}
