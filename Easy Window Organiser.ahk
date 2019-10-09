; this attempts to stop the script from working on the desktop but will only be successful
; if the mouse cursor is over the desktop when the script launches
#NoEnv
Coordmode, Mouse, Screen
Menu, Tray, Icon, shell32.dll, 300

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
;  Win + Middle Button: Close a window.

SetWinDelay,0

fffirst = 1

#Numpad1::
{
MouseGetPos, , , id, control
WinGetClass, dclass, ahk_id %id%
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %hParentGUI%
gui Submit,NoHide
Offset_X :=Offset_Y:=0

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
;Reload
return
}
}
return
}

#Numpad2::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#Numpad3::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload

return
}
}
return
}

#Numpad4::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#Numpad5::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,Width,Height,ahk_id %hParentGUI%
gui Submit,NoHide
MouseGetPos,,,hParentGUI
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
;Reload
return
}
}
return
}

#Numpad6::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#Numpad7::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#Numpad8::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#Numpad9::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#Numpad0::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#NumpadAdd::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#NumpadDot::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#NumpadDiv::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#NumpadMult::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#NumpadEnter::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#Numpad1::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#Numpad2::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#Numpad3::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#Numpad4::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#Numpad5::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#Numpad6::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#Numpad8::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#Numpad9::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#NumpadDiv::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

^#NumpadMult::
{

MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

~F20 & Numpad1::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
}
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
}
return
}

~F20 & Numpad2::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
}
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
}
return
}

~F20 & Numpad3::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
}
return
}

~F20 & Numpad4::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
}
return
}

~F20 & Numpad5::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
MouseGetPos,,,hParentGUI
WinGetPos,KDE_WinX1,KDE_WinY1,Width,Height,ahk_id %hParentGUI%
gui Submit,NoHide
MouseGetPos,,,hParentGUI
WinRestore,ahk_id %hParentGUI%
WinMove,ahk_id %hParentGUI%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
;Reload
return
}
}
}
return
}

~F20 & Numpad6::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
}
return
}

~F20 & Numpad7::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

~F20 & Numpad8::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
}
return
}

~F20 & Numpad9::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass = Chrome_WidgetWin_1
{
Reload
}
if dclass = Qt5QWindowOwnDCIcon
{
Reload
}
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
}
return
}

~F20 & Numpad0::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

~F20 & NumpadAdd::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

~F20 & NumpadDot::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

~F20 & NumpadDiv::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
}
return
}

~F20 & NumpadMult::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
If GetKeyState("XButton2", "p")
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
return
}
else
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
}
return
}

~F20 & NumpadEnter::
{
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
;Reload
return
}
}
return
}

#F1::
{
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
MouseMove, 1720, 700, 10
return
}
return
}

#F2::
{
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
MouseMove, 4400, 1118, 10
return
}
return
}

#F3::
{
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
MouseMove, 6300, 2800, 10
return
}
return
}

#Xbutton1::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {XButton1 DOWN}
keywait, XButton1
send {XButton1 UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
    MouseGetPos,,,hParentGUI
    MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
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
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {LButton DOWN}
keywait, LButton
send {LButton UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
;; Get the initial mouse position and window id, and
;; abort if the window is maximized.
MouseGetPos,MOV_X1,MOV_Y1,moveID
WinGet,MOV_Win,MinMax,ahk_id %moveID%
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
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

#xbutton2::
{
isfullscreen := iswindowfullscreen( "a" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {xbutton2 down}
keywait, xbutton2
send {xbutton2 up}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {RButton DOWN}
keywait, RButton
send {RButton UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,hParentGUI
WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
    MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
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
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {MButton DOWN}
keywait, MButton
send {MButton UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
    MouseGetPos,,,hParentGUI
    MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
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
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
F18::1
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
{
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
F17::2
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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
{
MouseGetPos,,,FGUI
WinGetClass, desclass, ahk_id %FGUI% 
if desclass != WorkerW
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
~F20::3
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
return
}
}
return
}

~F20 & F17::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {2 DOWN}
keywait, 2
send {2 UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
    MouseGetPos,,,hParentGUI
    MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
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
isfullscreen := iswindowfullscreen( "a" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {1 down}
keywait, 1
send {1 up}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
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

~F20 & LButton::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {LButton DOWN}
keywait, LButton
send {LButton UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
;; Get the initial mouse position and window id, and
;; abort if the window is maximized.
MouseGetPos,MOV_X1,MOV_Y1,moveID
WinGet,MOV_Win,MinMax,ahk_id %moveID%
MouseGetPos, , , id, control 
WinGetClass, dclass, ahk_id %id% 
if dclass != WorkerW
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

~F20 & RButton::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {RButton DOWN}
keywait, RButton
send {RButton UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,hParentGUI
WinGet,KDE_Win,MinMax,ahk_id %hParentGUI%
WinGetClass, dclass, ahk_id %hParentGUI% 
if dclass != WorkerW
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
IfWinNotActive, ahk_class WorkerW
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
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
    MouseGetPos,,,hParentGUI
WinGetClass, dclass, ahk_id %hParentGUI% 
if dclass != WorkerW
{
    WinClose,ahk_id %hParentGUI%
    send, {F20, UP}
    return
}
return
}
return
}

#e::
{
isFullScreen := isWindowFullScreen( "A" )
IfWinNotActive, ahk_class WorkerW
{
if isFullScreen = 1
{
send {e DOWN}
keywait, e
send {e UP}
return
}
}
if isFullScreen != 1 or IfWinActive, ahk_class WorkerW
{
run explorer.exe
WinWait, currentWindow, , -1
WinGetTitle, currentWindow, A
IfWinExist %currentWindow%
 {
If (ahk_exe = Explorer.EXE)
{
	MouseGetPos, XPos, YPos
	XPos -= 648
	YPos -= 363
   WinMove,This PC,,XPos, YPos, 1296, 727
   return
}
 }
}
return
}

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

#include WinGetPosEx.ahk
