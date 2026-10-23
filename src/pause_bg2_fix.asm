; remove pause menu bg2 tile backup / restore / fix dma transfer
;
; Theres a DMA size mismatch bug in $8e75 that copies $2000 instead of $1000, destroying the BG2 tilemap
; fix the DMA transfer size and remove the backup / restore workaround.

; Frees up 108 byes from $828d51 - $828dbd

arch snes.cpu
lorom

org $828ed2 ;;; $8E75: Load pause menu tiles and clear BG2 tilemap ;;;
  db $10
  
org $829377 ; $82:9377 20 96 8D    JSR $8D96  [$82:8D96]  ; Restore BG2 tilemap from pause menu
  nop #3

org $828d08 ; $82:8D08 20 51 8D    JSR $8D51  [$82:8D51]  ; Back up BG2 tilemap for pause menu
  nop #3


org $828d51  ;;; $8D51: Back up BG2 tilemap for pause menu ;;; (69 bytes) ;;; $8D96: Restore BG2 tilemap from pause menu ;;; (39 bytes)
    padbyte $FF
    pad $828dbd
assert pc() <= $828dbd
