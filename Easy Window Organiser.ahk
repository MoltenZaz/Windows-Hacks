﻿; this attempts to stop the script from working on the desktop but will only be successful
; if the mouse cursor is over the desktop when the script launches
#NoEnv
#SingleInstance Force
Coordmode, Mouse, Screen
WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
MouseGetPos,,,hParentGUI
DesktopID := hParentGUI
Menu, Tray, Icon, shell32.dll, 300
; This script was inspired by and built on many like it
; in the forum. Thanks go out to ck, thinkstorm, Chris,
; and aurelian for a job well done.

; The shortcuts:
;  Win + Left Button  : Drag to move a window.
;  Win + Right Button : Drag to resize a window.
;  Win + Mouse Back   : Minimize a window.
;  Win + Mouse Forward: Maximize/Restore a window.
;  Win + Middle Button: Close a window.

SetWinDelay,0



;;;;;ListLines Off
;-- Initialize
Caption    :=True
ToolWindow :=False
Resize     :=False
Theme      :=True

;-- Workaround for AutoHotkey Basic
PtrType:=(A_PtrSize=8) ? "Ptr":"UInt"

;-- GUI options
gui Margin,6,4

;-- Text
gui Add,Text,,
   (ltrim
    If desired, move and/or resize (if resize has been enabled) this window
    before running any of the examples below.
   )

gui Add,Text,xm  ;-- Spacer
gui Add,Text,xm,Results from WinGetPos:
gui Font,Bold
gui Add,Text,xm y+0 cNavy vWinGetPosResults
   ,X=9999, Y=9999, Width=9999, Height=9999, Offset_X=9, Offset_Y=9
gui Font

gui Add,Text,xm,Results from WinGetPosEx:
gui Font,Bold
gui Add,Text,xm y+0 cBlue vWinGetPosExResults
   ,X=9999, Y=9999, Width=9999, Height=9999, Offset_X=9, Offset_y=9
gui Font

gui Add,Text,xm h3  ;-- Spacer
gui Add,Button,xm        gGetPosSize,%A_Space% Get Window Pos/Size %A_Space%

gui Add,Text,xm h3  ;-- Spacer
gui Add,Text,xm,Change window attributes:
;;;;;gui Add,Button,xm     gTogglePolicy,%A_Space%Toggle non-client rendering policy `n (Vista+ only)%A_Space%
gui Add,Button,xm     gToggleTheme,%A_Space%Toggle Theme `n (Window XP+)%A_Space%
gui Add,button,x+0 hp gToggleCaption,%A_Space%Toggle `n Caption%A_Space%
gui Add,Button,x+0 hp gToggleResize,Toggle`nResize
;;;;;gui Add,button,xm y+0 wp gToggleToolWindow,Toggle ToolWindow

gui Add,Text,xm h3  ;-- Spacer
gui Add,Text,xm,Move this window to these coordinates:
gui Add,Text,xm+20,X: %A_Space%
gui Add,Edit,x+0 w60 vXPos,0
gui Add,Text,x+10,Y:%A_Space%
gui Add,Edit,x+0 w60 vYPos,0
gui Add,CheckBox,xm+20 y+3 Checked vUseOffsets,Use offsets
;gui Add,Button,xm+20 y+3 gMoveWindow,%A_Space% Move %A_Space%

