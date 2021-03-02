.code
; 16-bit maximal-period Galois linear feedback shift register (LFSR) 
; taps at 15, 14, and 12
; https://en.wikipedia.org/wiki/Linear-feedback_shift_register#Galois_LFSRs

lfsr_start = $ACE1
lfsr_state = 2

.scope LFSR
next:
    ; advance the LFSR to the next state
    ; A: MSB
    ; Y: LSB
    lda lfsr_state+1
    clc 
    ror
    tay 
    lda lfsr_state 
    ror 
    sta lfsr_state
    tya 
    bcc @skip 
    eor #$B4
@skip:
    sta lfsr_state+1
    ldy lfsr_state 
    rts
.endscope
lfsr_next = LFSR::next
.export lfsr_next, lfsr_start, lfsr_state