; *************************************************************************************
; sprite addresses
;
sprite_addresses_low
    .byt <sprite_addr_space
    .byt <sprite_addr_boulder1
    .byt <sprite_addr_bubble
    .byt <sprite_addr_diamond1
    .byt <sprite_addr_diamond2
    .byt <sprite_addr_diamond3
    .byt <sprite_addr_diamond4
    .byt <sprite_addr_titanium_wall1
    .byt <sprite_addr_titanium_wall2
    .byt <sprite_addr_box
    .byt <sprite_addr_wall1
    .byt <sprite_addr_wall2
    .byt <sprite_addr_explosion1
    .byt <sprite_addr_explosion2
    .byt <sprite_addr_explosion3
    .byt <sprite_addr_explosion4
    .byt <sprite_addr_magic_wall1
    .byt <sprite_addr_magic_wall2
    .byt <sprite_addr_magic_wall3
    .byt <sprite_addr_magic_wall4
    .byt <sprite_addr_amoeba1
    .byt <sprite_addr_amoeba2
    .byt <sprite_addr_butterfly1
    .byt <sprite_addr_butterfly2
    .byt <sprite_addr_butterfly3
    .byt <sprite_addr_firefly1
    .byt <sprite_addr_firefly2
    .byt <sprite_addr_firefly3
    .byt <sprite_addr_firefly4
    .byt <sprite_addr_earth1
    .byt <sprite_addr_earth2
    .byt <sprite_addr_pathway
    .byt <sprite_addr_rockford_blinking1
    .byt <sprite_addr_rockford_blinking2
    .byt <sprite_addr_rockford_blinking3
    .byt <sprite_addr_rockford_winking1
    .byt <sprite_addr_rockford_winking2
    .byt <sprite_addr_rockford_moving_down1
    .byt <sprite_addr_rockford_moving_down2
    .byt <sprite_addr_rockford_moving_down3
    .byt <sprite_addr_rockford_moving_up1
    .byt <sprite_addr_rockford_moving_up2
    .byt <sprite_addr_rockford_moving_left1
    .byt <sprite_addr_rockford_moving_left2
    .byt <sprite_addr_rockford_moving_left3
    .byt <sprite_addr_rockford_moving_left4
    .byt <sprite_addr_rockford_moving_right1
    .byt <sprite_addr_rockford_moving_right2
    .byt <sprite_addr_rockford_moving_right3
    .byt <sprite_addr_rockford_moving_right4
    .byt <sprite_addr_bomb
    .byt <sprite_addr_bomb3
    .byt <sprite_addr_bomb2
    .byt <sprite_addr_bomb1
    .byt <sprite_addr_boulder2

sprite_addresses_high
    .byt >sprite_addr_space
    .byt >sprite_addr_boulder1
    .byt >sprite_addr_bubble
    .byt >sprite_addr_diamond1
    .byt >sprite_addr_diamond2
    .byt >sprite_addr_diamond3
    .byt >sprite_addr_diamond4
    .byt >sprite_addr_titanium_wall1
    .byt >sprite_addr_titanium_wall2
    .byt >sprite_addr_box
    .byt >sprite_addr_wall1
    .byt >sprite_addr_wall2
    .byt >sprite_addr_explosion1
    .byt >sprite_addr_explosion2
    .byt >sprite_addr_explosion3
    .byt >sprite_addr_explosion4
    .byt >sprite_addr_magic_wall1
    .byt >sprite_addr_magic_wall2
    .byt >sprite_addr_magic_wall3
    .byt >sprite_addr_magic_wall4
    .byt >sprite_addr_amoeba1
    .byt >sprite_addr_amoeba2
    .byt >sprite_addr_butterfly1
    .byt >sprite_addr_butterfly2
    .byt >sprite_addr_butterfly3
    .byt >sprite_addr_firefly1
    .byt >sprite_addr_firefly2
    .byt >sprite_addr_firefly3
    .byt >sprite_addr_firefly4
    .byt >sprite_addr_earth1
    .byt >sprite_addr_earth2
    .byt >sprite_addr_pathway
    .byt >sprite_addr_rockford_blinking1
    .byt >sprite_addr_rockford_blinking2
    .byt >sprite_addr_rockford_blinking3
    .byt >sprite_addr_rockford_winking1
    .byt >sprite_addr_rockford_winking2
    .byt >sprite_addr_rockford_moving_down1
    .byt >sprite_addr_rockford_moving_down2
    .byt >sprite_addr_rockford_moving_down3
    .byt >sprite_addr_rockford_moving_up1
    .byt >sprite_addr_rockford_moving_up2
    .byt >sprite_addr_rockford_moving_left1
    .byt >sprite_addr_rockford_moving_left2
    .byt >sprite_addr_rockford_moving_left3
    .byt >sprite_addr_rockford_moving_left4
    .byt >sprite_addr_rockford_moving_right1
    .byt >sprite_addr_rockford_moving_right2
    .byt >sprite_addr_rockford_moving_right3
    .byt >sprite_addr_rockford_moving_right4
    .byt >sprite_addr_bomb
    .byt >sprite_addr_bomb3
    .byt >sprite_addr_bomb2
    .byt >sprite_addr_bomb1
    .byt >sprite_addr_boulder2

; *************************************************************************************
; Remapped characters for each sprite
;

sprite_addr_space  ;all space characters, not remapped
	.byt 32, 32, 32, 32

sprite_addr_earth1
sprite_addr_earth2
	.byt "!", 34, "#", "$"  ;34 is "

sprite_addr_wall1
sprite_addr_wall2
sprite_addr_magic_wall2
sprite_addr_magic_wall4
;	.byt "%", "&", "'", "("
	.byt 37+128, 38+128, 39+128, 40+128  ;invert sprite_addr_wall1

