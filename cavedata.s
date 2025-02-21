; *************************************************************************************
; cave starting addresses
cave_load_address
cave_addr_low
	.byt $00, $c0, $80, $40, $00, $c0, $80, $40, $00, $c0, $80, $40, $00, $c0, $80, $40, $00, $c0, $80, $40, $00
cave_addr_high
#ifdef full_matrix_keyboard
	.byt $30, $31, $33, $35, $37, $38, $3a, $3c, $3e, $3f, $41, $43, $45, $46, $48, $4a, $4c, $4d, $4f, $51, $53
#else
	.byt $29, $2a, $2c, $2e, $30, $31, $33, $35, $37, $38, $3a, $3c, $3e, $3f, $41, $43, $45, $46, $48, $4a, $4c
#endif

; *************************************************************************************
; cave parameters and map for one cave
;Below is needed to point the program counter to the next page (multiple of 256)
.dsb 256-(*&255)  ;Add another page of bytes

cave_parameter_data                   ; Starts at address 4e40
param_diamond_value
    .byt $0a                          ; Diamond value
param_diamond_extra_value
    .byt $0f                          ; Diamond extra value
param_diamonds_required
    .byt $0c, $0c, $0c, $0c, $0c      ; Diamonds required for each difficulty level x5
param_cave_time
    .byt $96, $6e, $46, $28, $1e      ; Cave time for each difficulty level x5
param_amoeba_magic_wall_time
    .byt $00                          ; Amoeba or Magic Wall time
param_initial_fill_tile
    .byt $01                          ; Initial fill tile - usually dirt, sometimes space
param_random_seeds
    .byt $0a, $0b, $0c, $0d, $0e      ; Random seed for pseudo-random routine for each difficulty level x5
param_tile_probability
    .byt $3c, $32, $09, $00           ; Tile probability for up to four tiles / objects x4
param_tile_for_probability
    .byt $00, $05, $04, $00           ; Tile / object related to the probability x4
param_intermission
    .byt $00                          ; Intermission indicator (0 for normal cave, 1 for intermission / bonus cave)
param_colours
    .byt $05, $01, $07                ; Cave colour scheme x3 colours
param_rockford_start
	.byt $02, $03                     ; Rockford start row and column
param_rockford_end
    .byt $10, $26                     ; Rockford exit row and column
param_slime_permeability
    .byt $00                          ; Slime permeability
param_tile_for_prob_below
    .byt $00, $00, $00, $00           ; Additional tile below the one generated by pseudo-random routine
param_bombs                           ; For homebrew bombs element
    .byt $00                          ; 0 = no bombs, otherwise number of bombs available
param_zero_gravity_time               ; New feature used to control use of gravity (whether rocks/diamonds fall)
    .byt 0                            ; 0 = no zero-gravity time (always gravity/normal), 1-$fe = time until gravity back on, $ff = always zero gravity
param_border_tile                     ; Border tile, for the standard steelwall, set to 3
    .byt $03                          ; Is just applied to the top and bottom rows as the side borders are specified in the cave file
param_future_use
    .byt $00, $00, $00, $00, $00      ; For potential future use (cannot be removed)

cave_map_data  ; 20 x 40 empty cave (BD1 cave A), each byte represents 2 tiles (nibble each)
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $60, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $32, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $2f, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $1f, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $f2, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $23
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $03
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3
	.byt $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f3

; *************************************************************************************
; all caves A to T with the Z intro cave on the end are loaded into memory from this point onwards
; each cave is 448 bytes (48 parameters, 400 map) x 21 caves = 9408 bytes
;Below is needed to point the program counter to the next page (multiple of 256)
.dsb 256-(*&255)  ;Add another page of bytes
all_caves_load_area  ;This address needs to be cave_load_address (high-low)
