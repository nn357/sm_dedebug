; vanilla bugfix, ui shows reserve icon when only boots item is equipped.
; caused by a missing branch instruction in the boots section equipent loop.
; replaces unused change pose routine at a3d9 - a3ec

lorom
arch 65816

!unused_routine_start = $82a3d9
!unused_routine_end = $82a505
fillbyte $FF

org !unused_routine_start
fixed_loop:
  beq .skip
  jmp .found
  .skip
  inx
  inx
  cpx #$0006
  jmp $AC08
  pad !unused_routine_end
  
assert pc() <= !unused_routine_end

org $82AC03
  jmp fixed_loop
  nop #2

org $82AC0C
.found