gui Add,Text,xm h3  ;-- Spacer
gui Add,Text,xm,Create a new window and position it relative to this window:
gui Add,Text,xm+20,Inside:     %A_Space%
gui Add,Radio,x+0 Checked  vInsideLeft      gInsideButtonAction,Left
gui Add,Radio,x+2          vInsideRight     gInsideButtonAction,Right
gui Add,Radio,x+2          vInsideRightTop  gInsideButtonAction,Right Top
gui Add,Radio,x+2          vInsideTop       gInsideButtonAction,Top
gui Add,Radio,x+2          vInsideBottom    gInsideButtonAction,Bottom
gui Add,Text,xm+20 y+2,Outside: %A_Space%
gui Add,Radio,x+2          vOutsideLeft     gOutsideButtonAction,Left
gui Add,Radio,x+2          vOutsideRight    gOutsideButtonAction,Right
gui Add,Radio,x+2          vOutsideRightTop gOutsideButtonAction,Right Top
gui Add,Radio,x+2          vOutsideTop      gOutsideButtonAction,Top
gui Add,Radio,x+2          vOutsideBottom   gOutsideButtonAction,Bottom
gui Add,CheckBox,xm+20 y+3 vUseOffsets2 Checked,Use offsets
gui Add,Button,xm+20 y+3 gPopupWindow,%A_Space% Create %A_Space%

gui Add,Text,xm h3  ;-- Spacer
gui Add,Button,xm gReload,%A_Spacd% Reload... %A_Space%
gui, +ToolWindow
gui, minimize

;-- Identify window handle
gui +LastFound
WinGet hParentGUI,ID

;-- Render but don't show
gui Show,Hide,WinGetPosEx Example

;-- Get initial position/size
gosub GetPosSize

;-- Show
return


GUISize:
gosub GetPosSize
return

GUIEscape:
GUIClose:
ExitApp


GetPosSize:
SetTimer %A_ThisLabel%,Off
WinGetPos X,Y,Width,Height,ahk_id %hParentGUI%
GUIControl,,WinGetPosResults,% "X=" . X . ", Y=" . Y . ", Width=" . Width . ", Height=" . Height
;;;;;outputdebug % "WingetPos: " . "X=" . X . ", Y=" . Y . ", Width=" . Width . ", Height=" . Height

pRP :=WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
GUIControl,,WinGetPosExResults,% "X=" . X . ", Y=" . Y . ", Width=" . Width . ", Height=" . Height . ", Offset_X=" . Offset_X . ", Offset_Y=" . Offset_Y

;;;;;X :=Left :=NumGet(pRP+0,0,"Int")
;;;;;Y :=Top  :=NumGet(pRP+0,4,"Int")
;;;;;Right    :=NumGet(pRP+0,8,"Int")
;;;;;Bottom   :=NumGet(pRP+0,12,"Int")
;;;;;Width    :=Right-Left
;;;;;Height   :=Bottom-Top
;;;;;Offset_X :=NumGet(pRP+0,16,"Int")
;;;;;Offset_Y :=NumGet(pRP+0,20,"Int")
;;;;;outputdebug % "WinGetPosEx2: " . "X=" . X . ", Y=" . Y . ", Width=" . Width . ", Height=" . Height . ", Offset_X=" . Offset_X . ", Offset_Y=" . Offset_Y
return


InsideButtonAction:
GUIControl,,OutsideLeft,0
GUIControl,,OutsideRight,0
GUIControl,,OutsideRightTop,0
GUIControl,,OutsideTop,0
GUIControl,,OutsideBottom,0
return


OutsideButtonAction:
GUIControl,,InsideLeft,0
GUIControl,,InsideRight,0
GUIControl,,InsideRightTop,0
GUIControl,,InsideTop,0
GUIControl,,InsideBottom,0
return


#Numpad1::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
	;MsgBox, %Offset_X% %Offset_Y%
 If Offset_X < 0
 {
 Offset_X += -1
 HPosO=-3
 HPosO+=Offset_X
 WPosO=-8
 WPosO+=Offset_X
 ;MsgBox, wer
 }
XPos=0
YPos=0
WPos=1146
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#Numpad2::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1146
YPos=0
WPos=1148
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#Numpad3::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=2294
YPos=0
WPos=1146
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#Numpad4::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=880
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#Numpad5::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,Width,Height,ahk_id %hParentGUI%
gui Submit,NoHide
MouseGetPos,,,hParentGUI
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
gosub GetPosSize
return
}
}
return
}

#Numpad6::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
YPos=700
WPos=880
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#Numpad7::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
gosub GetPosSize
return
}
}
return
}

