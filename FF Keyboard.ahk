Menu, Tray, Icon, pifmgr.dll, 13

; Proudly Created by Mitchell Thomas

; This script enables me to use firefox in the background.
; If you press the menu/appskey (to the right of the right windows key on a full sized keyboard)
; as a modifier for another key the key you pressed will be sent to firefox in the background.
; This means you can fiddle with firefox without tabbing out of a game!
; When used in conjunction with the "Vimium" extension it enables easy navigation.

; Vimium firefox: https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
; Vimium chrome: https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)

; Here are my Vimium custom key mappings (remove the semicolons): 
;unmapAll
;map <backspace> goBack
;map \ LinkHints.activateMode
;map | LinkHints.activateModeToOpenInNewTab

; This means by pressing \ an overlay appears on all visable links on a webpage, you then type
; the assigned key combiniation to the link you want to click and vimium shall click it for you!

; I have it setup so that most common hotkey combinations will work (ctrl, alt, shift, ctrl + shift)
; The numpad is setup to change volume for my headphones when pressed without a hotkey, but when ctrl is used it
; will change the volume on my xbox and nintendo switch, which is hooked into line in and the audio out from my monitor's hdmi

; If you use find and replace to replace "Firefox" with "Chrome" this code should work in Google Chrome instead of FireFox

; Rarely a game will require you to reload the script after opening it to work, GTA V is the only example i've come across

AppsKey & a::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^A, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^a, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , A, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !a, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , a, Firefox
return
}
}

AppsKey & b::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^B, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^b, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , B, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !b, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , b, Firefox
return
}
}

AppsKey & c::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^C, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^c, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , C, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !c, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , c, Firefox
return
}
}

AppsKey & d::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^D, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^d, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , D, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !d, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , d, Firefox
return
}
}

AppsKey & e::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^E, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^e, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , E, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !e, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , e, Firefox
return
}
}

AppsKey & f::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^F, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^f, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , F, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !f, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , f, Firefox
return
}
}

AppsKey & g::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^G, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^g, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , G, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !g, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , g, Firefox
return
}
}

AppsKey & h::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^H, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^h, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , H, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !h, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , h, Firefox
return
}
}

AppsKey & i::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^I, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^i, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , I, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !i, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , i, Firefox
return
}
}

AppsKey & j::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^J, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^j, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , J, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !j, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , j, Firefox
return
}
}

AppsKey & k::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^K, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^k, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , K, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !k, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , k, Firefox
return
}
}

AppsKey & l::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^L, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^l, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , L, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !l, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , l, Firefox
return
}
}

AppsKey & m::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^M, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^m, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , M, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !m, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , m, Firefox
return
}
}

AppsKey & n::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^N, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^n, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , N, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !n, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , n, Firefox
return
}
}

AppsKey & o::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^O, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^o, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , O, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !o, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , o, Firefox
return
}
}

AppsKey & p::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^P, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^p, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , P, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !p, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , p, Firefox
return
}
}

AppsKey & q::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^Q, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^q, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , Q, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !q, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , q, Firefox
return
}
}

AppsKey & r::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^R, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^r, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , R, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !r, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , r, Firefox
return
}
}

AppsKey & s::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^S, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^s, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , S, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !s, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , s, Firefox
return
}
}

AppsKey & t::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^T, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^t, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , T, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !t, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , t, Firefox
return
}
}

AppsKey & u::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^U, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^u, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , U, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !u, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , u, Firefox
return
}
}

AppsKey & v::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^V, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^v, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , V, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !v, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , v, Firefox
return
}
}

AppsKey & w::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^W, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^w, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , W, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !w, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , w, Firefox
return
}
}

AppsKey & x::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^X, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^x, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , X, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !x, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , x, Firefox
return
}
}

AppsKey & y::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^Y, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^y, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , Y, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !y, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , y, Firefox
return
}
}

AppsKey & z::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^Z, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^z, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , Z, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !z, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , z, Firefox
return
}
}

AppsKey & `::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^``, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ~, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !``, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ``, Firefox
return
}
}

AppsKey & 1::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^1, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {!}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !1, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 1, Firefox
return
}
}

AppsKey & 2::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^2, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , @, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !2, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 2, Firefox
return
}
}

AppsKey & 3::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^3, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {#}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !3, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 3, Firefox
return
}
}

AppsKey & 4::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^4, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , $, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !4, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 4, Firefox
return
}
}

AppsKey & 5::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^5, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , `%, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !5, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 5, Firefox
return
}
}

AppsKey & 6::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^6, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {^}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !6, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 6, Firefox
return
}
}

AppsKey & 7::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^7, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , &, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !7, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 7, Firefox
return
}
}

AppsKey & 8::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^8, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , *, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !8, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 8, Firefox
return
}
}

AppsKey & 9::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^9, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , (, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !9, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 9, Firefox
return
}
}

AppsKey & 0::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^0, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ), Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !0, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , 0, Firefox
return
}
}

