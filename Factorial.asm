.model small
.stack 100h
.data
n dw ?
product dw 1
.code

main proc
   mov ax,@data
   mov ds,ax
   
   mov ah,01h
   int 21h
   xor ah,ah
   mov n,ax
   sub n,'0'
   mov cx,n
   mov ax,product
   l:
   cmp n,0
   je exit
   imul n
   dec n
   loop l
   
   exit:
   mov ah,02h
   mov dx,ax
   add dx,'0'
   int 21h 


endp main