sprite_addr_magic_wall1
sprite_addr_magic_wall3
;	.byt 37+128, 38+128, 39+128, 40+128  ;invert sprite_addr_wall1
	.byt "%", "&", "'", "("

sprite_addr_titanium_wall1  ;reuse characters
sprite_addr_titanium_wall2
    .byt ")", ")", ")", ")"

sprite_addr_diamond1
sprite_addr_diamond3
    .byt "*", "+", ",", "-"
sprite_addr_diamond2
sprite_addr_diamond4
	.byt 42+128, 43+128, 44+128, 45+128  ;invert sprite_addr_diamond1

sprite_addr_boulder1
    .byt ".", "/", "0", "1"
sprite_addr_boulder2
    .byt 46+128, 47+128, 48+128, 49+128  ;invert sprite_addr_boulder1

sprite_addr_firefly1
sprite_addr_firefly2
    .byt "2", "3", "4", "5"
sprite_addr_firefly3
sprite_addr_firefly4
    .byt 50+128, 51+128, 52+128, 53+128  ;invert sprite_addr_firefly1

sprite_addr_amoeba1
    .byt "6"+128, "7"+128, "8"+128, "9"+128
sprite_addr_amoeba2
    .byt ":"+128, ";"+128, "<"+128, "="+128

sprite_addr_box
	.byt 32+128, 32+128, 32+128, 32+128  ;invert sprite_addr_space

sprite_addr_explosion1
    .byt ">", "?", "@", "A"
sprite_addr_explosion2
    .byt "B", "C", "D", "E"
sprite_addr_explosion3
    .byt "F", "G", "H", "I"
sprite_addr_explosion4
    .byt "J", "K", "L", "M"

sprite_addr_butterfly1
    .byt "N", "O", "P", "Q"
sprite_addr_butterfly2
    .byt "R", "S", "T", "U"
sprite_addr_butterfly3
    .byt "V", "W", "X", "Y"

sprite_addr_bubble
    .byt "Z", "[", 92, "]"  ;92 is \

sprite_addr_rockford_blinking1  ;aka 'normal' Rockford
    .byt "^", "_", "`", "a"
sprite_addr_rockford_blinking2  ;eyes blink
    .byt "b", "c", "`", "a"
sprite_addr_rockford_blinking3  ;eyes close
    .byt "d", "e", "`", "a"
sprite_addr_rockford_winking1   ;right eye blink
    .byt "^", "c", "`", "a"
sprite_addr_rockford_winking2   ;right eye close
    .byt "^", "e", "`", "a"
sprite_addr_rockford_moving_down1  ;aka wait 1 - fold arms
    .byt "^", "_", "f", "g"
sprite_addr_rockford_moving_down2  ;aka wait 2 - fold arms, tap foot
    .byt "^", "_", "h", "g"
sprite_addr_rockford_moving_down3  ;aka wait 3 - eyes blink, fold arms
    .byt "b", "c", "f", "g"
sprite_addr_rockford_moving_up1  ;aka wait 4 - eyes close, tap foot
    .byt "d", "e", "h", "g"
sprite_addr_rockford_moving_up2  ;aka wait 5 - eyes close, fold arms
    .byt "d", "e", "f", "g"
sprite_addr_rockford_moving_left1  ;head left, legs full
    .byt "i", "j", "k", "l"
sprite_addr_rockford_moving_left2  ;head left, legs part
    .byt "i", "j", "m", "n"
sprite_addr_rockford_moving_left3  ;head left, legs part-stand
    .byt "i", "j", "o", "p"
sprite_addr_rockford_moving_left4  ;head left, legs stand
    .byt "i", "j", "o", "q"
sprite_addr_rockford_moving_right1  ;head right, legs stand
    .byt "r", "s", "t", "u"
sprite_addr_rockford_moving_right2  ;head right, legs part-stand
    .byt "r", "s", "v", "u"
sprite_addr_rockford_moving_right3  ;head right, legs part
    .byt "r", "s", "w", "x"
sprite_addr_rockford_moving_right4  ;head right, legs full
    .byt "r", "s", "y", "z"

sprite_addr_bomb
sprite_addr_bomb2
    .byt "{", "|", "}", "~"
sprite_addr_bomb1
sprite_addr_bomb3
    .byt 123+128, 124+128, 125+128, 126+128  ;invert sprite_addr_bomb

sprite_addr_pathway
    .byt 127, 127, 127, 127

; *************************************************************************************
; Sprite handler routine addresses
;
handler_table_low
	.byt <handler_basics
	.byt <handler_basics
	.byt <handler_basics
	.byt <handler_basics
	.byt 0
	.byt 0
    .byt <handler_firefly_or_butterfly
    .byt <handler_amoeba
    .byt <handler_rockford_intro_or_exit
slime_handler_low
    .byt <handler_slime
    .byt <handler_rockford_intro_or_exit
    .byt 0
    .byt <handler_growing_wall
    .byt <handler_magic_wall
    .byt <handler_firefly_or_butterfly
rockford_handler_low
    .byt <handler_rockford

handler_table_high
	.byt >handler_basics
	.byt >handler_basics
	.byt >handler_basics
	.byt >handler_basics
	.byt 0
	.byt 0
    .byt >handler_firefly_or_butterfly
    .byt >handler_amoeba
    .byt >handler_rockford_intro_or_exit
slime_handler_high
    .byt >handler_slime
    .byt >handler_rockford_intro_or_exit
    .byt 0
    .byt >handler_growing_wall
    .byt >handler_magic_wall
    .byt >handler_firefly_or_butterfly
