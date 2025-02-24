:: Boulder Dash - Deploy to OSDK Orictron folder and run

:: Set file name to copy and run
set BDTAP=BOULDERDASH

:: Copy TAP file to OSDK Orictron folder
copy .\TAP\%BDTAP%.tap %OSDK%\Oricutron /Y

:: Run from OSDK Orictron folder
cd %OSDK%\Oricutron
oricutron.exe -t %BDTAP%.tap
