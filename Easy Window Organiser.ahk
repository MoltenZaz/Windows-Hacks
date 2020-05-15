#NoEnv
Coordmode, Mouse, Screen
Menu, Tray, Icon, shell32.dll, 300

#include WinGetPosEx.ahk

#SingleInstance force

; This script was inspired by and built on many like it
; in the forum. Thanks go out to ck, thinkstorm, Chris,
; and aurelian for a job well done.

; Heavily modified by Mitchell Thomas

; The shortcuts:
;  Win + Left Button  : Drag to move a window.
;  Win + Right Button : Drag to resize a window.
;  Win + Mouse Back   : Minimize a window.
;  Win + Mouse Forward: Maximize/Restore a window.
;  Win + Middle Button: Close a window.S

SetWinDelay,0

fffirst = 1

toggle = 0

#F20::

F20::
{
toggle := 1
MouseGetPos,,,FGUI
WinGetClass, desclass, ahk_id %FGUI% 
if desclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
toggle := 0
F20::3
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
keywait F20
toggle := 0
return
}
}
toggle := 0
return
}

Refresh:
{
SoundBeep, 300, 50
Run "F:\Documents\AHK Current\Firefox Keyboard.ahk"
Run "F:\Documents\AHK Current\YouTube Play Pause.ahk"
Reload
return
}

#if (toggle = 1)
{
LCtrl::
{
ctrltoggle := 1
keywait LCtrl
ctrltoggle := 0
return
}

RCtrl::
{
ctrltoggle := 1
keywait RCtrl
ctrltoggle := 0
return
}

Numpad1::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(0, 700, 1146, 700)
}
else
{
ResizeWindow(0, 0, 1146, 1400)
return
}
return
}

Numpad2::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(1146, 700, 1148, 700)
}
else
{
ResizeWindow(1146, 0, 1148, 1400)
return
}
return
}

Numpad3::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(2294, 700, 1146, 700)
}
else
{
ResizeWindow(2294, 0, 1146, 1400)
return
}
return
}

Numpad4::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(0, 0, 1146, 700)
}
else
{
ResizeWindow(0, 0, 880, 1400)
return
}
return
}

Numpad5::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(1146, 0, 1148, 700)
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
return
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,Width,Height,ahk_id %hParentGUI%
gui Submit,NoHide
MouseGetPos,,,hParentGUI
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
return
}
return
}
}
return
}

Numpad6::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(2294, 0, 1146, 700)
}
else
{
ResizeWindow(0, 700, 880, 700)
return
}
return
}

Numpad7::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
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
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0

    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=0
YPos=0
WPos=1280
WPos-=WPosO
HPos=716
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,,, WPos, HPos
return
}
}
return
}

Numpad8::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(0, 700, 1720, 700)
}
else
{
ResizeWindow(0, 0, 1920, 1076)
return
}
return
}

Numpad9::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(1720, 700, 1720, 700)
keywait, F20
toggle = 0
Reload
}
else
{
ResizeWindow(0, 0, 880, 700)
return
}
return
}

Numpad0::
{
ResizeWindow(0, 0, 2560, 1400)
return
}

NumpadAdd::
{
ResizeWindow(880, 0, 2560, 1400)
return
}

NumpadDot::
{
ResizeWindow(2560, 0, 880, 1400)
return
}

NumpadDiv::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(0, 0, 1720, 700)
}
else
{
ResizeWindow(0, 0, 1720, 1400)
return
}
return
}

NumpadMult::
{
If (GetKeyState("XButton2", "p") or ctrltoggle = 1)
{
ResizeWindow(1720, 0, 1720, 700)
}
else
{
ResizeWindow(1720, 0, 1720, 1400)
return
}
return
}

NumpadEnter::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
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
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0

    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=3440
YPos=528
WPos=1920
WPos-=WPosO
HPos=1080
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
winmaximize,ahk_id %hParentGUI%
return
}
}
return
}

F1::
{
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
MouseMove, 1720, 700, 10
return
}
return
}

