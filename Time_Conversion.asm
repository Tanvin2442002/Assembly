.model small
.stack 100h
.data
time dw ?
multi dw 10
hour dw 3600
result dw 0
result2 dw 0
min dw 60
.code

main proc
    mov ax,@data
    mov ds,ax
    
   inp:
   mov ah,01h      ;5 2
   int 21h
   cmp al,0dh
   je endd:
   sub al,'0'
   xor ah,ah
   add time,ax      ; num initailly 0 so num = num + ax (5)
   mov ax,time      ; ax = 5
   mul multi       ; ax = 5 * multi (10)
   mov time,ax      ; num = ax
   ;inc cx
   jmp inp
 
 endd:  
   mov ax,time
   div multi
   mov time,ax
   
   mov ax,time
   mov bx,hour
   
   cwd
   Div bx
   mov time,dx
   mov result,ax
   mov ax,time
   mov bx,min
   cwd
   div bx
   mov result2,ax
   mov time,dx
   
   mov ax,result
 PRINT:
    
      mov cx,0
      mod:
      cwd
      cmp ax,0
      je break2
      div multi
      push dx
      xor dx,dx
      inc cx
      jmp mod
      break2:
      mov ah,02h
      mov dl,0dh
      int 21h
      mov dl,0Ah
      int 21h 
  
label:
       pop bx
       mov ah,02h
       mov dx,bx
       add dx,'0'
       int 21h
       loop label   
       
  mov ax,result2
 PRINT2:
    
      mov cx,0
      mod2:
      cwd
      cmp ax,0
      je break3
      div multi
      push dx
      xor dx,dx
      inc cx
      jmp mod2
      break3:
      mov ah,02h
      mov dl,0dh
      int 21h
      mov dl,0Ah
      int 21h 
  
label2:
       pop bx
       mov ah,02h
       mov dx,bx
       add dx,'0'
       int 21h
       loop label2
      
   
   
   
    
    
main endp