#Numpad8::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=1920
WPos-=WPosO
HPos=1076
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,,, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#Numpad9::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=880
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#Numpad0::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=2560
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#NumpadAdd::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=880
YPos=0
WPos=2560
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#NumpadDot::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=2560
YPos=0
WPos=880
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#NumpadDiv::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=1720
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#NumpadMult::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1720
YPos=0
WPos=1720
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

#NumpadEnter::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
gosub GetPosSize
return
}
}
return
}

^#Numpad1::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
YPos=700
WPos=1146
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

^#Numpad2::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1146
YPos=700
WPos=1148
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

^#Numpad3::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=2294
YPos=700
WPos=1146
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

^#Numpad4::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=1146
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

^#Numpad5::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1146
YPos=0
WPos=1148
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

^#Numpad6::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=2294
YPos=0
WPos=1146
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

^#Numpad8::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
YPos=700
WPos=1720
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

^#Numpad9::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1720
YPos=700
WPos=1720
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

^#NumpadDiv::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=1720
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

^#NumpadMult::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1720
YPos=0
WPos=1720
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

~F20 & Numpad1::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
YPos=700
WPos=1146
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=1146
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
}
return
}

~F20 & Numpad2::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1146
YPos=700
WPos=1148
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1146
YPos=0
WPos=1148
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
}
return
}

~F20 & Numpad3::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=2294
YPos=700
WPos=1146
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=2294
YPos=0
WPos=1146
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
}
return
}

~F20 & Numpad4::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=1146
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=880
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
}
return
}

~F20 & Numpad5::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1146
YPos=0
WPos=1148
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,Width,Height,ahk_id %hParentGUI%
gui Submit,NoHide
MouseGetPos,,,hParentGUI
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
gosub GetPosSize
return
}
}
}
return
}

~F20 & Numpad6::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=2294
YPos=0
WPos=1146
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
YPos=700
WPos=880
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
}
return
}

~F20 & Numpad7::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
gosub GetPosSize
return
}
}
return
}

~F20 & Numpad8::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
YPos=700
WPos=1720
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=1920
WPos-=WPosO
HPos=1076
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,,, WPos, HPos
gosub GetPosSize
return
}
}
}
return
}

~F20 & Numpad9::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1720
YPos=700
WPos=1720
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=880
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
}
return
}

~F20 & Numpad0::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=2560
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

~F20 & NumpadAdd::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=880
YPos=0
WPos=2560
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

~F20 & NumpadDot::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=2560
YPos=0
WPos=880
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
return
}

~F20 & NumpadDiv::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
MsgBox, Bingo
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
MsgBox, Dingo
XPos=0
YPos=0
WPos=1720
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
WPos=1720
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
}
return
}

~F20 & NumpadMult::
{
if %hParentGUI% != %DesktopID%
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1720
YPos=0
WPos=1720
WPos-=WPosO
HPos=700
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X < 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-8
WPosO+=Offset_X
}
XPos=1720
YPos=0
WPos=1720
WPos-=WPosO
HPos=1400
HPos-=HPosO
XPos+=Offset_X
YPos+=Offset_Y
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,,XPos, YPos, WPos, HPos
gosub GetPosSize
return
}
}
}
return
}

~F20 & NumpadEnter::
{
if %hParentGUI% != %DesktopID%
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
return
}
else
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
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
gosub GetPosSize
return
}
}
return
}

#F13::
{
if isFullScreen = 1
{
return
}
else
{
MouseMove, 1720, 700, 10
return
}
return
}

#F2::
{
if isFullScreen = 1
{
return
}
else
{
MouseMove, 4400, 1118, 10
return
}
return
}

#F3::
{
if isFullScreen = 1
{
return
}
else
{
MouseMove, 6300, 2800, 10
return
}
return
}

;-- Note: Center is not not used as an example because the calculations are the
;   same regardless of the OS, Windows theme, or the attributes of the window.
PopupWindow:
gui Submit,NoHide

