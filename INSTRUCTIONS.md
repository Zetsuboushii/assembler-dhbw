# Instruction Set

| Instruction | Description                            |
|-------------|----------------------------------------|
| mov ax,bx   | Verschiebt BX nach AX                  |
| add ax,bx   | Addiert AX und BX nach AX              |
| sub ax,bx   | Subtrahiert AX und BX nach AX          |
| daa         | Dezimale Anpassung nach Addition in AX |
| inc ax      | Inkrementiert den Wert in AX           |
| dec ax      | Dekrementiert den Wert in AX           |
| cmp ax,bx   | Vergleicht Inhalt aus AX mit BX        |
| je m        | Springt zu M, wenn gleich              |
| jmp m       | Springt zu M                           |

| Interrupts             | Description                        |
|------------------------|------------------------------------|
| mov ah,2<br/>int 21h   | Bildschirmausgabe des Wertes in DL |
| mov ah,1<br/>int 21h   | Input mit Echo nach AL             |
| mov ah,8<br/>int 21h   | Input ohne Echo nach AL            |
| mov ah,9<br/>int 21h   | Stringausgabe aus DX               |
| mov ah,4ch<br/>int 21h | Zurück zu DOS                      |

| Magic                       | Description                                                             |
|-----------------------------|-------------------------------------------------------------------------|
| add dl,30                   | Maskiert die Ziffer in DL                                               |
| sub dl,30                   | Demaskiert die Ziffer in DL                                             |
| string db "Hello",10,13,"$" | Speichert String ab, 10: Zeilenumbruch, 13: Leere Zeile, $: String Ende |