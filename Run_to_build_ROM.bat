@ECHO OFF
set name=Bad_Boyz_Sprint_ONE_M8_L_Sense_7

for /f "tokens=1-8 delims=.:/-, " %%i in ('echo exit^|cmd /q /k"prompt $D $T"') do (
   for /f "tokens=2-4 delims=/-,() skip=1" %%a in ('echo.^|date') do (
set dow=%%i
set mm=%%j
set dd=%%k
set yy=%date:~12,2%
set hh=%%m
set min=%%n
set sec=%%o
set hsec=%%p
)
)

if %hh%==0 set hh=12
if %hh%==1 set hh=01
if %hh%==2 set hh=02
if %hh%==3 set hh=03
if %hh%==4 set hh=04
if %hh%==5 set hh=05
if %hh%==6 set hh=06
if %hh%==7 set hh=07
if %hh%==8 set hh=08
if %hh%==9 set hh=09

ECHO.
ECHO BUILDING NEW BadBoyz ROM...
7z a -tzip %name%.zip -i!system\* -i!data\* -i!supersu\* -i!META-INF\* -i!boot.img > nul
ECHO.
set timestamp=%mm%.%dd%.%yy%@%hh%_%min%
ren %name%.zip %name%_%timestamp%.zip
move %name%_%timestamp%.zip ROM/%name%_%timestamp%.zip
IF EXIST ROM/"%name%_%timestamp%.zip" (ECHO ROM HAS BEEN CREATED IN THE ROM FOLDER! ENJOY YOUR BADBOYZ ROM!) ELSE (ECHO ERROR MAKING .ZIP!)
ECHO.
pause