;-- Set GUI default
gui 2:Default

;-- Disable parent GUI, give ownership to parent GUI
gui 1:+Disabled
gui +Owner1

;-- Identify window handle
gui 2:+LastFound
WinGet hChildGUI,ID

;-- GUI options
gui -MinimizeBox

;-- GUI objects
gui Add,Text,,
   (ltrim
    Just some junk text to let Autohotkey
    determine the width and height of this
    popup window.
   )

;-- Render but don't show
gui Show,Hide,Popup Window

;-- Collect window position, size, and offset
WinGetPosEx(hParentGUI,ParentX,ParentY,ParentW,ParentH)
WinGetPosEx(hChildGUI,ChildX,ChildY,ChildW,ChildH,ChildOffset_X,ChildOffset_Y)

;-- Use offset?
Offset_X :=0
Offset_Y :=0
if UseOffsets2
    {
    Offset_X:=ChildOffset_X
    Offset_Y:=ChildOffset_Y
    }

;-- Initialize X/Y options
XOption :="x" . Round(ParentX+Offset_X+((ParentW-ChildW)/2))
YOption :="y" . Round(ParentY+Offset_Y+((ParentH-ChildH)/2))

;-- Set X/Y options
if InsideLeft
    XOption:="x" . ParentX+Offset_X

if InsideRight
    XOption:="x" . ParentX+ParentW-ChildW+Offset_X

if InsideRightTop
    {
    XOption:="x" . ParentX+ParentW-ChildW+Offset_X
    YOption:="y" . ParentY+Offset_Y
    }

if InsideTop
    YOption:="y" . ParentY+Offset_Y

if InsideBottom
    YOption:="y" . ParentY+ParentH-ChildH+Offset_Y

if OutsideLeft
    XOption:="x" . ParentX-ChildW+Offset_X

if OutsideRight
    XOption:="x" . ParentX+ParentW+Offset_X

if OutsideRightTop
    {
    XOption:="x" . ParentX+ParentW+Offset_X
    YOption:="y" . ParentY+Offset_Y
    }

if OutsideTop
    YOption:="y" . ParentY-ChildH+Offset_Y

if OutsideBottom
    YOption:="y" . ParentY+ParentH+Offset_Y

;-- Show the window in the requested location
gui Show,%XOption% %YOption%
return


2GUIClose:
2GUIEscape:
;-- Enable parent window
gui 1:-Disabled

;-- Destroy window so that it can be used again
gui Destroy
return


TogglePolicy:
DWMWA_NCRENDERING_POLICY :=2
DWMNCRP_USEWINDOWSTYLE   :=0
DWMNCRP_DISABLED         :=1
DWMNCRP_ENABLED          :=2
DWMNCRP_LAST             :=3
if (Flag="" or Flag=DWMNCRP_USEWINDOWSTYLE)
    Flag:=DWMNCRP_DISABLED
 else
    Flag:=DWMNCRP_USEWINDOWSTYLE

DllCall("dwmapi\DwmSetWindowAttribute"
    ,PtrType,hParentGUI
    ,"UInt",DWMWA_NCRENDERING_POLICY
    ,"Int*",Flag,"UInt",4)

gosub GetPosSize
return


ToggleCaption:
Caption :=!Caption
gui % (Caption ? "+":"-") . "Caption"
Sleep 50
gui Show,AutoSize
gosub GetPosSize
return


ToggleReSize:
Resize :=!Resize
gui % (Resize ? "+":"-") . "Resize"
Sleep 50
gui Show,AutoSize
gosub GetPosSize
return


ToggleTheme:
Theme :=!Theme
if Theme
    DllCall("uxtheme\SetWindowTheme",PtrType,hParentGUI,Str,"",PtrType,0)
        ;-- This appears to work on all versions of AutoHotkey.  Note: Syntax is
        ;   critical.  Do not make any changes.
 else
    DllCall("uxtheme\SetWindowTheme",PtrType,hParentGUI,PtrType,0,"Str","")

