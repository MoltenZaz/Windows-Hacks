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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^A, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^a, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, A, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !a, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, a, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^B, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^b, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, B, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !b, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, b, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^C, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^c, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, C, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !c, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, c, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^D, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^d, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, D, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !d, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, d, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^E, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^e, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, E, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !e, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, e, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^F, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^f, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, F, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !f, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, f, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^G, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^g, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, G, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !g, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, g, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^H, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^h, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, H, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !h, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, h, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^I, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^i, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, I, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !i, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, i, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^J, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^j, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, J, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !j, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, j, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^K, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^k, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, K, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !k, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, k, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^L, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^l, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, L, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !l, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, l, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^M, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^m, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, M, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !m, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, m, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^N, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^n, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, N, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !n, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, n, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^O, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^o, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, O, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !o, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, o, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^P, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^p, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, P, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !p, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, p, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^Q, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^q, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, Q, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !q, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, q, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^R, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^r, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, R, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !r, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, r, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^S, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^s, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, S, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !s, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, s, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^T, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^t, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, T, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !t, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, t, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^U, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^u, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, U, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !u, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, u, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^V, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^v, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, V, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !v, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, v, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^W, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^w, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, W, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !w, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, w, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^X, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^x, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, X, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !x, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, x, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^Y, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^y, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, Y, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !y, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, y, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^Z, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^z, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, Z, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !z, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, z, ahk_class MozillaWindowClass
return
}
}

AppsKey & `::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^``, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ~, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !``, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ``, ahk_class MozillaWindowClass
return
}
}

AppsKey & 1::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^1, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {!}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !1, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 1, ahk_class MozillaWindowClass
return
}
}

AppsKey & 2::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^2, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, @, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !2, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 2, ahk_class MozillaWindowClass
return
}
}

AppsKey & 3::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^3, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {#}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !3, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 3, ahk_class MozillaWindowClass
return
}
}

AppsKey & 4::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^4, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, $, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !4, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 4, ahk_class MozillaWindowClass
return
}
}

AppsKey & 5::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^5, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, `%, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !5, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 5, ahk_class MozillaWindowClass
return
}
}

AppsKey & 6::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^6, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {^}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !6, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 6, ahk_class MozillaWindowClass
return
}
}

AppsKey & 7::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^7, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, &, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !7, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 7, ahk_class MozillaWindowClass
return
}
}

AppsKey & 8::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^8, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, *, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !8, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 8, ahk_class MozillaWindowClass
return
}
}

AppsKey & 9::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^9, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, (, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !9, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 9, ahk_class MozillaWindowClass
return
}
}

AppsKey & 0::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^0, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ), ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !0, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, 0, ahk_class MozillaWindowClass
return
}
}

AppsKey & -::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^-, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, _, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !-, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, -, ahk_class MozillaWindowClass
return
}
}

AppsKey & =::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^=, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {+}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !=, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, =, ahk_class MozillaWindowClass
return
}
}

AppsKey & [::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^[, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ![, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, [, ahk_class MozillaWindowClass
return
}
}


AppsKey & ]::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^], ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, }, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !], ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ], ahk_class MozillaWindowClass
return
}
}

AppsKey & \::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^\, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, |, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !\, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, \, ahk_class MozillaWindowClass
return
}
}

AppsKey & `;::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^;, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, :, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !;, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, `;, ahk_class MozillaWindowClass
return
}
}

AppsKey & '::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^', ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ", ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !', ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ', ahk_class MozillaWindowClass
return
}
}

AppsKey & ,::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^,, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, <, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !,, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, `,, ahk_class MozillaWindowClass
return
}
}

AppsKey & .::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^., ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, >, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !., ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ., ahk_class MozillaWindowClass
return
}
}

AppsKey & /::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^/, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ?, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !/, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, /, ahk_class MozillaWindowClass
return
}
}

AppsKey & F1::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F1}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F1}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F1}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F1}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F2::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F2}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F2}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F2}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F2}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F3::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F3}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F3}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F3}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F3}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F4::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F4}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F4}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F4}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F4}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F5::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F5}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F5}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F5}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F5}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F6::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F6}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F6}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F6}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F6}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F7::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F7}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F7}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F7}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F7}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F8::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F8}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F8}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F8}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F8}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F9::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F9}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F9}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F9}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F9}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F10::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F10}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F10}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F10}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F10}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F11::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F11}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F11}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F11}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
return
}
}

AppsKey & F12::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{F12}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{F12}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{F12}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {F12}, ahk_class MozillaWindowClass
return
}
}

AppsKey & Enter::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{Enter}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{Enter}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{Enter}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {Enter}, ahk_class MozillaWindowClass
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

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^+{tab}, ahk_class MozillaWindowClass
return
}
Else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{tab}, ahk_class MozillaWindowClass
return
}
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{tab}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{tab}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {tab}, ahk_class MozillaWindowClass
return
}
}

AppsKey & Left::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{left}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{left}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{left}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {left}, ahk_class MozillaWindowClass
return
}
}

AppsKey & Right::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{right}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{right}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{right}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {right}, ahk_class MozillaWindowClass
return
}
}

AppsKey & Up::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{up}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{up}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{up}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {up}, ahk_class MozillaWindowClass
return
}
}

AppsKey & Down::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{down}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{down}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{down}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {down}, ahk_class MozillaWindowClass
return
}
}

AppsKey & Backspace::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{backspace}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{backspace}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{backspace}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {backspace}, ahk_class MozillaWindowClass
return
}
}

AppsKey & Delete::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{delete}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{delete}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{delete}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {delete}, ahk_class MozillaWindowClass
return
}
}


AppsKey & PgUp::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{pgup}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{pgup}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{pgup}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {pgup}, ahk_class MozillaWindowClass
return
}
}

AppsKey & PgDn::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{pgdn}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{pgdn}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{pgdn}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {pgdn}, ahk_class MozillaWindowClass
return
}
}

AppsKey & Space::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {Ctrl down}{space}{Ctrl up}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {Shift down}{space}{Shift up}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {Alt down}{space}{Alt up}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {space}, ahk_class MozillaWindowClass
return
}
}

AppsKey & Home::
{
If GetKeyState("Control", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, ^{home}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Shift", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, +{home}, ahk_class MozillaWindowClass
return
}
else If GetKeyState("Alt", "p")
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, !{home}, ahk_class MozillaWindowClass
return
}
else
{
SetTitleMatchMode, 2

;ControlGet, OutputVar, Hwnd,,MozillaCompositorWindowClass1, Firefox

;ControlFocus,,ahk_id %outputvar%


ControlSend, ahk_parent, {home}, ahk_class MozillaWindowClass
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
