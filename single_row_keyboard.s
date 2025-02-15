;Copied and slightly adapted from: https://github.com/Oric-Software-Development-Kit/Oric-Software/tree/master/routines/single_row_keyboard_read
;

#define ROM  ; Using a rom, not overlay memory
#define rom_v1_1 ; Using rom v1.1 (Atmos), comment this line out for rom v1.0 (Oric-1)

#ifdef ROM
#ifdef rom_v1_1  ;Atmos
#define IRQ_ADDRLO $0245
#define IRQ_ADDRHI $0246
#else  ;Oric-1
#define IRQ_ADDRLO $0229
#define IRQ_ADDRHI $022A
#endif
#else  ;using overlay memory
#define IRQ_ADDRLO $fffe
#define IRQ_ADDRHI $ffff
#endif

#define        via_portb               $0300 
#define		   via_ddrb				   $0302	
#define		   via_ddra				   $0303
#define        via_t1cl                $0304 
#define        via_t1ch                $0305 
#define        via_t1ll                $0306 
#define        via_t1lh                $0307 
#define        via_t2ll                $0308 
#define        via_t2ch                $0309 
#define        via_sr                  $030A 
#define        via_acr                 $030b 
#define        via_pcr                 $030c 
#define        via_ifr                 $030D 
#define        via_ier                 $030E 
#define        via_porta               $030f 

_InitIRQ
.(
    ;Since we are starting from when the standard irq has already been 
    ;setup, we need not worry about ensuring one irq event and/or right 
    ;timer period, only redirecting irq vector to our own irq handler. 
    sei

    ; Setup DDRA, DDRB and ACR
    lda #%11111111
    sta via_ddra
    lda #%11110111 ; PB0-2 outputs, PB3 input.
    sta via_ddrb
    lda #%1000000
    sta via_acr

;TODO: Boulder Dash better with or without?
    ; Since we have only IRQ handler for everything, it is generally
    ; more useful to run at 50Hz, instead of 100 Hz.
;    lda #<20000
;    sta via_t1ll 
;    lda #>20000
;    sta via_t1lh

    ; Patch IRQ vector
    lda #<irq_routine 
    sta IRQ_ADDRLO
    lda #>irq_routine 
    sta IRQ_ADDRHI
    cli 
    rts 
.)


irq_routine 
.(
    ;Preserve registers 
    sta irq_A
    stx irq_X
    sty irq_Y

    ;Clear IRQ event 
    lda via_t1cl 

    ;Process keyboard 
    jsr ReadKeyboard 

    ;Restore Registers 
    lda irq_A
    ldx irq_X
    ldy irq_Y

    ;End of IRQ 
    rti 
.)


values_code .byt $df,$7f,$f7,$bf,$fe,$ef,$fd,$fb

ReadKeyboard
.(
    lda #00
    sta _KeyRowArrows

    ; Select the bottom row of the keyboard
    ldy #04
    sty via_portb

    ldx #7
loop_read

    ; Write Column Register Number to PortA
    ldy #$0e
    sty via_porta

    ; Tell AY this is Register Number
    ldy #$ff
    sty via_pcr

    ; Clear CB2, as keeping it high hangs on some orics.
    ; Pitty, as all this code could be run only once, otherwise
    ldy #$dd
    sty via_pcr

    ; Write to Column Register 
    lda values_code,x
    sta via_porta
    lda #$fd
    sta via_pcr
    sty via_pcr

    lda via_portb
    and #08
    beq key_not_pressed

    lda values_code,x
    eor #$ff
    ora _KeyRowArrows 
    sta _KeyRowArrows

key_not_pressed    
    dex
    bpl loop_read
    rts
.)
