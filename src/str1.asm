org 0x100
bits 16

section .code
mov ah,9
mov dx,head
int 21h

mov ah,9
mov dx,ch1
int 21h

mov ah,9
mov dx,ch2
int 21h

section .data
head db "Assembler Programming",10,13,"$"
ch1 db "Chapter 1: Register Operations",10,13,"$"
ch2 db "Chapter 2: Stack Operations",10,13,"$"