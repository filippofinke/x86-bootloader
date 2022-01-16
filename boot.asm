[bits 16]           ; use 16 bits
[org 0x7c00]        ; sets the start address

init:
  mov ah, 0x00      ; video mode
  mov al, 0x0d      ; set 320x200 16 color graphics
  int 0x10          ; call video interrupt
  mov ah, 0x07      ; scroll window down
  mov al, 0x00      ; 0 = window is blanked
  mov cx, 0x0000    ; row = 0, col = 0
  mov dx, 0x184f    ; row = 24 (0x18), col = 79 (0x4f)
  int 0x10          ; call video interrupt
reset_cursor:
  mov ah, 0x02      ; set cursor position
  mov bh, 0x00      ; set page
  mov dh, 0x00      ; set row
  mov dl, 0x00      ; set column
  int 0x10          ; call video interrupt
change_background_color:
  mov ah, 0x0b      ; set color palette
  mov bh, 0x00      ; to set background and border color
  mov bl, 0x07      ; set cyan color
  int 0x10          ; call video interrupt
load_string: 
  mov si, msg       ; loads the address of "msg" into SI register
  mov ah, 0x0e      ; sets AH to 0xe (function teletype)
print_char:
  lodsb             ; loads the current byte from SI into AL and increments the address in SI
  cmp al, 0         ; compares AL to zero
  je done           ; if AL == 0, jump to "done"
  mov bl, 0x0f      ; set white color
  int 0x10          ; print to screen using function 0xe of interrupt 0x10
  jmp print_char    ; repeat with next byte
done:
  hlt               ; stop execution

msg: db "Hello world!", 0       ; we need to explicitely put the zero byte here

times 510-($-$$) db 0           ; fill the output file with zeroes until 510 bytes are full
dw 0xaa55                       ; magic number that tells the BIOS this is bootable
