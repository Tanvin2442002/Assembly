.MODEL SMALL
.STACK 100H
.DATA

ARR DB 5 dup (0)
sum DB 0
.CODE

MAIN PROC
  
  MOV AX,@Data
  MOV DS,AX
  
  LEA BX ,ARR
  
  MOV CX, 5
  
  L1:
    MOV AH,01H
    INT 21H
    SUB AL,48
    MOV [BX],AL
    INC BX
    LOOP L1
    
  SUB BX,5
  MOV CX,5
  L2:
    ;MOV AH,02H
    MOV DL,[BX]
    ADD sum,DL
    INC BX
    LOOP L2
 ADD sum,48   
 MOV AH,02H
 MOV DL,sum
 INT 21H 
     
   
   
    
    
    
MAIN ENDP