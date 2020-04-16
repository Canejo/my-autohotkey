#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GetSelectedText() {
    tmp = %ClipboardAll%
    Clipboard := ""
    Send, ^c
    ClipWait, 0, 1
    selection = %Clipboard%
    Clipboard = %tmp%
    return selection
}

^+g::
{
    value := GetSelectedText()
    Run, http://www.google.com/search?q=%value%
    Return
}

^+u::
{
    value := GetSelectedText()
    StringUpper, upperValue, value
    Send, %upperValue%
    return
}

^u::
{
    value := GetSelectedText()
    StringLower, lowerValue, value
    Send, %lowerValue%
    RETURN
}
