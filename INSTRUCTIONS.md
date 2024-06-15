# Instruction Set

| Register | Description                                                 |
|----------|-------------------------------------------------------------|
| AX       | 16-Bit-Register; Multiplikation, Division, Datenübertragung |
| BX       | 16-Bit-Register; Basisregister                              |
| CX       | 16-Bit-Register; Zählregister                               |
| DX       | 16-Bit-Register; Restwert bei Divisionen, Outputwerte       |
| SI / DI  | Zeigeroperationen                                           |
| BP       | Basisadresse für Adressierung                               |
| SP       | Oberster Speicherort des Stacks                             |
| CS       | Segment, das den auszuführenden Code enthält                |
| DS       | Segment, das die Daten enthält                              |
| SS       | Segment, das den Stack enthält                              |
| ES       | Zustätzliches Datensegementregister                         |
| IP       | Pointer auf Adresse mit nächster Anweisung                  |

| Flags            | Description                                                 |
|------------------|-------------------------------------------------------------|
| Carry Flag (CF)  | (NoCarry) / (CarryYes)                                      |
| Parity Flag (PF) | (ParityEven) / (ParityOdd)                                  |
| Zero Flag (ZF)   | Wenn Subtraktion oder Vergleich null ergibt (ZeRo/NotZero)  |
| Sign Flag (SF)   | Wenn Ergebnis negativ ist (highest bit = 1) (PLus/NeGative) |

| Instruction | Description                                                           |
|-------------|-----------------------------------------------------------------------|
| mov ax,bx   | Verschiebt BX nach AX                                                 |
| add ax,bx   | Addiert AX und BX nach AX                                             |
| sub ax,bx   | Subtrahiert AX und BX nach AX                                         |
| daa         | Dezimale Anpassung nach Addition in AX                                |
| inc ax      | Inkrementiert den Wert in AX                                          |
| dec ax      | Dekrementiert den Wert in AX                                          |
| cmp ax,bx   | Vergleicht Inhalt aus AX mit BX                                       |
| jmp m       | Springt zu M                                                          |
| jz m        | Sprint zu M, wenn 0                                                   |
| je m        | Springt zu M, wenn gleich                                             |
| jl m        | Springt zu M, wenn kleiner                                            |
| jle m       | Springt zu M, wenn kleiner oder gleich                                |
| jc m        | Springt zu M, wenn Carry Flag gesetzt ist                             |
| shr ax,bx   | Shift Right AX um (Wert aus BX)-Bits                                  |
| shl ax,bx   | Shift Left AX um (Wert aus BX)-Bits                                   |
| push ax     | Setzt AX-Register auf den Stack !nur mit 16-Bit!                      |
| pop ax      | Restauriert AX !nur mit 16-Bit!                                       |
| pushall     | Legt alle Hauptregister (außer CX) auf den Stack                      |
| popall      | Holt alle Hauptregister (außer CX) auf den Stack                      |
| and ax,bx   | Logisches UND von AX und BX                                           |
| xchg al,ah  | Tauscht Werte                                                         |
| ror ax,bl   | Schiebt angegebene Zahl BL Bits nach rechts und fügt links wieder ein |
| rol ax,bl   | Schiebt angegebene Zahl BL Bits nach links und fügt rechts wieder ein |
| rcl ax,bl   | Rotate Left, unter Einbeziehung der Carry-Flag                        |
| pushf       | Legt das Statusregister auf den Stack                                 |
| popf        | Holt das Statusregister vom Stack                                     |
| call s      | Ruft Subroutine S auf                                                 |
| ret         | Kehrt zum call-Aufruf zurück                                          |

| Interrupts             | Description                        |
|------------------------|------------------------------------|
| mov ah,2<br/>int 21h   | Bildschirmausgabe des Wertes in DL |
| mov ah,1<br/>int 21h   | Input mit Echo nach AL             |
| mov ah,8<br/>int 21h   | Input ohne Echo nach AL            |
| mov ah,9<br/>int 21h   | Stringausgabe aus DX               |
| mov ah,4ch<br/>int 21h | Zurück zu DOS                      |

| Magic                        | Description                                                                        |
|------------------------------|------------------------------------------------------------------------------------|
| add dl,30h                   | Maskiert die Ziffer in DL als ASCII; 30 -> 'A'                                     |
| sub dl,30h                   | Demaskiert die Ziffer in DL                                                        |
| string db "Hello",10,13,"$"  | Speichert String ab, 10: Zeilenumbruch, 13: Leere Zeile, $: String Ende            |
| variable db 12               | Definiert eine 8-Bit-Zahl mit dem Wert 12                                          |
| variable dw 1234h            | Definiert eine 16-Bit-Zahl mit dem Wert 1234h                                      |
| variable dd 12345678h        | Definiert eine 32-Bit-Zahl                                                         |
| variable dq 123456789abcdefh | Definiert eine 64-Bit-Zahl                                                         |
| and al,0fh                   | Wert logisch nullen                                                                |
| mov ax, 0fd2ch               | 0x MUSS als Präfix, da sonst nicht als Zahl erkannt                                |
| Stackstruktur                | Die oberste Adresse des Stacks ist mit 00 belegt                                   |
| Stackwachstum                | Stacks wachsen nach unten. Der untere Registerteil kommt zuerst auf Stack          |
| Stackpop                     | Stacks werden nach LIFO gepopt; unabhängig vom Register; Registerhälften getauscht |
