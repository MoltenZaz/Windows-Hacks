/*
Title: HSV v0.1 (Preview)

Group: Credit

The source for these functions was extracted from the following.  Only minor
changes have been made.

 *  http://stackoverflow.com/questions/3018313/algorithm-to-convert-rgb-to-hsv-and-hsv-to-rgb-in-range-0-255-for-both

Group: Functions
*/
;------------------------------
;
; Function: HSV_Convert2HSV
;
; Description:
;
; Description:
;
;   Convert RGB (Red, Green, Blue) color values to HSV (Hue, Saturation,
;   Value).
;
; Parameters:
;
;   R, G, B - Red, Green, and Blue color values represented as a real number
;       from 0 to 1.  Ex: 0.400638.
;
; Returns:
;
;   An object with H, S, and V properties.  The properties contain a real number
;   from 0 to 1.  Ex: 0.941324.
;
;   The H property contains the hue of the color.  This value is often converted
;   to a degree of color (from 0 to 360) by multiplying the value by 360.  Ex:
;   Hue:=Round(Out.H*360).
;
;   The S property contains the color saturation.  This value is often converted
;   to a percentage by multiplying the value by 100.  Ex:
;   Saturation:=Round(Out.S*100,1).
;
;   The V property contains the color Value (also known as Brightness).  This
;   value is often converted to a percentage by multiplying the value by 100.
;   Ex: Brightness:=Round(Out.V*100,1).
;
;-------------------------------------------------------------------------------
SetKeyDelay, 2
~F10::
{
running := 1
While running == 1
{
	;Sleep, 3000
	MouseGetPos, MouseX, MouseY
	MouseX -= 20
	MouseY -= 20
	PixelGetColor, color, %MouseX%, %MouseY%
	;Msgbox, %color%
	Sleep, 1000
	Convert_BGR2HSV(color)
	Sleep, 10000
	;Msgbox, %color% %H% %S% %V% %HSV%
	;Sleep, 60000
}
return
}

~F12::running := 0

Convert_BGR2HSV(BGR)
{
  h:=StrLen(BGR)
  R:=Convert_X("0x" . substr(BGR,h-1,2),"D")/255
  G:=Convert_X("0x" . substr(BGR,h-3,2),"D")/255
  B:=Convert_X("0x" . substr(BGR,h-5,2),"D")/255

  if (R>G)                                                 ;                value     
  {
    if (R>B)                                               ;                max=R
    {
      MIN:=B<G ? B : G
      V:=R
      H:=Mod((G-B)/(V-MIN)*60+360,360)                     ;hue
    } else                                                 ;                max=B
    {
      MIN:=R<G ? R : G
      V:=B
      H:=(V=MIN ? 0 : (R-G)/(V-MIN)*60+240)                ;hue
    }
  } else
  {
    if (G>B)                                               ;                max=G
    {
      MIN:=B<R ? B : R
      V:=G
      H:=Mod((B-R)/(V-MIN)*60+120,360)                     ;hue
    } else                                                 ;                max=B
    {
      MIN:=R<G ? R : G
      V:=B
      H:=(V=MIN ? 0 : (R-G)/(V-MIN)*60+240)                ;hue
    }
  }
  
  S:=(V=0 ? 0 : (V-MIN)/V)                                 ;     saturation
  H := substr("00" floor(H), -2)
  S := substr("00" floor(S*1000), -2)
  V := substr("00" floor(V*1000), -2)
  
  ; ; insert webhook here
  ; Sleep, 2000
  ; ;ControlSend, ahk_parent, {Ctrl down}t{Ctrl up}, ahk_exe Firefox.exe
  ; Sleep, 100
  ; ControlSend, ahk_parent, {Ctrl down}t{Ctrl up}sequematic.com/variable-change/2312/274EC797FC/ColourH/=%H%, ahk_exe Firefox.exe
  ; Sleep, 100
  ; ControlSend, ahk_parent, {Enter}, ahk_exe Firefox.exe
  ; Sleep, 3000
  ; ControlSend, ahk_parent, {Ctrl down}w{Ctrl up}, ahk_exe Firefox.exe
  ; Sleep, 100
  
  ; ControlSend, ahk_parent, {Ctrl down}t{Ctrl up}, ahk_exe Firefox.exe
  ; Sleep, 100
  ; ControlSend, ahk_parent, sequematic.com/variable-change/2312/274EC797FC/ColourS/=%S%, ahk_exe Firefox.exe
  ; Sleep, 100
  ; ControlSend, ahk_parent, {Enter}, ahk_exe Firefox.exe
  ; Sleep, 3000
  ; ControlSend, ahk_parent, {Ctrl down}w{Ctrl up}, ahk_exe Firefox.exe
  ; Sleep, 100
  
  ; ControlSend, ahk_parent, {Ctrl down}t{Ctrl up}sequematic.com/variable-change/2312/274EC797FC/ColourV/=%V%, ahk_exe Firefox.exe
  ; Sleep, 100
  ; ControlSend, ahk_parent, {Enter}, ahk_exe Firefox.exe
  ; Sleep, 2000
  ; ControlSend, ahk_parent, {Ctrl down}w{Ctrl up}, ahk_exe Firefox.exe
  ; Sleep, 100
  ;Msgbox, %color% %H% %S% %V%
  
  ;Run https://sequematic.com/variable-change/2312/274EC797FC/ColourH/=%H%
  ;Run https://sequematic.com/variable-change/2312/274EC797FC/ColourS/=%S%
  ;Run https://sequematic.com/variable-change/2312/274EC797FC/ColourV/=%V%
  
  link := "https://sequematic.com/variable-change/2312/274EC797FC/ColourH/="H
 	req := ComObjCreate("Msxml2.XMLHTTP")
	req.open("GET", link, False)
	req.Send()
  link := "https://sequematic.com/variable-change/2312/274EC797FC/ColourS/="S
 	req := ComObjCreate("Msxml2.XMLHTTP")
	req.open("GET", link, False)
	req.Send()
  link := "https://sequematic.com/variable-change/2312/274EC797FC/ColourV/="V
 	req := ComObjCreate("Msxml2.XMLHTTP")
	req.open("GET", link, False)
	req.Send()
;MsgBox, % req.responseText
	
  ;ExitApp
  
  return %HSV% substr("00" floor(H), -2) substr("00" floor(S*100), -2) substr("00" floor(V*100), -2)
}

