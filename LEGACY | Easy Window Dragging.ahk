#NoEnv
Coordmode, Mouse, Screen
Menu, Tray, Icon, shell32.dll, 300

#SingleInstance force

; The shortcuts:
;  Win + Left Button  : Drag to move a window.
;  Win + Right Button : Drag to resize a window.
;  Win + Mouse Back   : Minimize a window.
;  Win + Mouse Forward: Maximize/Restore a window.
;  Win + Middle Button: Close a window.

SetWinDelay,0

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
	MouseGetPos, , , id, control 
	WinGetClass, dclass, ahk_id %id% 
	if dclass = WorkerW
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