AppsKey & -::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^-, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , _, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !-, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , -, Firefox
return
}
}

AppsKey & =::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^=, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {+}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !=, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , =, Firefox
return
}
}

AppsKey & [::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^[, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ![, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , [, Firefox
return
}
}


AppsKey & ]::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^], Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , }, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !], Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ], Firefox
return
}
}

AppsKey & \::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^\, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , |, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !\, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , \, Firefox
return
}
}

AppsKey & `;::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^;, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , :, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !;, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , `;, Firefox
return
}
}

AppsKey & '::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^', Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ", Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !', Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ', Firefox
return
}
}

AppsKey & ,::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^,, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , <, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !,, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , `,, Firefox
return
}
}

AppsKey & .::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^., Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , >, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !., Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ., Firefox
return
}
}

AppsKey & /::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^/, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ?, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !/, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , /, Firefox
return
}
}

AppsKey & F1::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F1}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F1}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F1}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F1}, Firefox
return
}
}

AppsKey & F2::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F2}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F2}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F2}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F2}, Firefox
return
}
}

AppsKey & F3::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F3}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F3}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F3}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F3}, Firefox
return
}
}

AppsKey & F4::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F4}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F4}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F4}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F4}, Firefox
return
}
}

AppsKey & F5::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F5}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F5}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F5}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F5}, Firefox
return
}
}

AppsKey & F6::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F6}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F6}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F6}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F6}, Firefox
return
}
}

AppsKey & F7::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F7}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F7}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F7}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F7}, Firefox
return
}
}

AppsKey & F8::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F8}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F8}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F8}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F8}, Firefox
return
}
}

AppsKey & F9::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F9}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F9}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F9}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F9}, Firefox
return
}
}

AppsKey & F10::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F10}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F10}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F10}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F10}, Firefox
return
}
}

AppsKey & F11::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F11}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F11}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F11}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F11}, Firefox
return
}
}

AppsKey & F12::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F12}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F12}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F12}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F12}, Firefox
return
}
}

AppsKey & Enter::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{Enter}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{Enter}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{Enter}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {Enter}, Firefox
return
}
}

AppsKey & Tab::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^+{tab}, Firefox
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{tab}, Firefox
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{tab}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{tab}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {tab}, Firefox
return
}
}

AppsKey & Left::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{left}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{left}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{left}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {left}, Firefox
return
}
}

AppsKey & Right::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{right}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{right}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{right}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {right}, Firefox
return
}
}

AppsKey & Up::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{up}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{up}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{up}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {up}, Firefox
return
}
}

AppsKey & Down::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{down}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{down}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{down}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {down}, Firefox
return
}
}

AppsKey & Backspace::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{backspace}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{backspace}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{backspace}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {backspace}, Firefox
return
}
}

AppsKey & Delete::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{delete}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{delete}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{delete}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {delete}, Firefox
return
}
}


AppsKey & PgUp::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{pgup}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{pgup}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{pgup}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {pgup}, Firefox
return
}
}

AppsKey & PgDn::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{pgdn}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{pgdn}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{pgdn}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {pgdn}, Firefox
return
}
}

AppsKey & Space::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {Ctrl down}{space}{Ctrl up}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {Shift down}{space}{Shift up}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {Alt down}{space}{Alt up}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {space}, Firefox
return
}
}

AppsKey & Home::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{home}, Firefox
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{home}, Firefox
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{home}, Firefox
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Firefox_RenderWidgetHostHWND1, Firefox

ControlFocus,,ahk_id %outputvar%


ControlSend, , {home}, Firefox
return
}
}

; The numpad is setup to change volume for my headphones when pressed without a hotkey, but when ctrl is used it
; will change the volume on my xbox and nintendo switch, which is hooked into line in and the audio out from my monitor's hdmi
; Numpad period is set to mute my xbox/switch

; YOU NEED TO HAVE NIRCMD AND SOUNDVOLUMEVIEW INSTALLED FOR THIS TO WORK!!!

; It also needs to be adapted for your setup!

Appskey & NumpadDot::
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /Switch "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}"
return
}

AppsKey & Numpad1::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 10
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 10
return
}
}

AppsKey & Numpad2::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 20
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 20
return
}
}

AppsKey & Numpad3::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 30
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 30
return
}
}

AppsKey & Numpad4::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 40
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 40
return
}
}

AppsKey & Numpad5::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 50
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 50
return
}
}

AppsKey & Numpad6::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 60
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 60
return
}
}

AppsKey & Numpad7::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 70
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 70
return
}
}

AppsKey & Numpad8::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 80
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 80
return
}
}

AppsKey & Numpad9::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 90
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 90
return
}
}

AppsKey & Numpad0::
{
If GetKeyState("Control", "p")
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.1.00000000}.{4d37a526-5c16-47ee-8e4e-47a0eb2d3f8d}" 100
return
}
else
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "{0.0.0.00000000}.{0e6a17a9-ac6b-4b41-85f7-71053bac6851}" 100
return
}
}
