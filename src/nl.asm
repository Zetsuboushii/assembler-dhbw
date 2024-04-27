org 100h
bits 16

%macro sout 1
mov dl,%1
mov ah,9
int 21h
%endmacro

section .code
sout name
sout surname
sout newline
sout street
sout newline
sout newline
sout postal
sout city

section .data
newline db 10,13,"$"
name db "Heinz $"
surname db "Mueller$"
street db "Rheingasse 4$"
postal db "67551 $"
city db "Worms$"