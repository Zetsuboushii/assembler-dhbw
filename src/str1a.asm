org 100h
bits 16

%macro stringout 1
mov dx,%1
mov ah,9
int 21h
%endmacro

section .code
stringout headline
stringout ch1
stringout ch2

section .data
headline db "Assembler Programming",10,13,"$"
ch1 db "Chapter 1: Register Operations",10,13,"$"
ch2 db "Chapter 2: Stack Operations",10,13,"$"