Sleep 50
gosub GetPosSize
return


ToggleToolWindow:
ToolWindow :=!ToolWindow
gui % (ToolWindow ? "+":"-") . "ToolWindow"
Sleep 50
gui Show,AutoSize
gosub GetPosSize
return


Reload:
Reload
return

;------------------------------
;
; Function: WinGetPosEx
;
; Description:
;
;   Gets the position, size, and offset of a window. See the *Remarks* section
;   for more information.
;
; Parameters:
;
;   hWindow - Handle to the window.
;
;   X, Y, Width, Height - Output variables. [Optional] If defined, these
;       variables contain the coordinates of the window relative to the
;       upper-left corner of the screen (X and Y), and the Width and Height of
;       the window.
;
;   Offset_X, Offset_Y - Output variables. [Optional] Offset, in pixels, of the
;       actual position of the window versus the position of the window as
;       reported by GetWindowRect.  If moving the window to specific
;       coordinates, add these offset values to the appropriate coordinate
;       (X and/or Y) to reflect the true size of the window.
;
; Returns:
;
;   If successful, the address of a RECTPlus structure is returned.  The first
;   16 bytes contains a RECT structure that contains the dimensions of the
;   bounding rectangle of the specified window.  The dimensions are given in
;   screen coordinates that are relative to the upper-left corner of the screen.
;   The next 8 bytes contain the X and Y offsets (4-byte integer for X and
;   4-byte integer for Y).
;
;   Also if successful (and if defined), the output variables (X, Y, Width,
;   Height, Offset_X, and Offset_Y) are updated.  See the *Parameters* section
;   for more more information.
;
;   If not successful, FALSE is returned.
;
; Requirement:
;
;   Windows 2000+
;
; Remarks, Observations, and Changes:
;
; * Starting with Windows Vista, Microsoft includes the Desktop Window Manager
;   (DWM) along with Aero-based themes that use DWM.  Aero themes provide new
;   features like a translucent glass design with subtle window animations.
;   Unfortunately, the DWM doesn't always conform to the OS rules for size and
;   positioning of windows.  If using an Aero theme, many of the windows are
;   actually larger than reported by Windows when using standard commands (Ex:
;   WinGetPos, GetWindowRect, etc.) and because of that, are not positioned
;   correctly when using standard commands (Ex: gui Show, WinMove, etc.).  This
;   function was created to 1) identify the true position and size of all
;   windows regardless of the window attributes, desktop theme, or version of
;   Windows and to 2) identify the appropriate offset that is needed to position
;   the window if the window is a different size than reported.
;
; * The true size, position, and offset of a window cannot be determined until
;   the window has been rendered.  See the example script for an example of how
;   to use this function to position a new window.
;
; * 20150906: The "dwmapi\DwmGetWindowAttribute" function can return odd errors
;   if DWM is not enabled.  One error I've discovered is a return code of
;   0x80070006 with a last error code of 6, i.e. ERROR_INVALID_HANDLE or "The
;   handle is invalid."  To keep the function operational during this types of
;   conditions, the function has been modified to assume that all unexpected
;   return codes mean that DWM is not available and continue to process without
;   it.  When DWM is a possibility (i.e. Vista+), a developer-friendly messsage
;   will be dumped to the debugger when these errors occur.
;
; Credit:
;
;   Idea and some code from *KaFu* (AutoIt forum)
;
;-------------------------------------------------------------------------------

