# Boulder Dash for the Oric by raspberrypioneer Jan 2025

# TODO for v1.0:
- Test on real Oric-1, including alternate keys
- Perform a full test of all gameplay, all cave parameters, cave flow incl. bonus and levels
- Test Arno, BD1,2,3 and +1

# Future considerations:
- Splashscreen in hires
- Investigate intro tune/music
- Can colours be applied to tiles, maybe use inverse colours? Setting ink/paper for screen gets cleared when drawing grid
- Investigate - Joystick
- Consider adding 2 player, high score, demo mode

# Switching between Atmos and Oric-1
- main.s and keyboard.s: find and change below
`#define rom_v1_1 ; Using rom v1.1 (Atmos), comment this line out for rom v1.0 (Oric-1)`

- oricutron.cfg (part of osdk oricutron emulator): find and change below
`; Type of machine to emulate (atmos, oric1, oric1-16k, telestrat, pravetz)`
`machine = atmos`
`;machine = oric1`

# Switching between single row and full matrix keyboard
- Amend osdk_config.bat, comment / uncomment keyboard requirement
- Amend main.s, comment / uncomment #define full_matrix_keyboard
- Amend bd_build_all.bat, comment / uncomment CAVEADDR requirement
- Run bd_build_all.bat to compile and create caves.tap with correct load address
