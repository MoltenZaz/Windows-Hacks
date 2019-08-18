#NoEnv
#SingleInstance Force
Menu, Tray, Icon, imageres.dll, 251
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
gui Show
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
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
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
return
}
}

#Numpad2::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1146
YPos=0
WPos=1150
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
return
}
}

#Numpad3::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=2294
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
return
}
}

#Numpad4::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=0
WPos=882
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
return
}
}

#Numpad5::
if KDE_id != %DesktopID%
{
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
return
}
}

#Numpad6::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=700
WPos=882
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
}

#Numpad7::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}

#Numpad8::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}

#Numpad9::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}

#Numpad0::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}

#NumpadAdd::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}

#NumpadDot::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=2560
YPos=0
WPos=882
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
return
}
}

#NumpadDiv::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=0
WPos=1722
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
return
}
}

#NumpadMult::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1720
YPos=0
WPos=1722
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
return
}
}

#NumpadEnter::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=3440
YPos=528
WPos=1922
WPos-=WPosO
HPos=1080
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
}

^#Numpad1::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
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
}

^#Numpad2::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1146
YPos=700
WPos=1150
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
}

^#Numpad3::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=2294
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
}

^#Numpad4::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
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
}

^#Numpad5::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1146
YPos=0
WPos=1150
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
}

^#Numpad6::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=2294
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
}

^#Numpad8::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=700
WPos=1722
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
}

^#Numpad9::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1720
YPos=700
WPos=1722
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
}

^#NumpadDiv::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=0
WPos=1722
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
}

^#NumpadMult::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1720
YPos=0
WPos=1722
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
}

~F20 & Numpad1::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
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
return
}
}
}

~F20 & Numpad2::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1146
YPos=700
WPos=1150
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1146
YPos=0
WPos=1150
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
return
}
}
}

~F20 & Numpad3::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=2294
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=2294
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
return
}
}
}

~F20 & Numpad4::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
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
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=0
WPos=882
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
return
}
}
}

~F20 & Numpad5::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1146
YPos=0
WPos=1150
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
return
}
}
}

~F20 & Numpad6::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=2294
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
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0
if UseOffsets
    WinGetPosEx(hParentGUI,X,Y,Width,Height,Offset_X,Offset_Y)
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=700
WPos=882
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
}
}

~F20 & Numpad7::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}

~F20 & Numpad8::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=700
WPos=1722
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}
}

~F20 & Numpad9::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1720
YPos=700
WPos=1722
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}
}

~F20 & Numpad0::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}

~F20 & NumpadAdd::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
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
return
}
}

~F20 & NumpadDot::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=2560
YPos=0
WPos=882
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
return
}
}

~F20 & NumpadDiv::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=0
WPos=1722
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=0
YPos=0
WPos=1722
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
return
}
}
}

~F20 & NumpadMult::
if KDE_id != %DesktopID%
{
{
If GetKeyState("F18", "p")
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1720
YPos=0
WPos=1722
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=1720
YPos=0
WPos=1722
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
return
}
}
}

~F20 & NumpadEnter::
if KDE_id != %DesktopID%
{
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
If Offset_X != 0
{
Offset_X += -1
HPosO=-3
HPosO+=Offset_X
WPosO=-6
WPosO+=Offset_X
}
XPos=3440
YPos=528
WPos=1922
WPos-=WPosO
HPos=1080
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


#include WinGetPosEx.ahk
#include Easy Window Dragging.ahk
