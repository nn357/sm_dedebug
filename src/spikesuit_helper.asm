; Plays a sound if a spikesuit is obtained (spikesuit helper)

arch snes.cpu
lorom

!bank_90_free_space_start = $90FC20
!bank_90_free_space_end = $90FC40

org $90D4B9 ; hook end of shinespark crash
  jsl check_ss
  nop
  nop
  
org $91dd52 ; unused load samus 9500 palette
  nop #3    ; remove the fixed ldx here and we can jump to it with whatever palette we want.
  
org !bank_90_free_space_start
check_ss:
	lda $0ACC  		; Samus palette type normal? [regular shinecharge]
	bne .skip
	lda $0A68  		; special timer non zero? [can spark]
	beq  .skip
	lda #$0024
	jsl $809021		; play a sound effect
  ldx #$A3A0    ; gray samus
	jsl $91dd4c
  .skip:

	; Run hi-jacked instructions:
	lda #$0002
	sta $0A32
	rtl
	
assert pc() <= !bank_90_free_space_end