Menu, Tray, Icon, pifmgr.dll, 13

; Proudly Created by Mitchell Thomas

; This is the Chrome version of my Firefox keyboard.

; This script enables me to use Chrome in the background.
; If you press the menu/appskey (to the right of the right windows key on a full sized keyboard)
; as a modifier for another key the key you pressed will be sent to Chrome in the background.
; This means you can fiddle with Chrome without tabbing out of a game!
; When used in conjunction with the "Vimium" extension it enables easy navigation.

; Vimium Firefox: https://addons.mozilla.org/en-US/Chrome/addon/vimium-ff/
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

; Rarely a game will require you to reload the script after opening it to work, GTA V is the only example i've come across

AppsKey & a::
{
If GetKeyState("Control", "p")
{
If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^A, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^a, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , A, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !a, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , a, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^B, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^b, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , B, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !b, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , b, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^C, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^c, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , C, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !c, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , c, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^D, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^d, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , D, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !d, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , d, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^E, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^e, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , E, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !e, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , e, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^F, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^f, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , F, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !f, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , f, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^G, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^g, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , G, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !g, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , g, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^H, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^h, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , H, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !h, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , h, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^I, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^i, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , I, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !i, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , i, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^J, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^j, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , J, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !j, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , j, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^K, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^k, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , K, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !k, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , k, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^L, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^l, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , L, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !l, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , l, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^M, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^m, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , M, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !m, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , m, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^N, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^n, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , N, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !n, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , n, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^O, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^o, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , O, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !o, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , o, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^P, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^p, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , P, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !p, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , p, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^Q, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^q, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , Q, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !q, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , q, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^R, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^r, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , R, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !r, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , r, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^S, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^s, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , S, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !s, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , s, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^T, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^t, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , T, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !t, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , t, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^U, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^u, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , U, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !u, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , u, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^V, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^v, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , V, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !v, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , v, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^W, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^w, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , W, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !w, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , w, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^X, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^x, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , X, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !x, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , x, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^Y, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^y, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , Y, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !y, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , y, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^Z, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^z, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , Z, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !z, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , z, Chrome
return
}
}

AppsKey & `::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^``, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ~, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !``, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ``, Chrome
return
}
}

AppsKey & 1::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^1, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {!}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !1, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 1, Chrome
return
}
}

AppsKey & 2::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^2, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , @, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !2, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 2, Chrome
return
}
}

AppsKey & 3::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^3, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {#}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !3, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 3, Chrome
return
}
}

AppsKey & 4::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^4, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , $, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !4, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 4, Chrome
return
}
}

AppsKey & 5::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^5, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , `%, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !5, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 5, Chrome
return
}
}

AppsKey & 6::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^6, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {^}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !6, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 6, Chrome
return
}
}

AppsKey & 7::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^7, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , &, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !7, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 7, Chrome
return
}
}

AppsKey & 8::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^8, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , *, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !8, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 8, Chrome
return
}
}

AppsKey & 9::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^9, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , (, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !9, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 9, Chrome
return
}
}

AppsKey & 0::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^0, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ), Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !0, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , 0, Chrome
return
}
}

AppsKey & -::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^-, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , _, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !-, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , -, Chrome
return
}
}

AppsKey & =::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^=, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {+}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !=, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , =, Chrome
return
}
}

AppsKey & [::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^[, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ![, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , [, Chrome
return
}
}


AppsKey & ]::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^], Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , }, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !], Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ], Chrome
return
}
}

AppsKey & \::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^\, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , |, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !\, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , \, Chrome
return
}
}

AppsKey & `;::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^;, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , :, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !;, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , `;, Chrome
return
}
}

AppsKey & '::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^', Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ", Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !', Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ', Chrome
return
}
}

AppsKey & ,::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^,, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , <, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !,, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , `,, Chrome
return
}
}

AppsKey & .::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^., Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , >, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !., Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ., Chrome
return
}
}

AppsKey & /::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^/, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ?, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !/, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , /, Chrome
return
}
}

AppsKey & F1::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F1}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F1}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F1}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F1}, Chrome
return
}
}

AppsKey & F2::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F2}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F2}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F2}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F2}, Chrome
return
}
}

AppsKey & F3::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F3}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F3}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F3}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F3}, Chrome
return
}
}

AppsKey & F4::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F4}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F4}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F4}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F4}, Chrome
return
}
}

AppsKey & F5::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F5}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F5}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F5}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F5}, Chrome
return
}
}

AppsKey & F6::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F6}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F6}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F6}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F6}, Chrome
return
}
}

AppsKey & F7::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F7}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F7}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F7}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F7}, Chrome
return
}
}

AppsKey & F8::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F8}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F8}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F8}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F8}, Chrome
return
}
}

AppsKey & F9::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F9}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F9}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F9}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F9}, Chrome
return
}
}

AppsKey & F10::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F10}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F10}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F10}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F10}, Chrome
return
}
}

AppsKey & F11::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F11}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F11}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F11}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F11}, Chrome
return
}
}

AppsKey & F12::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{F12}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{F12}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{F12}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {F12}, Chrome
return
}
}

AppsKey & Enter::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{Enter}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{Enter}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{Enter}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {Enter}, Chrome
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

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^+{tab}, Chrome
return
}
Else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{tab}, Chrome
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{tab}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{tab}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {tab}, Chrome
return
}
}

AppsKey & Left::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{left}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{left}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{left}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {left}, Chrome
return
}
}

AppsKey & Right::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{right}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{right}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{right}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {right}, Chrome
return
}
}

AppsKey & Up::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{up}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{up}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{up}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {up}, Chrome
return
}
}

AppsKey & Down::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{down}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{down}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{down}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {down}, Chrome
return
}
}

AppsKey & Backspace::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{backspace}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{backspace}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{backspace}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {backspace}, Chrome
return
}
}

AppsKey & Delete::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{delete}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{delete}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{delete}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {delete}, Chrome
return
}
}


AppsKey & PgUp::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{pgup}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{pgup}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{pgup}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {pgup}, Chrome
return
}
}

AppsKey & PgDn::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{pgdn}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{pgdn}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{pgdn}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {pgdn}, Chrome
return
}
}

AppsKey & Space::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {Ctrl down}{space}{Ctrl up}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {Shift down}{space}{Shift up}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {Alt down}{space}{Alt up}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {space}, Chrome
return
}
}

AppsKey & Home::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , ^{home}, Chrome
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , +{home}, Chrome
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , !{home}, Chrome
return
}
else
{
SetTitleMatchMode, 2

ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome

ControlFocus,,ahk_id %outputvar%


ControlSend, , {home}, Chrome
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
