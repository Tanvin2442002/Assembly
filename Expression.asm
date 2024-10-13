;A = 5 x A - 12 x B

.Model Small
.Stack 100H
.Data
A dw ?
B dw ?

.code

MAIN PROC
    
     mov ax, @data
     mov ds,ax
     
     mov ah,01h
     int 21H
     xor ah,ah
     mov A,ax
     mov ah,01h
     int 21H
     xor ah,ah
     mov B,ax
     SUB A,'0'
     SUB B,'0'
     
     xor ax,ax
     mov ax,5
     imul A
     mov A,ax
     xor ax, ax
     mov ax,12
     imul B
     mov B,ax
     mov AX,A
     sub AX,B
     mov A,AX
     
     mov ah,02h
     mov dx,ax
     ADD dx,'0'
     int 21h

ENDP MAIN
        