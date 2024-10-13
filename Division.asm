.model small
.stack 100h

.data
num dw 0
num2 dw 0
multi dw 10
result dw ?  
.code

main proc
   
   mov ax,@data
   mov ds,ax
   ;mov cx,0
   inp:
   mov ah,01h      ;5 2
   int 21h
   cmp al,0dh
   je break:
   sub al,'0'
   xor ah,ah
   add num,ax      ; num initailly 0 so num = num + ax (5)
   mov ax,num      ; ax = 5
   mul multi       ; ax = 5 * multi (10)
   mov num,ax      ; num = ax
   ;inc cx
   jmp inp
  
  break:
  mov ah,02h
   mov dl,0dh
   int 21h
   mov dl,0Ah
   int 21h 
   
   inp2:
   mov ah,01h
   int 21h
   cmp al,0dh
   je exit:
   sub al,'0'
   xor ah,ah
   add num2,ax
   mov ax,num2
   mul multi
   mov num2,ax
   ;inc cx
   jmp inp2
   
 exit:
    mov ax,num         ;520
    div multi          ;52
    mov num,ax         ; num = 52
    mov ax,num2
    div multi
    mov num2,ax
    
    mov ax,num
    mov bx,num2
    
                                             ;5 0 0
   CALL GCD_FIND             ;               ;0 0 5


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
   
   MOV AH, 4CH
   INT 21H
        
endp main  

GCD_FIND PROC
    gcd_loop:
      CWD
      CMP BX, 0         
      JE done          
      XOR DX, DX       
      DIV BX  ; AX/BX  -> DX ->remainder           
      MOV AX, BX       
      MOV BX, DX        
      JMP gcd_loop  
      
      done:
      MOV result, AX
    
    RET
GCD_FIND ENDP