rockford_handler_high
	.byt >handler_rockford

; *************************************************************************************
; Mapping table to convert a cell type 0-$7f into a sprite number
; The sprite number points to the sprite address to use (see above)
; By changing the entries of this table on the fly, this table allows the sprite to
; animate without the underlying cell type needing to change.
;
cell_type_to_sprite
    .byt sprite_space                                                                  ; cell type $00 = map_space
    .byt sprite_earth2                                                                 ; cell type $01 = map_earth
    .byt sprite_wall2                                                                  ; cell type $02 = map_wall
    .byt sprite_titanium_wall2                                                         ; cell type $03 = map_titanium_wall
    .byt sprite_diamond1                                                               ; cell type $04 = map_diamond
    .byt sprite_boulder1                                                               ; cell type $05 = map_rock
    .byt sprite_firefly4                                                               ; cell type $06 = map_firefly
amoeba_animated_sprite0
    .byt sprite_amoeba1                                                                ; cell type $07 = map_amoeba
    .byt sprite_titanium_wall2                                                         ; cell type $03 = map_titanium_wall
slime_animated_sprite0
    .byt sprite_amoeba1                                                                ; cell type $09 = map_slime
    .byt $4c                                                                           ; cell type $0A = map_explosion
    .byt sprite_bomb1                                                                  ; cell type $0B = map_bomb
    .byt sprite_magic_wall1                                                            ; cell type $0C = map_growing_wall
    .byt sprite_wall2                                                                  ; cell type $0D = map_magic_wall
    .byt sprite_butterfly1                                                             ; cell type $0E = map_butterfly
rockford_sprite
    .byt sprite_rockford_tapping_foot1                                                 ; cell type $0F = map_rockford
    .byt sprite_explosion4                                                             ; cell type $10 = map_space | map_anim_state1
    .byt sprite_explosion4                                                             ; cell type $11 = map_earth | map_anim_state1
    .byt sprite_explosion4                                                             ; cell type $12 = map_wall | map_anim_state1
    .byt sprite_explosion4                                                             ; cell type $13 = map_large_explosion_state1
    .byt sprite_rockford_winking2                                                      ; cell type $14 = map_diamond | map_anim_state1
    .byt sprite_boulder2                                                               ; cell type $15 = map_rock | map_anim_state1
    .byt sprite_firefly4                                                               ; cell type $16 = map_firefly | map_anim_state1
    .byt sprite_amoeba1                                                                ; cell type $17 = map_amoeba | map_anim_state1
    .byt sprite_box                                                                    ; cell type $18 = map_active_exit
    .byt sprite_amoeba1                                                                ; cell type $19 = map_slime | map_anim_state1
    .byt sprite_firefly4                                                               ; cell type $1A = map_explosion | map_anim_state1
    .byt sprite_bomb2                                                                  ; cell type $1B = map_bomb | map_anim_state1
    .byt sprite_magic_wall1                                                            ; cell type $1C = map_growing_wall | map_anim_state1
    .byt sprite_magic_wall1                                                            ; cell type $1D = map_magic_wall | map_anim_state1
    .byt sprite_butterfly1                                                             ; cell type $1E = map_butterfly | map_anim_state1
    .byt sprite_rockford_moving_left3                                                  ; cell type $1F = map_rockford | map_anim_state1
    .byt sprite_explosion3                                                             ; cell type $20 = map_space | map_anim_state2
    .byt sprite_explosion3                                                             ; cell type $21 = map_earth | map_anim_state2
    .byt sprite_explosion3                                                             ; cell type $22 = map_wall | map_anim_state2
    .byt sprite_explosion3                                                             ; cell type $23 = map_large_explosion_state2
    .byt sprite_diamond2                                                               ; cell type $24 = map_diamond | map_anim_state2
    .byt sprite_bubble                                                                 ; cell type $25 = map_rock | map_anim_state2
    .byt sprite_firefly4                                                               ; cell type $26 = map_firefly | map_anim_state2
    .byt sprite_amoeba2                                                                ; cell type $27 = map_amoeba | map_anim_state2
    .byt sprite_firefly2                                                               ; cell type $28 = map_rockford_appearing_or_end_position | map_anim_state2
    .byt sprite_amoeba2                                                                ; cell type $29 = map_slime | map_anim_state2
    .byt $46                                                                           ; cell type $2A = map_explosion | map_anim_state2
    .byt sprite_bomb3                                                                  ; cell type $2B = map_bomb | map_anim_state2
    .byt sprite_magic_wall1                                                            ; cell type $2C = map_growing_wall | map_anim_state2
    .byt sprite_wall2                                                                  ; cell type $2D = map_magic_wall | map_anim_state2
    .byt sprite_butterfly1                                                             ; cell type $2E = map_butterfly | map_anim_state2
    .byt sprite_rockford_moving_right4                                                 ; cell type $2F = map_rockford | map_anim_state2
    .byt sprite_explosion2                                                             ; cell type $30 = map_space | map_anim_state3
    .byt sprite_explosion2                                                             ; cell type $31 = map_earth | map_anim_state3
    .byt sprite_explosion2                                                             ; cell type $32 = map_wall | map_anim_state3
    .byt sprite_explosion2                                                             ; cell type $33 = map_large_explosion_state3
    .byt sprite_diamond2                                                               ; cell type $34 = map_diamond | map_anim_state3
    .byt sprite_boulder1                                                               ; cell type $35 = map_rock | map_anim_state3
    .byt sprite_firefly4                                                               ; cell type $36 = map_firefly | map_anim_state3
    .byt sprite_amoeba2                                                                ; cell type $37 = map_amoeba | map_anim_state3
    .byt sprite_firefly2                                                               ; cell type $38 = map_rockford_appearing_or_end_position | map_anim_state3
    .byt sprite_amoeba2                                                                ; cell type $39 = map_slime | map_anim_state3
    .byt sprite_firefly4                                                               ; cell type $3A = map_explosion | map_anim_state3
    .byt sprite_bomb4                                                                  ; cell type $3B = map_bomb | map_anim_state3
    .byt sprite_magic_wall1                                                            ; cell type $3C = map_growing_wall | map_anim_state3
    .byt sprite_wall2                                                                  ; cell type $3D = map_magic_wall | map_anim_state3
    .byt sprite_butterfly1                                                             ; cell type $3E = map_butterfly | map_anim_state3
    .byt sprite_rockford_tapping_foot4                                                 ; cell type $3F = map_rockford | map_anim_state3
    .byt sprite_explosion1                                                             ; cell type $40 = map_space | map_anim_state4
    .byt sprite_explosion1                                                             ; cell type $41 = map_earth | map_anim_state4
    .byt sprite_explosion1                                                             ; cell type $42 = map_wall | map_anim_state4
    .byt sprite_explosion1                                                             ; cell type $43 = map_titanium_wall | map_anim_state4
    .byt sprite_diamond1                                                               ; cell type $44 = map_diamond | map_anim_state4
    .byt sprite_boulder1                                                               ; cell type $45 = map_rock | map_anim_state4
    .byt sprite_explosion1                                                             ; cell type $46 = map_start_large_explosion
