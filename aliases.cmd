:: Baed on https://stackoverflow.com/a/21040825/16195169
:: 1. Go to "HKEY_CURRENT_USER\Software\Microsoft\Command Processor"
::    in regedit.
:: 2. Create a string value by the name "AutoRun",
::    set the value to be the location of this file.
@echo off

:: Start in home directory if nothing else is specified
:: Based on https://stackoverflow.com/a/4900046/16195169

IF /I "%COMSPEC%"==%CMDCMDLINE% (cd /D %USERPROFILE%)

:: Alacritty will start in one of these when launched from the start menu and
:: PowerToys run respectively, these are unlikely intentional start directories
IF /I "%cd%"=="C:\Windows\system32" (cd /D %USERPROFILE%)
IF /I "%cd%"=="C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Alacritty" (cd /D %USERPROFILE%)

:: Util

DOSKEY $=$*
DOSKEY ls=eza --icons -a $*
DOSKEY ll=eza --icons -la $*
DOSKEY mv=wsl mv $*
DOSKEY rm=wsl rm $*
DOSKEY cat=bat -p $*

:: Git

DOSKEY gap=git add -p $*
DOSKEY st=git status $*
DOSKEY cm=git commit $*
DOSKEY am=git commit --amend $*
DOSKEY amn=git commit --amend --no-edit $*
DOSKEY push=git push $*
DOSKEY diff=git diff $*
