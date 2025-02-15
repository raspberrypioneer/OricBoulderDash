:: Boulder Dash - Deploy to OSDK Orictron folder and run

:: Set version
set BDVER=BoulderDash01
set BDTAP=BDASH01

:: Copy TAP file to OSDK Orictron folder
copy .\TAP\%BDVER%\%BDTAP%.tap %OSDK%\Oricutron /Y

:: Run from OSDK Orictron folder
cd %OSDK%\Oricutron
oricutron.exe -t %BDTAP%.tap
