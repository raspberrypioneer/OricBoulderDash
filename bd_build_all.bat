:: Boulder Dash - perform a full build of program, sprites, cave tap files and deploy to OSDK Orictron folder

:: Set version to create caves for
set BDVER=BoulderDash01

:: Set load start addresses
set SPRITEADDR=$b500
set CAVEADDR=$2700

:: Build main program using OSDK
call osdk_config.bat
call %OSDK%\bin\make.bat %OSDKFILE%

:: Copy main program tap file to the tap folder and Oricutron for completeness
copy .\BUILD\%OSDKNAME%.tap .\TAP\%BDVER% /Y
copy .\BUILD\%OSDKNAME%.tap %OSDK%\Oricutron /Y

:: Assemble sprites then create tap file
%OSDK%\Bin\xa.exe spr.s -o .\BUILD\sprites.bin
%OSDK%\bin\header.exe .\BUILD\sprites.bin .\TAP\%BDVER%\SPRITES.tap %SPRITEADDR%

:: Create one large cave file containing all caves A to T with the Z intro cave on the end
cd .\caves_bin\%BDVER%
copy /b A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+S+T+Z CAVES
cd ..\..
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\CAVES .\TAP\%BDVER%\CAVES.tap %CAVEADDR%

:: Copy all tap files to OSDK Orictron folder
copy .\TAP\%BDVER%\*.tap %OSDK%\Oricutron /Y
