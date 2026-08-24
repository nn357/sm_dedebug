; Super Metroid Power Beam SBA
; 
; This can be considered a twin to the Wave X-Factor / Asteroid belt SBA. 
; It uses the same animation cycle but a different projectile type and does 1/2 Wave damage (150 per projectile)
;
; nn_357

arch snes.cpu
lorom

org $938413 ; Non-ice SBA projectiles. Indexed by beam type
  dw $86d7  ; re-point power beam to unused projectile 27h

org $9386d7 ; Unused projectile 27h (unused shinespark beam?)
  dw $0096  ; 150 dmg per projectile (1/2 wave SBA)
  dw $a16d  ; unused shinespark beam (projectile 27h) circle with a hole in it. ;;;

org $90ccf0 ; Fire SBA beam lookup table.
  dw $cd1a  ; repoint powerbeam from $cd18 (clc/rts) to wave sba.

org $90cc21 ; Cost of SBAs in power bombs ;;;
  dw $0001  ; power beam = 1