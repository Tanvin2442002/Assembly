.model small
.stack 100h
.data
msg db 'Enter the character:$' 
arr db 8 dup(?)

binary db 'Binary of the character:$'
ones db 'number of ones:$'
cnt db 0
.code

main:

    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea bx,msg
    int 21h
    
    xor ax,ax
    mov ah,01h
    int 21h
    xor bx,bx
    mov bl,al
    xor cx,cx  
    mov cl,8
    mov si,0
    insert:
    shl bl,1
    jc setone
    jmp setzero
    setone:
    inc cnt
    mov arr[si],'1'
    inc si
    jmp last
    setzero:
    mov arr[si],'0'
    inc si
    last:
    loop insert
    
    mov ah,02h
    mov dl,0Dh
    int 21h
    mov dl,0Ah
    int 21h
    xor cx,cx
    mov cl,8
    mov si,0
    
    mov ah,09h
    lea dx,binary
    int 21h
    
    print:
    mov ah,02h
    mov dl,arr[si]
    inc si
    int 21h
    loop print
    
     mov ah,02h
    mov dl,0Dh
    int 21h
    mov dl,0Ah
    int 21h  
    
    mov ah,09h
    lea dx,ones
    int 21h
    
    xor ax,ax
    mov ah,02h
    mov dl,cnt
    add dl,'0'
    int 21h
        
end main  






