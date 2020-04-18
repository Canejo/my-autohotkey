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

^!c::
{
    regex := "(Showing results for|Did you mean:|quis dizer:|Exibindo resultados para).*?>(.*?)</a>"
    value := GetSelectedText()
    UrlDownloadToFile % "https://www.google.com.br/search?q=" . value, temp
    FileRead, contents, temp
    FileDelete temp


    if (RegExMatch(contents, regex, match)) {
        StringReplace, clipboard, match2, <b><i>,, All
        StringReplace, clipboard, clipboard, </i></b>,, All
        Send ^v
    } else {
        Send {Right}
    }
    Sleep 500
    Clipboard:=
    return
}