amoeba_animated_sprite4
    .byt sprite_amoeba2                                                                ; cell type $47 = map_amoeba | map_anim_state4
    .byt sprite_rockford_moving_right4                                                 ; cell type $48 = map_rockford_appearing_or_end_position | map_anim_state4
slime_animated_sprite1
    .byt sprite_amoeba2                                                                ; cell type $49 = map_slime | map_anim_state4
    .byt sprite_firefly4                                                               ; cell type $4A = map_explosion | map_anim_state4
    .byt sprite_bomb1                                                                  ; cell type $4B = map_bomb | map_anim_state4
    .byt sprite_magic_wall1                                                            ; cell type $4D = map_growing_wall | map_anim_state4
    .byt sprite_boulder1                                                               ; cell type $4C = map_magic_wall | map_anim_state4
    .byt sprite_butterfly2                                                             ; cell type $4E = map_butterfly | map_anim_state4
    .byt sprite_rockford_moving_right3                                                 ; cell type $4F = map_rockford | map_anim_state4
    .byt sprite_explosion2                                                             ; cell type $50 = map_space | map_anim_state5
    .byt sprite_explosion2                                                             ; cell type $51 = map_earth | map_anim_state5
    .byt sprite_explosion2                                                             ; cell type $52 = map_wall | map_anim_state5
    .byt sprite_explosion2                                                             ; cell type $53 = map_titanium_wall | map_anim_state5
    .byt sprite_rockford_winking2                                                      ; cell type $54 = map_diamond | map_anim_state5
    .byt sprite_boulder1                                                               ; cell type $55 = map_rock | map_anim_state5
    .byt sprite_firefly2                                                               ; cell type $56 = map_firefly | map_anim_state5
    .byt sprite_amoeba1                                                                ; cell type $57 = map_amoeba | map_anim_state5
    .byt sprite_rockford_moving_right4                                                 ; cell type $58 = map_rockford_appearing_or_end_position | map_anim_state5
    .byt sprite_amoeba1                                                                ; cell type $59 = map_slime | map_anim_state5
    .byt sprite_firefly4                                                               ; cell type $5A = map_explosion | map_anim_state5
    .byt sprite_bomb2                                                                  ; cell type $5B = map_bomb | map_anim_state5
    .byt sprite_magic_wall1                                                            ; cell type $5C = map_growing_wall | map_anim_state5
    .byt sprite_magic_wall2                                                            ; cell type $5D = map_magic_wall | map_anim_state5
    .byt sprite_butterfly2                                                             ; cell type $5E = map_butterfly | map_anim_state5
    .byt sprite_rockford_moving_left2                                                  ; cell type $5F = map_rockford | map_anim_state5
    .byt sprite_explosion3                                                             ; cell type $60 = map_space | map_anim_state6
    .byt sprite_explosion3                                                             ; cell type $61 = map_earth | map_anim_state6
    .byt sprite_explosion3                                                             ; cell type $62 = map_wall | map_anim_state6
    .byt sprite_explosion3                                                             ; cell type $63 = map_titanium_wall | map_anim_state6
    .byt sprite_diamond1                                                               ; cell type $64 = map_diamond | map_anim_state6
    .byt sprite_boulder1                                                               ; cell type $65 = map_rock | map_anim_state6
    .byt sprite_firefly2                                                               ; cell type $66 = map_firefly | map_anim_state6
    .byt sprite_amoeba1                                                                ; cell type $67 = map_amoeba | map_anim_state6
    .byt sprite_rockford_moving_right4                                                 ; cell type $68 = map_rockford_appearing_or_end_position | map_anim_state6
    .byt sprite_amoeba1                                                                ; cell type $69 = map_slime | map_anim_state6
    .byt sprite_firefly4                                                               ; cell type $6A = map_explosion | map_anim_state6
    .byt sprite_bomb3                                                                  ; cell type $6B = map_bomb | map_anim_state6
    .byt sprite_magic_wall1                                                            ; cell type $6C = map_growing_wall | map_anim_state6
    .byt sprite_explosion2                                                             ; cell type $6D = map_magic_wall | map_anim_state6
    .byt sprite_butterfly2                                                             ; cell type $6E = map_butterfly | map_anim_state6
    .byt sprite_rockford_tapping_foot4                                                 ; cell type $6F = map_rockford | map_anim_state6
    .byt sprite_explosion4                                                             ; cell type $70 = map_space | map_anim_state7
    .byt sprite_explosion4                                                             ; cell type $71 = map_earth | map_anim_state7
    .byt sprite_explosion4                                                             ; cell type $72 = map_wall | map_anim_state7
    .byt sprite_explosion4                                                             ; cell type $73 = map_titanium_wall | map_anim_state7
    .byt sprite_diamond1                                                               ; cell type $74 = map_diamond | map_anim_state7
    .byt sprite_boulder1                                                               ; cell type $75 = map_rock | map_anim_state7
    .byt sprite_firefly2                                                               ; cell type $76 = map_firefly | map_anim_state7
    .byt sprite_amoeba2                                                                ; cell type $77 = map_amoeba | map_anim_state7
    .byt sprite_rockford_moving_right4                                                 ; cell type $78 = map_rockford_appearing_or_end_position | map_anim_state7
    .byt sprite_amoeba2                                                                ; cell type $79 = map_slime | map_anim_state7
    .byt sprite_firefly4                                                               ; cell type $7A = map_explosion | map_anim_state7
    .byt sprite_bomb4                                                                  ; cell type $7B = map_bomb | map_anim_state7
    .byt sprite_magic_wall1                                                            ; cell type $7C = map_growing_wall | map_anim_state7
    .byt sprite_explosion1                                                             ; cell type $7D = map_magic_wall | map_anim_state7
    .byt sprite_butterfly2                                                             ; cell type $7E = map_butterfly | map_anim_state7
    .byt sprite_explosion1                                                             ; cell type $7F = map_rockford | map_anim_state7

