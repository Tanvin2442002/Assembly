.MODEL SMALL
.STACK 100H
.DATA

 n DW ?
 j DW 0
 i DW ?
 space DW 032
 val DW 0
 temp DW ?
 
 MAIN PROC
     MOV AX,@Data
     MOV DS,AX
     
     MOV AH,01H
     INT 21H
     XOR AH,AH
     MOV n,AX
     SUB n,'0'     
     MOV AH,02H
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
     MOV AX,n
     CMP AX,1
     JE  ONE
     MOV i,1
OUTER1:  
      MOV AX,n
      SUB AX,i
      MOV j,AX
      MOV CX,j
      CMP CX,00
      JE LABEL
     INNER1:
           MOV AH,02H
           MOV DX ,space
           INT 21H
           MOV AX,val
           LOOP INNER1
           
           MOV AX,1
           MOV j,AX
     LABEL:      
      MOV AX,i
      MOV DX,2
      MUL DX
      SUB AX,1
      MOV CX,AX     
     INNER2:
           MOV AH,02H
           MOV DX,'*'
           INT 21H
           LOOP INNER2
     MOV AH,02H
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
     INC i
     MOV AX,n
     CMP i,AX
     JLE OUTER1

    
    MOV AX,n
    MOV DX,2
    MUL DX
    SUB AX,1
    MOV temp,AX
    MOV AX,n
    SUB temp,AX
    MOV AX,temp
    MOV i,AX
OUTER2:
      MOV CX,n
      SUB CX,i
      MOV j,CX
     INNER3:
           MOV AH,02H
           MOV DX,space
           INT 21H
           MOV AX,val
           LOOP INNER3
           
           MOV AX,1
           MOV j,AX
     INNER4:
           MOV AH,02H
           MOV DX,'*'
           INT 21H
           INC j
           MOV AX,i
           MOV DX,2
           MUL DX
           SUB AX,1
           CMP j,AX
           JLE INNER4
     MOV AH,02H
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
     DEC i
     JNZ OUTER2
     JMP EXIT
ONE:     
     MOV AH,02H
     MOV DX,'*'
     INT 21H
EXIT:
    
 MAIN ENDP
 END MAIN
