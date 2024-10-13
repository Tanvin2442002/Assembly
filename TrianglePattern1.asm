
.MODEL SMALL
.STACK 100H
.DATA

 n DW ?
 j DW 0
 
 MAIN PROC
     MOV AX,@Data
     MOV DS,AX
     
     MOV AH,01H
     INT 21H
     XOR AH,AH
     SUB AL,'0'    
     MOV n,AX
     MOV CX,n
     MOV j,AX
     
     MOV AH,02H
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
     
     
     
PRINT:
    
     PAT:
     MOV AH,02H
     ADD j,'0'
     MOV DX,j
     INT 21H 
     SUB j,'0'
     DEC j
     CMP j,CX
     JGE PAT
   
   MOV AH,02H
   MOV DL,10
   INT 21H
   MOV DL,13
   INT 21H
   MOV AX,n 
   MOV j,AX
   LOOP PRINT      
    
     
     
    
    
    
 MAIN ENDP
 END MAIN