; *************************************************************************************
; Cell types that animate every tick
; These values are pointers into the cell_type_to_sprite table
;
cell_types_that_always_animate
    .byt                   map_diamond
    .byt map_anim_state4 | map_diamond
    .byt                   map_firefly
    .byt map_anim_state1 | map_firefly
    .byt map_anim_state2 | map_firefly
    .byt map_anim_state3 | map_firefly
exit_cell_type
    .byt                  map_active_exit
    .byt map_anim_state1 | map_magic_wall
    .byt                    map_butterfly
    .byt  map_anim_state1 | map_butterfly
    .byt  map_anim_state2 | map_butterfly
    .byt  map_anim_state3 | map_butterfly
    .byt  map_anim_state2 | map_rockford
    .byt  map_anim_state1 | map_rockford
    .byt  map_slime

; *************************************************************************************
; For animation, points to next sprite to use
;
sprite_to_next_sprite
    .byt 0,0,0
    .byt sprite_diamond2, sprite_diamond3, sprite_diamond4, sprite_diamond1
    .byt 0
    .byt sprite_box, sprite_titanium_wall2
    .byt 0,0
    .byt sprite_explosion1, sprite_explosion2, sprite_explosion3
    .byt 0
    .byt sprite_magic_wall2, sprite_magic_wall3, sprite_magic_wall4, sprite_magic_wall1
    .byt sprite_amoeba1, sprite_amoeba2 
    .byt sprite_butterfly2, sprite_butterfly3, sprite_butterfly1
    .byt sprite_firefly2, sprite_firefly3, sprite_firefly4, sprite_firefly1
    .byt 0,0,0,0,0,0,0,0,0,0,0,0,0
    .byt sprite_rockford_moving_left2, sprite_rockford_moving_left3, sprite_rockford_moving_left4, sprite_rockford_moving_left1
    .byt sprite_rockford_moving_right2, sprite_rockford_moving_right3, sprite_rockford_moving_right4, sprite_rockford_moving_right1

