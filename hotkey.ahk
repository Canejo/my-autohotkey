#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;HotKey CTRL + J escreve o texto 'My First Script'
;^j::
;Send, My First Script
;HotString fwt + TAB escreve o texto 'Free the whales'
::cddev::cd C:\Users\fcane\Documents\GitHub{Enter}
return

^+g::
{
    Send, ^c
    Sleep 75
    Run, http://www.google.com/search?q=%clipboard%
    Return
}

GetSelectedText() {
    tmp = %ClipboardAll%
    Clipboard := ""
    Send, ^c
    ClipWait, 0, 1
    selection = %Clipboard%
    Clipboard = %tmp%
    return selection
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
