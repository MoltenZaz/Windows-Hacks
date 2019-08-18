; IMPORTANT: WHEN THE SCRIPT STARTS HAVE YOUR CURSOR OVER YOUR DESKTOP

; this attempts to add the desktop to a blacklist, however it only works if the mouse cursor is over the desktop when the script launches

; If your cursor is not over the desktop when the script starts try refreshing the script and trying again

; IF YOUR DESKTOP IS NOT ADDED TO THE BLACKLIST IT IS POSSIBLE TO MINIMIZE AND CLOSE THE DESKTOP!!!

; this attempts to stop the script from working on the desktop but will only be successful
; if the mouse cursor is over the desktop when the script launches
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
MouseGetPos,,,KDE_id
DesktopID := KDE_id
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

SetWinDelay,2

CoordMode,Mouse
return

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
    MouseGetPos,,,KDE_id
    if KDE_id != %DesktopID%
{
    ; This message is mostly equivalent to WinMinimize,
    ; but it avoids a bug with PSPad.
    PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
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
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
if KDE_id != %DesktopID%
{
If KDE_Win
    return
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
}
}
return
}

#Xbutton2::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {XButton2 DOWN}
keywait, XButton2
send {XButton2 UP}
return
}
else
    MouseGetPos,,,KDE_id
    if KDE_id != %DesktopID%
{
    ; Toggle between maximized and restored state.
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    If KDE_Win
        WinRestore,ahk_id %KDE_id%
    Else
        WinMaximize,ahk_id %KDE_id%
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
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    if KDE_id != %DesktopID%
{
If KDE_Win
    return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
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
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
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
    MouseGetPos,,,KDE_id
    if KDE_id != %DesktopID%
{
    WinClose,ahk_id %KDE_id%
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
F18::
MouseGetPos,,,KDE_id
if KDE_id != %DesktopID%
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

F17::
MouseGetPos,,,KDE_id
if KDE_id != %DesktopID%
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

#F20::

~F20::
MouseGetPos,,,KDE_id
if KDE_id != %DesktopID%
{
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
F20::3
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
    MouseGetPos,,,KDE_id
    if KDE_id != %DesktopID%
{
    ; This message is mostly equivalent to WinMinimize,
    ; but it avoids a bug with PSPad.
    PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
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
    MouseGetPos,,,KDE_id
    if KDE_id != %DesktopID%
{
    ; Toggle between maximized and restored state.
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    If KDE_Win
        WinRestore,ahk_id %KDE_id%
    Else
        WinMaximize,ahk_id %KDE_id%
    send, {F20, UP}
    return
}
return
}
}

~F20 & Xbutton1::
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
{
    MouseGetPos,,,KDE_id
    if KDE_id != %DesktopID%
{
    ; This message is mostly equivalent to WinMinimize,
    ; but it avoids a bug with PSPad.
    PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
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
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
if KDE_id != %DesktopID%
{
If KDE_Win
    return
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
}
}
return
}
}

~F20 & Xbutton2::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 1
{
send {XButton2 DOWN}
keywait, XButton2
send {XButton2 UP}
return
}
else
{
    MouseGetPos,,,KDE_id
    if KDE_id != %DesktopID%
{
    ; Toggle between maximized and restored state.
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    If KDE_Win
        WinRestore,ahk_id %KDE_id%
    Else
        WinMaximize,ahk_id %KDE_id%
    send, {F20, UP}
    return
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
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    if KDE_id != %DesktopID%
{
If KDE_Win
    return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
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
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
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
    MouseGetPos,,,KDE_id
    if KDE_id != %DesktopID%
{
    WinClose,ahk_id %KDE_id%
    send, {F20, UP}
    return
}
return
}
}

LWin::
{
MouseGetPos,,,KDE_id
if KDE_id = %DesktopID%
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
MouseGetPos,,,KDE_id
if KDE_id = %DesktopID%
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