;TODO: some of below is needed, check collision with butterfly
    .byt $32                                                                      ; 1f32: 32          2
    .byt $32                                                                      ; 1f33: 32          2
    .byt sprite_diamond1                                                               ; 1f34: 03          .
    .byt $32                                                                      ; 1f35: 32          2
    .byt $32                                                                      ; 1f36: 32          2
    .byt $0a                                                                           ; 1f37: 0a          .
    .byt $3a                                                                      ; 1f38: 3a          :
    .byt $34                                                                      ; 1f39: 34          4
    .byt $34                                                                      ; 1f3a: 34          4
    .byt sprite_space                                                                  ; 1f3b: 00          .
    .byt $32                                                                      ; 1f3c: 32          2
    .byt $32                                                                      ; 1f3d: 32          2
    .byt $32                                                                      ; 1f3e: 32          2
    .byt sprite_space                                                                  ; 1f3f: 00          .
    .byt $39                                                                      ; 1f40: 39          9
    .byt $39                                                                      ; 1f41: 39          9
    .byt $38                                                                      ; 1f42: 38          8
    .byt $36                                                                      ; 1f43: 36          6
    .byt $39                                                                      ; 1f44: 39          9
    .byt $38                                                                      ; 1f45: 38          8
    .byt 0,0,0,0,0,0
    .byt sprite_space                                                                  ; 1f4c: 00          .
    .byt $33                                                                      ; 1f4d: 33          3
    .byt $3f                                                                  ; 1f4e: 3f          ?
    .byt sprite_space                                                                  ; 1f4f: 00          .
    .byt $35                                                                      ; 1f50: 35          5
    .byt sprite_space                                                                  ; 1f51: 00          .
    .byt 0,0,0
    .byt sprite_space                                                                  ; 1f55: 00          .
    .byt 0
    .byt $3e                                                                  ; 1f57: 3e          >
    .byt $33                                                                      ; 1f58: 33          3
    .byt sprite_space                                                                  ; 1f59: 00          .

    .byt $5a, $5b, $5c, $5d, $5e, $5f,   7, $0a, $16, $64, $2a, $66, $2e,   9, $1e     ; 1f5a: 5a 5b 5c... Z[\
    .byt $69, $6a, $6b, $6c, $6d, $6e, $6f, $70, $71, $72, $73, $74, $75, $76, $77     ; 1f69: 69 6a 6b... ijk
    .byt $78, $79, $7a, $7b, $7c, $7d, $7e, $7f                                        ; 1f78: 78 79 7a... xyz

; *************************************************************************************
; Butterfly/firefly animation table
;
firefly_and_butterfly_cell_values
    .byt (map_unprocessed | map_anim_state3) | map_firefly
    .byt (map_unprocessed | map_anim_state3) | map_butterfly
    .byt (map_unprocessed | map_anim_state0) | map_firefly
    .byt (map_unprocessed | map_anim_state0) | map_butterfly
    .byt (map_unprocessed | map_anim_state1) | map_firefly
    .byt (map_unprocessed | map_anim_state1) | map_butterfly
    .byt (map_unprocessed | map_anim_state2) | map_firefly
    .byt (map_unprocessed | map_anim_state2) | map_butterfly

; *************************************************************************************
; Sprites to use for idle animation of rockford. They are encoded into the nybbles of
; each byte. First it cycles through the bottom nybbles until near the end of the idle
; animation, then cycles through through the top nybbles
;
idle_animation_data
    .byt 16*(sprite_rockford_tapping_foot4-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_tapping_foot3-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_tapping_foot2-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_tapping_foot3-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_tapping_foot4-32) + sprite_rockford_blinking2-32
    .byt 16*(sprite_rockford_tapping_foot1-32) + sprite_rockford_blinking3-32
    .byt 16*(sprite_rockford_tapping_foot2-32) + sprite_rockford_blinking2-32
    .byt 16*(sprite_rockford_tapping_foot1-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_tapping_foot3-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_tapping_foot5-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_tapping_foot5-32) + sprite_rockford_blinking3-32
    .byt 16*(sprite_rockford_tapping_foot3-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_tapping_foot1-32) + sprite_rockford_blinking3-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_blinking2-32) + sprite_rockford_blinking2-32
    .byt 16*(sprite_rockford_blinking3-32) + sprite_rockford_blinking3-32
    .byt 16*(sprite_rockford_blinking2-32) + sprite_rockford_blinking2-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_blinking2-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot5-32
    .byt 16*(sprite_rockford_blinking3-32) + sprite_rockford_tapping_foot3-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_blinking3-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_tapping_foot1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_tapping_foot3-32) + sprite_rockford_tapping_foot5-32
    .byt 16*(sprite_rockford_tapping_foot5-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_tapping_foot3-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_tapping_foot1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_blinking3-32) + sprite_rockford_tapping_foot4-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot2-32
    .byt 16*(sprite_rockford_blinking3-32) + sprite_rockford_tapping_foot3-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_blinking3-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_tapping_foot1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_tapping_foot1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_tapping_foot1-32) + sprite_rockford_tapping_foot5-32
    .byt 16*(sprite_rockford_tapping_foot1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_tapping_foot2-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_tapping_foot5-32) + sprite_rockford_blinking2-32
    .byt 16*(sprite_rockford_tapping_foot2-32) + sprite_rockford_blinking3-32
    .byt 16*(sprite_rockford_tapping_foot5-32) + sprite_rockford_blinking2-32
    .byt 16*(sprite_rockford_tapping_foot2-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_tapping_foot3-32) + sprite_rockford_blinking1-32
    .byt 16*(sprite_rockford_blinking3-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_blinking2-32) + sprite_rockford_tapping_foot2-32
    .byt 16*(sprite_rockford_blinking2-32) + sprite_rockford_tapping_foot5-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot4-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot5-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot2-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot2-32
    .byt 16*(sprite_rockford_blinking1-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_winking1-32) + sprite_rockford_tapping_foot2-32
    .byt 16*(sprite_rockford_winking2-32) + sprite_rockford_tapping_foot1-32
    .byt 16*(sprite_rockford_winking2-32) + sprite_rockford_tapping_foot4-32
    .byt 16*(sprite_rockford_winking2-32) + sprite_rockford_tapping_foot3-32
    .byt 16*(sprite_rockford_winking1-32) + sprite_rockford_tapping_foot2-32
    .byt 16*(sprite_rockford_winking1-32) + sprite_rockford_tapping_foot1-32

; *************************************************************************************
; Determines what the end of an explosion turns into 
; Also see handler_basics
;
explosion_replacements
    .byt map_rockford | map_unprocessed
    .byt map_rockford | map_unprocessed
    .byt map_diamond | map_unprocessed
    .byt map_space

; *************************************************************************************
; Given a cell type, decide what Rockford is allowed to do
;   $ff means Rockford can move onto the cell freely (e.g. space, earth),
;   $0 means no movement possible (e.g. wall), and
;   $1 means move with a push (e.g rock)
;
obstacle_control
    .byt $ff                                                                           ; map_space
    .byt $ff                                                                           ; map_earth
    .byt 0                                                                             ; map_wall
    .byt 0                                                                             ; map_titanium_wall
    .byt $ff                                                                           ; map_diamond
    .byt 1                                                                             ; map_rock
    .byt 0                                                                             ; map_firefly
    .byt 0                                                                             ; map_amoeba
    .byt 0                                                                             ; map_rockford_appearing_or_end_position
    .byt 0                                                                             ; map_slime
    .byt $ff                                                                           ; map_explosion
    .byt 0                                                                             ; map_bomb
    .byt 0                                                                             ; map_growing_wall
    .byt 0                                                                             ; map_magic_wall
    .byt 0                                                                             ; map_butterfly
    .byt 1                                                                             ; map_rockford

