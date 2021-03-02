
BSOUT = $FFD2 ; write character
R0 = 2
R0L = 2
R0H = 3

.CODE

.scope prhex
; print 4 octets in (R0)
; scratch: .A .Y 
tetra:
	ldy #4
@next:
	lda (R0),y
	jsr byte
	dey
	bpl @next
	rts

; print 2 octets in R0
wyde:
    lda R0H
    jsr byte
    lda R0L
    ; fall through
; print 2 hex digits in A
byte:
	pha
	lsr
	lsr
	lsr
	lsr
	jsr digit
	pla
	and #15
	;fall through

; print hex digit in A
; NB: upper nybble must be zero
digit:
	CMP #10
	BCS @0
	SBC #5
	CLC
@0:	ADC #54
	JMP BSOUT ; print and return
.endscope

prhex_tetra = prhex::tetra
prhex_wyde = prhex::wyde
prhex_byte = prhex::byte
prhex_digit = prhex::digit

.export prhex_tetra,prhex_wyde,prhex_byte, prhex_digit