:: Boulder Dash - perform a full build of program, sprites, cave tap files

:: Set version
set BDVER=BoulderDash01
set BDTAP=BDASH01

:: Set load start addresses
set SPRITEADDR=$b500

:: Set cave load address, use $2300 for single row keyboard, $2400 for full matrix keyboard
set CAVEADDR=$2300
::set CAVEADDR=$2400

:: Build main program using OSDK
call osdk_config.bat
call %OSDK%\bin\make.bat %OSDKFILE%

:: Copy main program tap file to the tap folder
copy .\BUILD\%OSDKNAME%.tap .\TAP\%BDVER% /Y

:: Assemble sprites then create tap file
%OSDK%\bin\xa.exe spr.s -o .\BUILD\sprites.bin
%OSDK%\bin\header.exe .\BUILD\sprites.bin .\TAP\%BDVER%\SPRITES.tap %SPRITEADDR%
%OSDK%\bin\taptap.exe ren .\TAP\%BDVER%\SPRITES.tap SPRITES 0

:: Create one large cave file containing all caves A to T with the Z intro cave on the end
cd .\caves_bin\%BDVER%
copy /b A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+S+T+Z CAVES
cd ..\..
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\CAVES .\TAP\%BDVER%\CAVES.tap %CAVEADDR%
%OSDK%\bin\taptap.exe ren .\TAP\%BDVER%\CAVES.tap CAVES 0

:: For loading as one TAP, combine the game, caves, sprite TAP files (needed for real Oric)
copy /b .\TAP\%BDVER%\BDASH.tap+.\TAP\%BDVER%\CAVES.tap+.\TAP\%BDVER%\SPRITES.tap .\TAP\%BDVER%\%BDTAP%.tap