; *************************************************************************************
; Given a cell type, decide if a rock/diamond will fall off them
;   0 = rock/diamond won't fall
;   1 = rock/diamond will slip off the cell (where this is space to do so)
;
cell_types_that_rocks_or_diamonds_will_fall_off
    .byt 0                                                                             ; map_space
    .byt 0                                                                             ; map_earth
    .byt 1                                                                             ; map_wall
    .byt 0                                                                             ; map_titanium_wall
    .byt 1                                                                             ; map_diamond
    .byt 1                                                                             ; map_rock
    .byt 0                                                                             ; map_firefly
    .byt 1                                                                             ; map_amoeba
    .byt 0                                                                             ; map_rockford_appearing_or_end_position
    .byt 0                                                                             ; map_slime
    .byt 0                                                                             ; map_explosion
    .byt 0                                                                             ; map_bomb
    .byt 1                                                                             ; map_growing_wall
    .byt 0                                                                             ; map_magic_wall
    .byt 0                                                                             ; map_butterfly
    .byt 0                                                                             ; map_rockford

; *************************************************************************************
; Given a cell type, decide what it turns into when a rock/diamond falls onto it
; 
update_cell_type_when_below_a_falling_rock_or_diamond
    .byt 0                                                                             ; map_space
    .byt 0                                                                             ; map_earth
    .byt 0                                                                             ; map_wall
    .byt 0                                                                             ; map_titanium_wall
    .byt 0                                                                             ; map_diamond
    .byt 0                                                                             ; map_rock
    .byt map_start_large_explosion                                                     ; map_firefly
    .byt 0                                                                             ; map_amoeba
    .byt 0                                                                             ; map_rockford_appearing_or_end_position
    .byt 0                                                                             ; map_slime
    .byt 0                                                                             ; map_explosion
    .byt map_start_large_explosion                                                     ; map_bomb
    .byt 0                                                                             ; map_growing_wall
    .byt map_anim_state3 | map_magic_wall                                              ; map_magic_wall
    .byt map_anim_state4 | map_butterfly                                               ; map_butterfly
    .byt map_anim_state7 | map_rockford                                                ; map_rockford

; *************************************************************************************
; Given a cell type, decide what it turns into when affected by an explosion
;   0 = not affected
;   $ff = Rockford dies
;
cell_types_that_will_turn_into_large_explosion
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_space
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_earth
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_wall
    .byt 0                                                                             ; map_titanium_wall
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_diamond
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_rock
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_firefly
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_amoeba
    .byt 0                                                                             ; map_rockford_appearing_or_end_position
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_slime
    .byt 0                                                                             ; map_explosion
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_bomb
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_growing_wall
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_magic_wall
    .byt map_unprocessed | map_large_explosion_state3                                  ; map_butterfly
    .byt $ff                                                                           ; map_rockford

; *************************************************************************************
; Given a cell type, decide what it turns into when affected by an explosion into diamonds
;   0 = not affected
;   $ff = Rockford dies
;
cell_types_that_will_turn_into_diamonds
    .byt map_unprocessed | map_diamond                                                 ; map_space
    .byt map_unprocessed | map_diamond                                                 ; map_earth
    .byt map_unprocessed | map_diamond                                                 ; map_wall
    .byt 0                                                                             ; map_titanium_wall
    .byt map_unprocessed | map_diamond                                                 ; map_diamond
    .byt map_unprocessed | map_diamond                                                 ; map_rock
    .byt map_unprocessed | map_diamond                                                 ; map_firefly
    .byt map_unprocessed | map_diamond                                                 ; map_amoeba
    .byt 0                                                                             ; map_rockford_appearing_or_end_position
    .byt map_unprocessed | map_diamond                                                 ; map_slime
    .byt 0                                                                             ; map_explosion
    .byt 0                                                                             ; map_bomb
    .byt map_unprocessed | map_diamond                                                 ; map_growing_wall
    .byt map_unprocessed | map_diamond                                                 ; map_magic_wall
    .byt map_unprocessed | map_diamond                                                 ; map_butterfly
    .byt $ff                                                                           ; map_rockford

; *************************************************************************************
; Given a cell type, decide what it turns into when processed by the magic wall
; This just affects rocks/diamonds (rocks become diamonds and visa versa)
;
items_produced_by_the_magic_wall
    .byt 0                                                                             ; map_space
    .byt 0                                                                             ; map_earth
    .byt 0                                                                             ; map_wall
    .byt 0                                                                             ; map_titanium_wall
    .byt map_unprocessed | map_rock                                                    ; map_diamond
    .byt map_unprocessed | map_diamond                                                 ; map_rock
    .byt 0                                                                             ; map_firefly
    .byt 0                                                                             ; map_amoeba
    .byt 0                                                                             ; map_rockford_appearing_or_end_position
    .byt 0                                                                             ; map_slime
    .byt 0                                                                             ; map_explosion
    .byt 0                                                                             ; map_bomb
    .byt 0                                                                             ; map_growing_wall
    .byt 0                                                                             ; map_magic_wall
    .byt 0                                                                             ; map_butterfly
    .byt 0                                                                             ; map_rockford

