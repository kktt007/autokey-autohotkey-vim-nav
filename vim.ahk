#Include app_memorize_restore.ahk
#Include app_switch_by_name.ahk
#Include window.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
DetectHiddenWindows, On
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetBatchLines -1
ListLines Off

SetCapsLockState, AlwaysOff

Suspend On

; avoid bad state of CAPS pressed when not down
GetKeyState, state, CapsLock
if state = D
{
  Suspend On
  SetCapsLockState, off
  Send {CapsLock Up}
}

;; modifier into alt_mode
space::
{
  if (alt_mode) {
    alt_mode := false
  } else {
    alt_mode := true
    SetTimer, alt_mode_off, 1000 
  }
  return
}

alt_mode_off:
    alt_mode := false
return

;; modifier into alt_mode2
tab::
{
  if (alt_mode2) {
    alt_mode2 := false
  } else {
    alt_mode2 := true
    SetTimer, alt_mode2_off, 1000 
  }
  return
}

alt_mode2_off:
    alt_mode2 := false
return

-::
{
    SendInput {End}
    return
}
)::
{
    SendInput +{Home}
    return
}
_::
{
    SendInput +{End}
    return
}
0::
{
    SendInput {Home}
    return
}  
+1::
{
    if (alt_mode) {
      memorize("1")          
      return
    }
}
1::
{
    if (alt_mode) {
      restore("1")
      return
    }
    if (alt_mode2) {
      reset_memory("1")
      return
    }    
}
+2::
{
    if (alt_mode) {
      memorize("2")          
      return
    }
}
2::
{
    if (alt_mode) {
      restore("2")
      return
    }
    if (alt_mode2) {
      reset_memory("2")
      return
    }    
}
+3::
{
    if (alt_mode) {
      memorize("3")          
      return
    }
}
3::
{
    if (alt_mode) {
      restore("3")
      return
    }
    if (alt_mode2) {
      reset_memory("3")
      return
    }    
}
+4::
{
    if (alt_mode) {
      memorize("4")          
      return
    }
}
4::
{
    if (alt_mode) {
      restore("4")
      return
    }
    if (alt_mode2) {
      reset_memory("4")
      return
    }    
}
+5::
{
    if (alt_mode) {
      memorize("5")          
      return
    }
}
5::
{
    if (alt_mode) {
      restore("5")
      return
    }
    if (alt_mode2) {
      reset_memory("5")
      return
    }    
}
a::
{
    if (alt_mode) {
      switch("a")
      return
    }
    while GetKeyState("a", "P")
    {
      Send {WheelUp}
      Sleep, 45
    }
    return
}
b::
{
    if (alt_mode) {
      switch("b")
      return
    }
    SendInput {PgUp}
    return
}
c::
{
    if (alt_mode) {
      switch("c")
      return
    }
}
d::
{
    if (alt_mode) {
      switch("d")
      return
    }
    SendInput {Delete}
    return
}
+d::
{
    SendInput +{Delete}
    return
}
e::
{
    if (alt_mode) {
      SendEvent {LWin down}{Right down}{LWin up}{Right up}      
      return
    }
    SendInput ^{Up}
    return
}
f::
{
    if (alt_mode) {
      switch("f")
      return
    }
    SendInput {PgDn}
    return
}
g::
{
    if (alt_mode) {
      switch("g")
      return
    }
    SendInput ^{Home}
    return
}
+g::
{
    SendInput ^{End}
    return
}
h::
{
    SendInput {Left}
    return
}
+h::
{
    SendInput +{Left}
    return
}
i::
{
    SendInput {Up}{Up}{Up}{Up}{Up}
    return
}
+i::
{
    SendInput +{Up}+{Up}+{Up}+{Up}+{Up}
    return
}
j::
{
    SendInput {Down}
    return
}
+j::
{
    SendInput +{Down}
    return
}
k::
{
    SendInput {Up}
    return
}
+k::
{
    SendInput +{Up}
    return
}
l::
{
    SendInput {Right}
    return
}
+l::
{
    SendInput +{Right}
    return
}
q::
{
    if (alt_mode) {
      SendEvent {LWin down}{Left down}{LWin up}{Left up}      
      return
    }
    SendInput ^{Left}
    return
}
+q::
{
    SendInput +^{Left}
    return
}
r::
{
    if (alt_mode) {
      ;; Windows snapping to sides and maximizing
      ;; Make sure to turn off "show what I can snap next to it" in Windows' "multitasking settings"
      KeyWait, r
      KeyWait, r, D T.3
      If (!ErrorLevel)
      {
        ;; CAPS-R x 2 to restore top 4 windows from being snapped to corners
        RestoreFromTopFourToCorners()
      }
      Else 
      {
        ;;  CAPS-R to make top 4 windows (in ALT TAB order) to snap into screen corners in order top left, top right, bottom left, bottom right, preserving ALT TAB order.
        TopFourToCorners()
      }           
      return
    }
    ;; for Ditto
    SendInput {F13}
    return
}
s::
{
    if (alt_mode) {
      switch("s")
      return
    }
    while GetKeyState("s", "P")
    {
      Send {WheelDown}
      Sleep, 45
    }
    return
}
t::
{
    if (alt_mode) {
      if toggle_taskbar := !toggle_taskbar {
         WinHide ahk_class Shell_TrayWnd
      } else {
         WinShow ahk_class Shell_TrayWnd
      }      
      return
    }
    return
}
u::
{
    SendInput {down}{down}{down}{down}{down}
    return
}
+u::
{
    SendInput +{down}+{down}+{down}+{down}+{down}
    return
}
v::
{
    if (alt_mode) {
      switch("v")
      return
    }
}
w::
{
    if (alt_mode) {
      WinMaximize, A      
      return
    }
    SendInput ^{Right}
    return
}
+w::
{
    SendInput +^{Right}
    return
}
x::
{
    if (alt_mode) {
      switch("x")
      return
    }
    SendInput !{Right}
    return
}
+x::
{
    SendInput !^{Right}
    return
}
y::
{
    SendInput ^{Down}
    return
}
z::
{
    if (alt_mode) {
      switch("z")
      return
    }
    SendInput !{Left}
    return
}
+z::
{
    SendInput !^{Left}
    return
}

CapsLock::Suspend Off
~*CapsLock Up::Suspend On
