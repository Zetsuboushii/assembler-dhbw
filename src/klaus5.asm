org 0x100
bits 16

%macro compare 1
mov ah,0x01
int 0x21

sub al,'0'
cmp al,9
jle %1
sub al,7
%endmacro

start:
    compare first

first:
    shl al,4
    mov bl,al

    compare second

second:
    or bl,al

    mov ah,0x4c
    int 0x21