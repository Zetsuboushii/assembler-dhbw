org 0x100
bits 16

SECTION .CODE

mov ah,1
int 21h
mov bl,al
sub bl,30h
mov ah,1
int 21h
sub al,30h
add al,bl
mov dl,al
add dl,30h
mov ah,2
int 21h
mov ah,4ch
int 21h