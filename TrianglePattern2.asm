   
.MODEL SMALL
.STACK 100H
.DATA

 n DW ?
 j DW 0
 i DW ?
 
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
     
     MOV AX,n
     SUB AX,j
     MOV i,AX
     ADD i,'0'
     MOV AH,02H
     MOV DX,i
     INT 21H 
     SUB i,'0'
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






