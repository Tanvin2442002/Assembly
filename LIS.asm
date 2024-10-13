.Model small
.stack 100H
.data
msg db 'enter string:$';
mx db 1
i db 0 
idx db 0
j db 1
cnt db ?
myarr db 20 dup(?)    


main:

mov ax,@data
mov ds,ax
                        ;FGHADEFGHC

lea dx,msg
mov ah,09h
int 21h  
xor cx,cx

mov si,0

input:
 mov ah,01
 int 21h
 cmp al,0dh
 je exit
 mov myarr[si],al
 inc si   
 inc cx
 jmp input
 
exit:              ;ABGHIJLP
 
 mov si,0
 mov cnt,cl   
 ;sub cnt,1
 find:
 mov al,myarr[si]
 mov bl,myarr[si+1]
 mov i,bl
 sub i,al
 cmp i,1
 je increase    ;Jodi consecutive hoy
 jne finish      ;jodi na hoy
 
 
 increase:       ;consecutive hole tar length+1 and then next index
 inc mx
 dec cnt
 cmp cnt,0h
 inc si
 jg find          
 je finish
 
 
 fin:
 mov al,mx
 mov j,al
 mov al,1
 mov mx,al
 dec cnt
 inc si
 xor ax,ax
 mov ax,si
 mov idx,al        ;idx longest consecutive sequence er last index store kore
 cmp cnt,0
 jg find
 je endd           ;jodi string er shesh pai then endd
 
 
 finish:
 mov al,mx
 cmp al,j
 jg fin           ;jodi mx>j hoy tahole j=mx
 mov al,1         ;nahole pore check korbo  
 mov mx,al

 xor ax,ax
 inc si
 dec cnt
 xor ax,ax
 mov al,cnt
 cmp al,0h
 je endd
 jg find
 
 
 
 endd:                 ;ei part just answer printing
 mov ah,02
 mov dl,0Dh
 int 21h
 mov dl,0Ah
 int 21h
 
 xor ax,ax
 mov al,idx
 sub al,j
 mov si,ax
 
 xor cx,cx
 mov cl,j
 
 outt:
 mov ah,02h
 mov dl,myarr[si]
 int 21h
 inc si
 loop outt
 
end main