; H hex D (decimal) 
Convert_X(mit,mire="H")
{
  SetFormat, IntegerFast, %mire%
  mit+=0
  return (mit="0x0" ? "00" : mit)
}

HSV_Convert2HSV(r,g,b)
    {
    min:=(r<g) ? r:g
    min:=(min <b) ? min :b

    max:=(r>g) ? r:g
    max:=(max >b) ? max :b

    v:=max
    delta:=max-min
    if (delta<0.00001)
        {
        h:=0
        s:=0
        Return {h:h,s:s,v:v}
        }

    if (max>0)
        s:=(delta/max)
     else
        {
        h:=0
        s:=0
        Return {h:h,s:s,v:v}
        }

    ;-- Calculate hue
    if (r=max)
        h:=(g-b)/delta      ;-- between yellow & magenta
     else if (g>=max)
        h:=2+(b-r)/delta    ;-- between cyan & yellow
     else
        h:=4+(r-g)/delta    ;-- between magenta & cyan

    h/=6.0
    if (h<0)
        h+=1.0

    Return {h:h,s:s,v:v}
    }


;------------------------------
;
; Function: HSV_Convert2RGB
;
; Description:
;
;   Converts HSV (Hue, Saturation, Value) values into RGB (Red, Green, Blue)
;   values.
;
; Parameters:
;
;   H, S, V  - Hue, Saturation, and Value color values represented as a real
;       number from 0 to 1.  Ex: 0.571795.
;
; Returns:
;
;   An object with R, G, and B properties that contain color values for Red,
;   Green, and Blue.  The values are represented as a real number from 0 to 1.
;   Ex: 0.650733.  These values are often converted to a single byte unsigned
;   integer value (i.e. a value from 0 to 255).  Ex: Red:=Round(Out.R*255).
;
;-------------------------------------------------------------------------------
HSV_Convert2RGB(h,s,v)
    {
    if (s=0)
        Return {r:v,g:v,b:v}

    hh:=h
    if (hh=1)  ;-- Exactly 360 degrees
        hh:=0.0

    hh*=6.0
    i:=Floor(hh)

    ff:=hh-i
    p:=v*(1.0-s)
    q:=v*(1.0-(s*ff))
    t:=v*(1.0-(s*(1.0-ff)))

    if (i=0)
        {
        r:=v
        g:=t
        b:=p
        }
     else if (i=1)
        {
        r:=q
        g:=v
        b:=p
        }
     else if (i=2)
        {
        r:=p
        g:=v
        b:=t
        }
     else if (i=3)
        {
        r:=p
        g:=q
        b:=v
        }
     else if (i=4)
        {
        r:=t
        g:=p
        b:=v
        }
     else
        {
        r:=v
        g:=p
        b:=q
        }

    Return {r:r,g:g,b:b}
    }