F2::
{
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
MouseMove, 4400, 1118, 10
return
}
return
}

F3::
{
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
MouseMove, 6300, 2800, 10
return
}
return
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

F17::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
send {2 DOWN}
keywait, 2
send {2 UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
    MouseGetPos,,,hParentGUI
    MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
    ; This message is mostly equivalent to WinMinimize,
    ; but it avoids a bug with PSPad.
    PostMessage,0x112,0xf020,,,ahk_id %hParentGUI%
    send, {F20, UP}
    return
}
return
}
}

F18::
{
isfullscreen := iswindowfullscreen( "a" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
send {1 down}
keywait, 1
send {1 up}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
    mousegetpos,,,kde_id
    if kde_id != %desktopid%
{
    ; toggle between maximized and restored state.
    winget,kde_win,minmax,ahk_id %kde_id%
    if kde_win
        winrestore,ahk_id %kde_id%
    else
        winmaximize,ahk_id %kde_id%
    return
}
return
}

LButton::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
send {LButton DOWN}
keywait, LButton
send {LButton UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
;; Get the initial mouse position and window id, and
;; abort if the window is maximized.
MouseGetPos,MOV_X1,MOV_Y1,moveID
WinGet,MOV_Win,MinMax,ahk_id %moveID%
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
If MOV_Win
    return
; Get the initial window position.
WinGetPos,MOV_WinX1,MOV_WinY1,,,ahk_id %moveID%
Loop
{
	WinGet,MOV_Win,MinMax,ahk_id %MOV2_id%
	MouseGetPos, , , id, control 
	WinGetClass, dclass, ahk_id %id% 
	if dclass = WorkerW
		break
	if dclass = Progman
		break
    GetKeyState,MOV_Button,LButton,P ; Break if button has been released.
    If MOV_Button = U
        break
    MouseGetPos,MOV_X2,MOV_Y2 ; Get the current mouse position.
    MOV_X2 -= MOV_X1 ; Obtain an offset from the initial mouse position.
    MOV_Y2 -= MOV_Y1
    MOV_WinX2 := (MOV_WinX1 + MOV_X2) ; Apply this offset to the window position.
    MOV_WinY2 := (MOV_WinY1 + MOV_Y2)
    WinMove,ahk_id %moveID%,,%MOV_WinX2%,%MOV_WinY2% ; Move the window to the new position.
}
}
return
}

RButton::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
send {RButton DOWN}
keywait, RButton
send {RButton UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,hParentGUI
WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
WinGetClass, dclass, ahk_id %hParentGUI% 
if dclass != WorkerW
if dclass != Progman
{
If KDE_Win
    return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %hParentGUI%
; Define the window region the mouse is currently in.
; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
    KDE_WinLeft := 1
Else
    KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
    KDE_WinUp := 1
Else
    KDE_WinUp := -1
Loop
{
	GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    ; Get the current window position and size.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %hParentGUI%
	WinGetClass, dclass, ahk_id %hParentGUI% 
	if dclass = WorkerW
		break
	if dclass = Progman
		break
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
    WinMove,ahk_id %hParentGUI%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
    KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
}
return
}
}

; "Win + MButton" may be simpler, but I
; like an extra measure of security for
; an operation like this.
MButton::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
send {MButton DOWN}
keywait, MButton
send {MButton UP}
return
}
}
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
    MouseGetPos,,,hParentGUI
WinGetClass, dclass, ahk_id %hParentGUI%
if dclass != WorkerW
if dclass != Progman
{
	If(dclass != "MozillaWindowClass")
	{
    WinClose,ahk_id %hParentGUI%
    send, {F20, UP}
    return
	}
	else
	{
	WinClose,ahk_id %hParentGUI%	
    send, {F20, UP}
	WinGet, FF, Count, Mozilla Firefox
	If (FF = 0)
	{
	ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	Sleep, 1
	ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	Sleep, 1
	}
    return
	}
}
return
}
return
}
}
#if

ResizeWindow(XPos, YPos, WPos, HPos)
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
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
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0

    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
