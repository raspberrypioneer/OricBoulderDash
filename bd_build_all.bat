:: Boulder Dash - perform a full build of program, sprites, cave tap files and deploy to OSDK Orictron folder

:: Set version to create caves for
SET BDVER=BoulderDash01

:: Build main program using OSDK
CALL osdk_config.bat
CALL %OSDK%\bin\make.bat %OSDKFILE%

:: Copy main program tap file to the tap folder and Oricutron for completeness
copy .\BUILD\%OSDKNAME%.tap .\TAP\%BDVER% /Y
copy .\BUILD\%OSDKNAME%.tap %OSDK%\Oricutron /Y

:: Assemble sprites then create tap file
%OSDK%\Bin\xa.exe spr.s -o .\BUILD\sprites.bin
%OSDK%\bin\header.exe .\BUILD\sprites.bin .\TAP\%BDVER%\SPRITES.tap $b500

:: Create tap files for each cave
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\A .\TAP\%BDVER%\A.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\B .\TAP\%BDVER%\B.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\C .\TAP\%BDVER%\C.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\D .\TAP\%BDVER%\D.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\E .\TAP\%BDVER%\E.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\F .\TAP\%BDVER%\F.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\G .\TAP\%BDVER%\G.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\H .\TAP\%BDVER%\H.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\I .\TAP\%BDVER%\I.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\J .\TAP\%BDVER%\J.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\K .\TAP\%BDVER%\K.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\L .\TAP\%BDVER%\L.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\M .\TAP\%BDVER%\M.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\N .\TAP\%BDVER%\N.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\O .\TAP\%BDVER%\O.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\P .\TAP\%BDVER%\P.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\Q .\TAP\%BDVER%\Q.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\R .\TAP\%BDVER%\R.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\S .\TAP\%BDVER%\S.tap $1e00
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\T .\TAP\%BDVER%\T.tap $1e00
:: ... and the intro cave
%OSDK%\bin\header.exe .\caves_bin\%BDVER%\Z .\TAP\%BDVER%\Z.tap $1e00

:: Copy all tap files to OSDK Orictron folder
copy .\TAP\%BDVER%\*.tap %OSDK%\Oricutron /Y
