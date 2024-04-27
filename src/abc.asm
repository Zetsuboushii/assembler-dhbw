org 0x100
bits 16

SECTION  .CODE

; Die Buchstaben A,B und C sollen nacheinander ausgegeben werden.

mov dl,41h      ; 41 = ASCII-Wert für A
mov ah,2        ; ah = 2 setzen -> Wert für Interrupt zur Stringausgabe
int 21h         ; Interrupt zur Stringausgabe
inc dl          ; Inkrementieren von dl -> 42 = ASCII-Wert für B
int 21h
inc dl
int 21h