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


mov byte [es:0], '6'   ; Write an 'H'
mov byte [es:1], 0fch
mov byte [es:2], '5'   ; Write an 'H'
mov byte [es:3], 0efh
mov byte [es:4], '0'   ; Write an 'H'
mov byte [es:5], 0d0h
mov byte [es:6], '5'   ; Write an 'H'
mov byte [es:7], 0c1h
mov byte [es:8], '5'   ; Write an 'H'
mov byte [es:9], 0b2h
mov byte [es:10], '0'   ; Write an 'H'
mov byte [es:11], 0a8h
mov byte [es:12], '1'   ; Write an 'H'
mov byte [es:13], 09dh
mov byte [es:14], '0'   ; Write an 'H'
mov byte [es:15], 08fh
mov byte [es:16], '3'   ; Write an 'H'
mov byte [es:17], 07fh
mov byte [es:18], '8'   ; Write an 'H'
mov byte [es:19], 06ah

mov byte [es:20], ' '   ; Write an 'H'
mov byte [es:21], 00ah


; Subject
mov byte [es:22], 'C'   ; Write an 'H'
mov byte [es:23], 050h
mov byte [es:24], 'O'   ; Write an 'H'
mov byte [es:25], 040h
mov byte [es:26], 'S'   ; Write an 'H'
mov byte [es:27], 030h
mov byte [es:28], '3'   ; Write an 'H'
mov byte [es:29], 020h
mov byte [es:30], '1'   ; Write an 'H'
mov byte [es:31], 013h
mov byte [es:32], '0'   ; Write an 'H'
mov byte [es:33], 0ffh
mov byte [es:34], '5'   ; Write an 'H'
mov byte [es:35], 0f0h


sleep:
hlt                    ; Halts CPU until the next external
                        ;interrupt is fired
jmp sleep              ; Loop forever

times 510-($-$$) db 0  ; Pad to 510 bytes
dw 0aa55h              ; Add boot magic word to mark us
                        ; as bootable