WPos-=WPosO
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
}
}
}

;These are the win key version of the hotkeys

^#Numpad1::
{
ResizeWindow(0, 700, 1146, 700)
return
}

#Numpad1::
{
ResizeWindow(0, 0, 1146, 1400)
return
}

^#Numpad2::
{
ResizeWindow(1146, 700, 1148, 700)
return
}

#Numpad2::
{
ResizeWindow(1146, 0, 1148, 1400)
return
}

^#Numpad3::
{
ResizeWindow(2294, 700, 1146, 700)
return
}

#Numpad3::
{
ResizeWindow(2294, 0, 1146, 1400)
return
}

^#Numpad4::
{
ResizeWindow(0, 0, 1146, 700)
return
}

#Numpad4::
{
ResizeWindow(0, 0, 880, 1400)
return
}

^#Numpad5::
{
ResizeWindow(1146, 0, 1148, 700)
return
}

#Numpad5::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
return
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,Width,Height,ahk_id %hParentGUI%
gui Submit,NoHide
MouseGetPos,,,hParentGUI
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
return
}
return
}
return
}

^#Numpad6::
{
ResizeWindow(2294, 0, 1146, 700)
return
}

#Numpad6::
{
ResizeWindow(0, 700, 880, 700)
return
}

#Numpad7::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
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
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0

    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=0
YPos=0
WPos=1280
WPos-=WPosO
HPos=716
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,,, WPos, HPos
return
}
}
return
}

^#Numpad8::
{
ResizeWindow(0, 700, 1720, 700)
return
}

#Numpad8::
{
ResizeWindow(0, 0, 1920, 1076)
return
}

^#Numpad9::
{
ResizeWindow(1720, 700, 1720, 700)
return
}

#Numpad9::
{
ResizeWindow(0, 0, 880, 700)
return
}

#Numpad0::
{
ResizeWindow(0, 0, 2560, 1400)
return
}

#NumpadAdd::
{
ResizeWindow(880, 0, 2560, 1400)
return
}

#NumpadDot::
{
ResizeWindow(2560, 0, 880, 1400)
return
}

^#NumpadDiv::
{
ResizeWindow(0, 0, 1720, 700)
return
}

#NumpadDiv::
{
ResizeWindow(0, 0, 1720, 1400)
return
}

^#NumpadMult::
{
ResizeWindow(1720, 0, 1720, 700)
return
}

#NumpadMult::
{
ResizeWindow(1720, 0, 1720, 1400)
return
}

#NumpadEnter::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
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
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0

    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=3440
YPos=528
WPos=1920
WPos-=WPosO
HPos=1080
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
winmaximize,ahk_id %hParentGUI%
return
}
}
return
}

#F1::
{
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
MouseMove, 1720, 700, 10
return
}
return
}

#F2::
{
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
MouseMove, 4400, 1118, 10
return
}
return
}

#F3::
{
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
MouseMove, 6300, 2800, 10
return
}
return
}

#LButton::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
send {LButton DOWN}
keywait, LButton
send {LButton UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
;; Get the initial mouse position and window id, and
;; abort if the window is maximized.
MouseGetPos,MOV_X1,MOV_Y1,moveID
WinGet,MOV_Win,MinMax,ahk_id %moveID%
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
If MOV_Win
    return
; Get the initial window position.
WinGetPos,MOV_WinX1,MOV_WinY1,,,ahk_id %moveID%
Loop
{
	WinGet,MOV_Win,MinMax,ahk_id %MOV2_id%
	MouseGetPos, , , id, control 
	WinGetClass, dclass, ahk_id %id% 
	if dclass = WorkerW
		break
	if dclass = Progman
		break
    GetKeyState,MOV_Button,LButton,P ; Break if button has been released.
    If MOV_Button = U
        break
    MouseGetPos,MOV_X2,MOV_Y2 ; Get the current mouse position.
    MOV_X2 -= MOV_X1 ; Obtain an offset from the initial mouse position.
    MOV_Y2 -= MOV_Y1
    MOV_WinX2 := (MOV_WinX1 + MOV_X2) ; Apply this offset to the window position.
    MOV_WinY2 := (MOV_WinY1 + MOV_Y2)
    WinMove,ahk_id %moveID%,,%MOV_WinX2%,%MOV_WinY2% ; Move the window to the new position.
}
}
return
}

