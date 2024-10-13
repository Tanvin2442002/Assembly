.model small
.stack 100h
.data
n db ?
sum db 0
 arr db n dup(?)
.code

MAIN PROC
    mov ax,@data
    mov ds,ax
    
    mov ah,01h
    int 21h
    mov n,al
    sub n,'0'
    mov ch,0
    mov cl,n;
    lea bx,arr
    INP:
    mov ah,01h
    int 21h
    mov [bx],al
    inc bx
    loop INP
    
    lea bx,arr
    mov cl,n
    Calc:
    mov al,[bx]
    sub al,'0'
    add sum,al
    inc bx
    loop Calc
    
    mov ah,02h
    mov dl,sum
    add dl,'0'
    int 21h
    
    
    
     

ENDP MAIN
