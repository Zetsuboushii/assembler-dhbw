org 100h
bits 16

%macro sout 1
mov dx,%1
mov ah,9
int 21h
%endmacro

section .code
sout output
mov bl,75h
push bx
mov cx,4
shr bl,cl
mov dl,bl
add dl,30h
mov ah,2
int 21h
pop bx
and bl,0fh
mov dl,bl
add dl,30h
int 21h
mov ah,4ch
int 21h

section .data
output db "Output 8-Bit-Register (BL) Numbers 0 through 9",10,13,"$"