WinGetPosEx(hWindow,ByRef X="",ByRef Y="",ByRef Width="",ByRef Height="",ByRef Offset_X="",ByRef Offset_Y="")
    {
    Static Dummy5693
          ,RECTPlus
          ,S_OK:=0x0
          ,DWMWA_EXTENDED_FRAME_BOUNDS:=9

    ;-- Workaround for AutoHotkey Basic
    PtrType:=(A_PtrSize=8) ? "Ptr":"UInt"

    ;-- Get the window's dimensions
    ;   Note: Only the first 16 bytes of the RECTPlus structure are used by the
    ;   DwmGetWindowAttribute and GetWindowRect functions.
    VarSetCapacity(RECTPlus,24,0)
    DWMRC:=DllCall("dwmapi\DwmGetWindowAttribute"
        ,PtrType,hWindow                                ;-- hwnd
        ,"UInt",DWMWA_EXTENDED_FRAME_BOUNDS             ;-- dwAttribute
        ,PtrType,&RECTPlus                              ;-- pvAttribute
        ,"UInt",16)                                     ;-- cbAttribute

    if (DWMRC<>S_OK)
        {
        if ErrorLevel in -3,-4  ;-- Dll or function not found (older than Vista)
            {
            ;-- Do nothing else (for now)
            }
         else
            outputdebug,
               (ltrim join`s
                Function: %A_ThisFunc% -
                Unknown error calling "dwmapi\DwmGetWindowAttribute".
                RC=%DWMRC%,
                ErrorLevel=%ErrorLevel%,
                A_LastError=%A_LastError%.
                "GetWindowRect" used instead.
               )

        ;-- Collect the position and size from "GetWindowRect"
        DllCall("GetWindowRect",PtrType,hWindow,PtrType,&RECTPlus)
        }

    ;-- Populate the output variables
    X:=Left :=NumGet(RECTPlus,0,"Int")
    Y:=Top  :=NumGet(RECTPlus,4,"Int")
    Right   :=NumGet(RECTPlus,8,"Int")
    Bottom  :=NumGet(RECTPlus,12,"Int")
    Width   :=Right-Left
    Height  :=Bottom-Top
    OffSet_X:=0
    OffSet_Y:=0

    ;-- If DWM is not used (older than Vista or DWM not enabled), we're done
    if (DWMRC<>S_OK)
        Return &RECTPlus

    ;-- Collect dimensions via GetWindowRect
    VarSetCapacity(RECT,16,0)
    DllCall("GetWindowRect",PtrType,hWindow,PtrType,&RECT)
    GWR_Width :=NumGet(RECT,8,"Int")-NumGet(RECT,0,"Int")
        ;-- Right minus Left
    GWR_Height:=NumGet(RECT,12,"Int")-NumGet(RECT,4,"Int")
        ;-- Bottom minus Top

    ;-- Calculate offsets and update output variables
    NumPut(Offset_X:=(Width-GWR_Width)//2,RECTPlus,16,"Int")
    NumPut(Offset_Y:=(Height-GWR_Height)//2,RECTPlus,20,"Int")
    Return &RECTPlus
    }

	
#Xbutton1::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {XButton1 DOWN}
keywait, XButton1
send {XButton1 UP}
return
}
else
    MouseGetPos,,,hParentGUI
    if hParentGUI != %DesktopID%
{
    ; This message is mostly equivalent to WinMinimize,
    ; but it avoids a bug with PSPad.
    PostMessage,0x112,0xf020,,,ahk_id %hParentGUI%
    return
}
return
}
#LButton::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {LButton DOWN}
keywait, LButton
send {LButton UP}
return
}
else
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,hParentGUI
WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
if hParentGUI != %DesktopID%
{
If KDE_Win
    return
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
Loop
{
	WinGet,KDE_Win,MinMax,ahk_id %KDE2_id%
	if KDE2_id = %DesktopID%
		break
    GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %hParentGUI%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
}
}
return
}

#xbutton2::
{
isfullscreen := iswindowfullscreen( "a" )
if isfullscreen = 1
{
send {xbutton2 down}
keywait, xbutton2
send {xbutton2 up}
return
}
else
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

#RButton::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {RButton DOWN}
keywait, RButton
send {RButton UP}
return
}
else
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,hParentGUI
WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
    if hParentGUI != %DesktopID%
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
; "Win + MButton" may be simpler, but I
; like an extra measure of security for
; an operation like this.
#MButton::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {MButton DOWN}
keywait, MButton
send {MButton UP}
return
}
else
    MouseGetPos,,,hParentGUI
    if hParentGUI != %DesktopID%
{
    WinClose,ahk_id %hParentGUI%
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


; make g8 and g7 forward and back when not in fullscreen
~F18::
MouseGetPos,,,hParentGUI
if hParentGUI != %DesktopID%
{
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
F18::1
return
}
else
{
send {Xbutton2 DOWN}
keywait, Xbutton2
send {Xbutton2 UP}
return
}
}
}

~F17::
MouseGetPos,,,hParentGUI
if hParentGUI != %DesktopID%
{
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
F17::2
return
}
else
{
send {Xbutton1 DOWN}
keywait, Xbutton1
send {Xbutton1 UP}
return
}
}
}

#~F20::

~F20::
MouseGetPos,,,hParentGUI
if hParentGUI != %DesktopID%
{
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
~F20::3
}
else
{
return
}
}
}

~F20 & F17::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {2 DOWN}
keywait, 2
send {2 UP}
return
}
else
{
    MouseGetPos,,,hParentGUI
    if hParentGUI != %DesktopID%
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

~F20 & F18::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {1 DOWN}
keywait, 1
send {1 UP}
return
}
else
{
    MouseGetPos,,,hParentGUI
    if hParentGUI != %DesktopID%
{
    ; Toggle between maximized and restored state.
    WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
    If KDE_Win
        WinRestore,ahk_id %hParentGUI%
    Else
        WinMaximize,ahk_id %hParentGUI%
    send, {F20, UP}
    return
}
return
}
}

~F20 & LButton::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {LButton DOWN}
keywait, LButton
send {LButton UP}
return
}
else
{
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,hParentGUI
WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
if hParentGUI != %DesktopID%
{
If KDE_Win
    return
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
Loop
{
	WinGet,KDE_Win,MinMax,ahk_id %KDE2_id%
	if KDE2_id = %DesktopID%
		break
    GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %hParentGUI%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
}
}
return
}
}

~F20 & RButton::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {RButton DOWN}
keywait, RButton
send {RButton UP}
return
}
else
{
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,hParentGUI
WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
    if hParentGUI != %DesktopID%
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
~F20 & MButton::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {MButton DOWN}
keywait, MButton
send {MButton UP}
return
}
else
{
    MouseGetPos,,,hParentGUI
    if hParentGUI != %DesktopID%
{
    WinClose,ahk_id %hParentGUI%
    send, {F20, UP}
    return
}
return
}
}

LWin::
{
MouseGetPos,,,hParentGUI
if hParentGUI = %DesktopID%
{
send {LWin DOWN}
keywait, LWin
send {LWin UP}
return
}
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
	return
}
else
{
send {LWin DOWN}
keywait, LWin
send {LWin UP}
return
}
}

RWin::
{
MouseGetPos,,,hParentGUI
if hParentGUI = %DesktopID%
{
send {RWin DOWN}
keywait, RWin
send {RWin UP}
return
}
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
	return
}
else
{
send {RWin DOWN}
keywait, RWin
send {RWin UP}
return
}
}

#e::
{
MouseGetPos,,,hParentGUI
if hParentGUI = %DesktopID%
{
run explorer.exe
WinWait, currentWindow, , 0
WinGetTitle, currentWindow, A
IfWinExist %currentWindow%
 {
	MouseGetPos, XPos, YPos
	XPos -= 648
	YPos -= 363
   WinMove,,,XPos, YPos, 1296, 727
   return
 }
}
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {e DOWN}
keywait, e
send {e UP}
return
}
else
{
run explorer.exe
WinWait, currentWindow, , 0
WinGetTitle, currentWindow, A
IfWinExist %currentWindow%
 {
	MouseGetPos, XPos, YPos
	XPos -= 648
	YPos -= 363
   WinMove,,,XPos, YPos, 1296, 727
   return
 }
}
return
}