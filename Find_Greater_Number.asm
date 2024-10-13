 .MODEL SMALL
 .STACK 100H
 .DATA
 
 a DB ?
 b DB ?
 str DB 'Enter A:$'
 str2 DB 'Enter B:$'
 str3 DB 'The Larger Value is:$'
 .CODE
 
 MAIN PROC
    MOV AX,@Data
    MOV DS,AX
    LEA DX,str
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    MOV a,AL   
    MOV DL,10
    MOV AH,02H
    INT 21H
    MOV DL,13
    INT 21H
    LEA DX,str2
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    MOV b,AL
    
    CMP a,AL
    JGE LARGE
    
    MOV DL,10
    MOV AH,02H
    INT 21H
    MOV DL,13
    INT 21H
    LEA DX,str3
    MOV AH,09H
    INT 21H
    MOV AH,02H
    MOV DL,b
    INT 21H
    JMP EXIT

LARGE:
     MOV DL,10
    MOV AH,02H
    INT 21H
    MOV DL,13
    INT 21H 
    LEA DX,str3
    MOV AH,09H
    INT 21H
    MOV AH,02H
    MOV DL,a
    INT 21H
EXIT:    
    
    
    
 MAIN ENDP




