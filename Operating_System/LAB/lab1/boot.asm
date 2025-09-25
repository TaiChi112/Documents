[org 7c00h]            ; BIOS will load us to this address
mov ax, 0b800h         ; Console memory is at 0xb8000
                        ; set up a segment
mov es, ax             ; for the start of the console text.
;
; Let's clear the screen....
;
xor di, di             ; Start at beginning of screen
mov cx, 80*25          ; Number of chars in the screen
mov al, ' '            ; Space character
mov ah, 0fh            ; Color (white on black)
repne stosw            ; Copy!

; this is commemt

mov byte [es:0], '5'   ; Write an '6'
mov byte [es:1], 0x2D

mov byte [es:2], '5'   ; Write an '5'
mov byte [es:3], 0x64    

mov byte [es:4], '0'   ; Write an '0'
mov byte [es:5], 0xD0 

mov byte [es:6], '5'   ; Write an '5'
mov byte [es:7], 0x7B 

mov byte [es:8], '5'   ; Write an '5'
mov byte [es:9], 0xF4

mov byte [es:10], '0'   ; Write an '0'
mov byte [es:11], 0xD5

mov byte [es:12], '1'   ; Write an '1'
mov byte [es:13], 0xA0

mov byte [es:14], '0'   ; Write an '0'
mov byte [es:15], 0x13

mov byte [es:16], '3'   ; Write an '3'
mov byte [es:17], 0xE3

mov byte [es:18], '8'   ; Write an '8'
mov byte [es:19], 0x16

mov byte [es:20], ' '   ; Write an ' '
mov byte [es:21], 0x5A

mov byte [es:22], 'C'   ; Write an 'C'
mov byte [es:23], 0xE4

mov byte [es:24], 'O'   ; Write an 'O'
mov byte [es:25], 0xD0

mov byte [es:26], 'S'   ; Write an 'S'
mov byte [es:27], 0x43

mov byte [es:28], '3'   ; Write an '3'
mov byte [es:29], 0x30

mov byte [es:30], '1'   ; Write an '1'
mov byte [es:31], 0xC7

mov byte [es:32], '0'   ; Write an '0'
mov byte [es:33], 0xF2

mov byte [es:34], '5'   ; Write an '5'
mov byte [es:35], 0x64 

sleep:
hlt                    ; Halts CPU until the next external
                        ;interrupt is fired
jmp sleep              ; Loop forever

times 510-($-$$) db 0  ; Pad to 510 bytes
dw 0aa55h              ; Add boot magic word to mark us
                        ; as bootable