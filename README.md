# Boulder Dash for the Oric by raspberrypioneer Jan 2025

# TODO for v1.0:
- Investigate about making game / timing a bit slower
- Perform a full test of all gameplay, all cave parameters, cave flow incl. bonus and levels
- Change intro cave Z for Arno, BD2,3 and +1
- Build and test other BD caves (Arno, BD2,3 and +1)
- Test on real Oric-1

# Quick check
- Investigate intro tune/music
- Investigate - use different keys, remap? Test if swapping keys down with right is easier on Oric, see https://github.com/Oric-Software-Development-Kit/Keyboard-FullMatrix
- Std + alt charsets are contiguous in memory - maybe one redef load for both? 

# Future considerations:
- Splashscreen in hires
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
