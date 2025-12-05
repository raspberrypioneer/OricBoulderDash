:: Boulder Dash - perform a full build of program, sprites, cave tap files of all versions of the game combined into one tap file
@echo off

:: Set load start addresses
set SPRITEADDR=$b500

:: Control creation of splash screen tap (set to Y or N)
set MAKESPLASH=N

:: Control creation of cave file taps (set to Y or N)
set MAKECAVES=N

:: Set cave load address, use $3800 for single row keyboard, $3900 for full matrix keyboard
set CAVEADDR=$3800
::set CAVEADDR=$3900

:: Build main program using OSDK (game engine) and copy tap file to the tap folder
call osdk_config.bat
call %OSDK%\bin\make.bat %OSDKFILE%
copy .\BUILD\%OSDKNAME%.tap .\tap /Y >nul
echo Created game engine

:: Assemble sprites then create tap file
%OSDK%\bin\xa.exe spr.s -o .\BUILD\sprites.bin
%OSDK%\bin\header.exe .\BUILD\sprites.bin .\tap\SPRITES.tap %SPRITEADDR% >nul
%OSDK%\bin\taptap.exe ren .\tap\SPRITES.tap SPRITES 0
echo Created sprites

:: Create splash screen as a tap file
if "%MAKESPLASH%"=="Y" (  
%OSDK%\bin\pictconv.exe -o2 -f6 .\docs\BDsplash.png .\BUILD\BSPLASH
%OSDK%\bin\header.exe .\BUILD\BSPLASH .\tap\BSPLASH.tap $a000
%OSDK%\bin\taptap.exe ren .\tap\BSPLASH.tap BSPLASH 0
echo Created splash screen
)

:: Create tap file containing the caves of each version
if "%MAKECAVES%"=="Y" (  
set BDVER=BoulderDash01
set BDTAP=B1CAVES
call :create_tap_file_for_version

set BDVER=BoulderDash02
set BDTAP=B2CAVES
call :create_tap_file_for_version

set BDVER=BoulderDash03
set BDTAP=B3CAVES
call :create_tap_file_for_version

set BDVER=BoulderDashP1
set BDTAP=P1CAVES
call :create_tap_file_for_version

set BDVER=ArnoDash01
set BDTAP=A1CAVES
call :create_tap_file_for_version

set BDVER=ArnoDash02
set BDTAP=A2CAVES
call :create_tap_file_for_version

set BDVER=BoulderBonus
set BDTAP=BBCAVES
call :create_tap_file_for_version
)

goto :create_combined_tap_file

:: Subroutine to create one large cave file containing all caves A to T with the Z intro cave on the end for a given version
:create_tap_file_for_version
cd .\caves_bin\%BDVER%_Oric
copy /b A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+S+T+Z ..\..\BUILD\CAVES >nul
cd ..\..
%OSDK%\bin\header.exe .\BUILD\CAVES .\tap\%BDTAP%.tap %CAVEADDR% >nul
%OSDK%\bin\taptap.exe ren .\tap\%BDTAP%.tap %BDTAP% 0
echo Created cave file from %BDVER% called %BDTAP%
exit /B

:: For loading as one tap, combine the game, caves, sprite tap files (needed for real Oric)
:: The order of the tap files is important, the program does not rewind the tape!
:create_combined_tap_file
cd .\tap
copy /b BDASH.tap+BSPLASH.tap+B1CAVES.tap+B2CAVES.tap+B3CAVES.tap+P1CAVES.tap+A1CAVES.tap+A2CAVES.tap+BBCAVES.tap+SPRITES.tap BOULDERDASH.tap >nul
cd ..\..
echo Created full game BOULDERDASH.tap, combining all tap files
