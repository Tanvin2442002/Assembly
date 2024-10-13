.model small
.stack 100H
.data
temp dw ?
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov cx , 0
    inp:
    mov ah,01h
    int 21h
    cmp al,0dh
    je done
    inc cx
    xor ah,ah
    push ax
    jmp inp

done:
    mov ah,02h
    mov dl,0dh
    int 21h
    mov dl,0Ah
    int 21h
    
print:
    pop ax
    mov temp,ax
    mov ah,02h
    mov dx,temp
    int 21h
    loop print
     
    
    
        
main endp