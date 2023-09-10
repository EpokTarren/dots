:: Baed on https://stackoverflow.com/a/21040825/16195169
:: 1. Go to "HKEY_CURRENT_USER\Software\Microsoft\Command Processor"
::    in regedit.
:: 2. Create a string value by the name "AutoRun",
::    set the value to be the location of this file.
@echo off

:: Start in home directory if nothing else is specified
:: Based on https://stackoverflow.com/a/4900046/16195169

IF /I x"%COMSPEC%"==x%CMDCMDLINE% (cd /D %USERPROFILE%)
IF /I x"%COMSPEC%"==x"C:\Windows\system32\cmd.exe" (cd /D %USERPROFILE%)

:: Util

DOSKEY $=$*
DOSKEY ls=wsl ls $*
DOSKEY mv=wsl mv $*
DOSKEY rm=wsl rm $*

:: Git

DOSKEY gap=git add -p $*
DOSKEY st=git status
DOSKEY cm=git commit $*
DOSKEY am=git commit --amend $*
DOSKEY amn=git commit --amend --no-edit $*
