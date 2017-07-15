#UseHook
#IfWinActive, SAI

toolType := 0
isEraser := 0
numTools := 5

SelectTool(ByRef toolType, ByRef isEraser)
{
    if (isEraser = 1)
    {
        Send, e
    }
    else
    {
        Send, %toolType%
    }
}

Numpad0::Send, ^s ;Save

; ---- Undo / Redo ----
Numpad1::Send, ^z                ;Undo
~NumpadEnter & Numpad1::Send, ^y ;Redo
~Enter & Numpad1::Send, ^y ;Redo

; ---- Zoom In/Out ----
Numpad2::Send, z                 ;ZoomIn
~NumpadEnter & Numpad2::Send, +z ;ZoomOut
~Enter & Numpad2::Send, +z       ;ZoomOut

; ---- Rotate Canvas ----
Numpad3::Send, r
~Enter & Numpad3::Send, +r
~NumpadEnter & Numpad3::Send, +r

; ---- Select Tool ----
Numpad4::
    if (isEraser == 0)
    {
        toolType := Mod(toolType + numTools - 1, numTools)
    }
    isEraser := 0
    SelectTool(toolType, isEraser)
    Return
Numpad5::
    if (isEraser == 0)
    {
        toolType := Mod(toolType + 1, numTools)
    }
    isEraser := 0
    SelectTool(toolType, isEraser)
    Return

; ---- Eraser ----
Numpad6::
    isEraser := Mod(isEraser + 1, 2)
    SelectTool(toolType, isEraser)
    Return

; ---- Get Color ----
Numpad7::i                ;GetColorFromCanvas
~Enter & Numpad7::j       ;GetColorFromLayer
~NumpadEnter & Numpad7::j ;GetColorFromLayer

; ---- Reverse ----
NumpadAdd::Send, H

; ---- Remove Selection Area ----
NumpadSub::^d

; ---- Adjust Brush Size ----
NumpadDiv::[
NumpadMult::]

; ---- Move Picture ----
NumpadDot::Control

; ---- Move View ----
Enter::Space
NumpadEnter::Space

; ---- Disabled ----
Numpad8::
Numpad9::