; *************************************************************************************
; Given a cell type, decide what happens when landing on slime
; Only rocks/diamonds/bombs are allowed through, they don't change
;
items_allowed_through_slime
    .byt 0                                                                             ; map_space
    .byt 0                                                                             ; map_earth
    .byt 0                                                                             ; map_wall
    .byt 0                                                                             ; map_titanium_wall
    .byt map_unprocessed | map_diamond                                                 ; map_diamond
    .byt map_unprocessed | map_rock                                                    ; map_rock
    .byt 0                                                                             ; map_firefly
    .byt 0                                                                             ; map_amoeba
    .byt 0                                                                             ; map_rockford_appearing_or_end_position
    .byt 0                                                                             ; map_slime
    .byt 0                                                                             ; map_explosion
    .byt map_unprocessed | map_bomb                                                    ; map_bomb
    .byt 0                                                                             ; map_growing_wall
    .byt 0                                                                             ; map_magic_wall
    .byt 0                                                                             ; map_butterfly
    .byt 0                                                                             ; map_rockford

; *************************************************************************************
; Direction handling
;
rock_push_directions  ;direction pointer to cell beyond the rock being pushed
    .byt $43, $3f, 0, $c1  ;right, left, up, down. Up can change in game when gravity is on/off

rockford_cell_value_for_direction
    .byt map_unprocessed | map_anim_state2 | map_rockford  ;animation for left
    .byt map_unprocessed | map_anim_state1 | map_rockford  ;animation for right
    .byt 0, 0  ;no animation for up/down - remain as normal Rockford

map_offset_for_direction  ;direction pointer to cells next to Rockford (in $41)
    .byt $40, $42, 1, $81  ;left, right, up, down

neighbour_cell_pointer_from_direction_index  ;direction pointer to surrounding cell reference table (Rockford)
    .byt 5 ;points to cell_right
    .byt 3 ;points to cell_left
    .byt 1 ;points to cell_above
    .byt 7 ;points to cell_below

firefly_neighbour_pointers  ;direction pointer to surrounding cell reference table (butterfly/firefly)
    .byt 3 ;points to cell_left
    .byt 5 ;points to cell_right
    .byt 1 ;points to cell_above
    .byt 1 ;points to cell_above
    .byt 5 ;points to cell_right
    .byt 3 ;points to cell_left
    .byt 7 ;points to cell_below
    .byt 7 ;points to cell_below

firefly_and_butterfly_next_direction_table  ;next direction to consider (butterfly/firefly)
    .byt 2, 3, 4, 5, 6, 7, 0, 1

; *************************************************************************************
cave_play_order
    .byt 1, 2, 3, 16
    .byt 5, 6, 7, 17
    .byt 9, 10, 11, 18
    .byt 13, 14, 15, 19
    .byt 4, 8, 12, 0

; *************************************************************************************
; status bar and messages
;
status_bar_line1
    .byt "*", "+", 32, 32, 32, 32, 32, 32, 32, 32, "{", "|", 32, 32, 32, 32, 32, 32, 32, 32
    .byt 32, 32, 32, 32, 32, 32, "^", "_", 9, 6, 32, 32, 32, "C", "A", "V", "E", 32, "A", "1"

status_bar_line2
    .byt ",", "-", 9, 2, "0", "0", "0", 32, 7, 8, "}", "~", 9, 2, "0", "0", "0", 32, 32, 6
    .byt "0", "0", "0", 32, 7, 8, "`", "a", 9, 2, "0", "0", "0", 32, 32, "0", 32, 32, 32, 32

status_messages
status_message_paused
    .byt 9, 6, 32, 32, 32, 32, "P","A","U","S","E","D", 32, 32, 32, 32, 32, 32
status_message_got_all_diamonds
    .byt 9, 2, "G","O","T", 32, "A","L","L", 32, "D","I","A","M","O","N","D","S"
status_message_no_bombs_left
    .byt 9, 3, "N","O", 32, "B","O","M","B","S", 32, "L","E","F","T", 32, 32, 32
status_message_hurry
    .byt 9, 3, 32, 32, 32, 32, "H","U","R","R","Y", 32, 32, 32, 32, 32, 32, 32
status_message_out_of_time
    .byt 9, 1, 32, "O","U","T", 32, "O","F", 32, "T","I","M","E", 32, 32, 32, 32
status_message_bonus_life
    .byt 9, 6, 32, 32, "B","O","N","U","S", 32, "L","I","F","E", 32, 32, 32, 32
status_message_game_over
    .byt 9, 1, 32, 32, "G","A","M","E", 32, "O","V","E","R", 32, 32, 32, 32, 32

game_title
    .byt 11, 1, 32, "O","R","I","C", 6, "B","O","U","L","D","E","R", 32, "D","A","S","H", 32, "1", 8, 7, 0

game options
options_cave_select
    .byt 32, 32, 32, 32, 32, 32, 32, 32
    .byt "^", "_", 9, 6, "C","A","V","E", 32, 7, "A", 6, 32, "U","P", 32, "D","O","W","N", 32, 32, 8, 7
    .byt 32, 32, 32, 32, 32, 32, 32, 32
options_level_select
    .byt 32, 32, 32, 32, 32, 32, 32, 32
    .byt "`", "a", 9, 6, "L","E","V","E", "L", 7, "1", 6, 32, "L","E","F","T", 32, "R","I","G","H","T", 32
    .byt 32, 8, 7, 32, 32, 32, 32, 32
options_start
    .byt 32, 32, 32, 32, 32, 32, 32, 32
    .byt 9, 2, 32, 32, "P","R","E","S","S", 32, "S","P","A","C","E", 32, "T","O", 32, "S","T","A","R","T"
    .byt 32, 8, 7, 32, 32, 32, 32, 32
