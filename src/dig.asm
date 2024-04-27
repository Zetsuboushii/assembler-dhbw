org 0x100
bits 16

SECTION .CODE

; Übung Ziffernausgabe

mov ax,6
mov bx,2
sub ax,bx
mov dl,al
add dl,30h
mov ah,2
int 21h
mov ah,4ch
int 21h