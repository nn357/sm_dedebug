; Super Metroid - dedebug
; nn357

; It's quite shocking how much debug code was left not only in the game but some of it partially active too.
; This patch removes all calls to debug routines and frees up the space they took.
;
; made to compile with ASAR >1.90

; space freed

; bank 80
; 809492 - 809583 (241 bytes)
; 80a9ac - 80a9d5 (41 bytes)
; 80b032 - 80b0ff (205 bytes)
; 80cd07 - 80cd8e (135 bytes)
;
; bank 81
; 81a806 - 81a81e (24 bytes)
; 81a83e - 81a8a9 (107 bytes)
; 818cf4 - 818d0f (27 bytes)
; 818d6d - 818dba (77 bytes)
; 818e7f - 8190ae (559 bytes)
;
; bank 90
; 90e759 - 90e7f4 (155 bytes)
; 90f52f - 90f575 (70 bytes)
; 90f5e4 - 90f619 (53 bytes)
;
; bank 91
; 91e355 - 91e3f6 (161 bytes)

; bank b4
; b492c6 - b4bc26 (10592 bytes)

lorom

fillbyte $FF

org $808558 ; skip mirroring the debug byte to RAM
  bra $05
  nop #5

org $809490 ; debug controller read routine
  plp
  rtl
  pad $809583
  
org $809C29 ; hud handle super missles debug branch
  bra $06
  nop #6
  
org $809c39 ; hud handle super middiles debug code
  nop #6
  
org $80a9ac ; debug layer 1 position save / loading
  pad $80a9d6
  
org $80b032 ; unused rotating mode 7
  pad $80b0ff
  
org $80cd07 ; debug elevators routines
  pad $80cd8e
  
org $818cf4 ; debug game over menu
  pad $818d0f
  
org $818d6d ; debug menus
  pad $818dba

org $818e7f ; debug game over menu
  pad $8190ae

org $81a804 ; debug area select map
  bra $18
  nop #24
  
org $81a83e ; debug area select
  pad $81a8a9

org $81a8ac
   bra $3
   nop #3
   
org $81a8c2 ; debug area select
  pad $81a97e
  
org $828b4b ; maingame loop debug handler call
  bra $07
  nop #7
  
org $828b8e ; check if debug scrolling is enabled
  bra $8
  nop #8
  
org $90e72b ; debug command handler
  bra $1
  nop

org $90e759 ; demo recorder
  pad $90e7f4
  
org $90f52f ; debug commands
  pad $90f575
  
org $90f5e4 ; debug loop (sound effects)
  bra $33
  pad $90f619

org $91e355 ; debug. Handle sel l + bank
  pad $91e3f6
 
org $b492c6 ; debug handler
  pad $b4bc26