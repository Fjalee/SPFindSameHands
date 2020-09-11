#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

inputFolder := "C:\findSameHandsInput"
hand := []

;fix 
;final message
;input so that can input from folders a and b

\::
    timesA := 0
    timesB := 0
    createInputFoldersIfNotExists(inputFolder)

    MsgBox, After pressing OK the conversion will begin...
    Loop Files, %inputFolder%\a\*.txt
    { 
        timesA++

        tempFunc("a", A_LoopFileName)
    }
    Loop Files, %inputFolder%\b\*.txt
    {
        timesB++

        tempFunc("b", A_LoopFileName)
    }
    MsgBox, read %timesA% files in%inputFolder%\a`nread %timesB% files in %inputFolder%\b`ncreated 

return

ESC::
	ExitApp
return

createInputFoldersIfNotExists(fileDir){
    if !FileExist(fileDir){
        FileCreateDir, %fileDir%
        FileCreateDir, %fileDir%\a
        FileCreateDir, %fileDir%\b
        MsgBox, created directory %fileDir%`n and folders a and b in the directory`nEXITING SCRIPT

        ExitApp
    }
}

input(fileDir){
    FileRead, inputString, %fileDir%
    return inputString
}

tempFunc(a_or_b, loopFileName){
    global inputFolder
    fileDir = %inputFolder%\%a_or_b%\%loopFileName%
    inputString := input(fileDir)
    MsgBox, % inputString
}









;fixxx
rewriteFile(fileDir, newText){
    FileDelete, %fileDir%
    FileAppend, %newText%, %fileDir%
}

