BSOUT=$FFD2 ; write character
R1L=4

.IMPORT prhex_wyde
.import lfsr_next, lfsr_start
.importzp lfsr_state

.segment "INIT"
.segment "ONCE"

.segment "STARTUP"
start:
    lda #<lfsr_start
    sta lfsr_state
    lda #>lfsr_start
    sta lfsr_state+1
    
    lda #8
    sta R1L
@2:
    ldy #0
@1: 
	jsr prhex_wyde
    jsr lfsr_next
    lda #32
	jsr BSOUT
	dey
	bne @1
	dec R1L
    bne @2
    RTS