#RButton::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
send {RButton DOWN}
keywait, RButton
send {RButton UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,hParentGUI
WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
WinGetClass, dclass, ahk_id %hParentGUI% 
if dclass != WorkerW
if dclass != Progman
{
If KDE_Win
    return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %hParentGUI%
; Define the window region the mouse is currently in.
; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
    KDE_WinLeft := 1
Else
    KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
    KDE_WinUp := 1
Else
    KDE_WinUp := -1
Loop
{
	GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    ; Get the current window position and size.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %hParentGUI%
	WinGetClass, dclass, ahk_id %hParentGUI% 
	if dclass = WorkerW
		break
	if dclass = Progman
		break
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
    WinMove,ahk_id %hParentGUI%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
    KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
}
return
}
}

; "Win + MButton" may be simpler, but I
; like an extra measure of security for
; an operation like this.
#MButton::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
send {MButton DOWN}
keywait, MButton
send {MButton UP}
return
}
}
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
    MouseGetPos,,,hParentGUI
WinGetClass, dclass, ahk_id %hParentGUI% 
if dclass != WorkerW
if dclass != Progman
{
    WinClose,ahk_id %hParentGUI%
    send, {F20, UP}
    return
}
return
}
return
}

; make g8 and g7 forward and back when not in fullscreen
~F18::
{
MouseGetPos,,,hParentGUI
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
F18::1
return
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
send {Xbutton2 DOWN}
keywait, Xbutton2
send {Xbutton2 UP}
return
}
}
}
return
}

~F17::
{
MouseGetPos,,,hParentGUI
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
if dclass != Progman
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
IfWinNotActive, ahk_class Progman
{
if isFullScreen = 1
{
F17::2
return
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
{
send {Xbutton1 DOWN}
keywait, Xbutton1
send {Xbutton1 UP}
return
}
}
}
return
}

; #e::
; {
; isFullScreen := isWindowFullScreen( "A" )
; IfWinNotActive, ahk_class WorkerW
; IfWinNotActive, ahk_class Progman
; {
; if isFullScreen = 1
; {
; send {e DOWN}
; keywait, e
; send {e UP}
; return
; }
; }
; if isFullScreen != 1 or IfWinActive, ahk_class WorkerW or IfWinActive, ahk_class Progman
; {
; run explorer.exe
; WinWait, currentWindow, , -1
; WinGetTitle, currentWindow, A
; IfWinExist %currentWindow%
 ; {
; If (ahk_exe = Explorer.EXE)
; {
	; MouseGetPos, XPos, YPos
	; if (XPos > 3440)
	; {
	; XPos -= 500
	; YPos -= 300
	; if (XPos <3440)
	; {
	; XPos = 3432
	; }
	; if (YPos < 473)
	; {
	; YPos = 471
	; }
	; if (XPos > 4368)
	; {
	; XPos = 4368
	; }
	; if (YPos > 960)
	; {
	; YPos = 960
	; }
	; WinMove,This PC,,XPos, YPos, 1000, 600
	; return
	; }
	; XPos -= 648
	; YPos -= 363
	; if (XPos <0)
	; {
	; XPos = -8
	; }
	; if (YPos <0)
	; {
	; YPos = -2
	; }
	; if (XPos > 2152)
	; {
	; XPos = 2152
	; }
	; if (YPos > 682)
	; {
	; YPos = 682
	; }
   ; WinMove,This PC,,XPos, YPos, 1296, 727
   ; return
; }
 ; }
; }
; return
; }

#IfWinActive, ahk_exe firefox.exe
{
~Lbutton::
{
if (fffirst = 1)
{
fffirst = 0
winmaximize, ahk_exe firefox.exe
}
return
}
return
}
