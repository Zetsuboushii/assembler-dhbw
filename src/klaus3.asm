org 0x100
bits 16

mov ah,2
mov cx,5
mov dx,'Z'

loop1:
    int 0x21
    dec dx
    loop loop1

mov ah,0x4c
int 0x21