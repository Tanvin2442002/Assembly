


.MODEL SMALL
.STACK 100H
.DATA

ARR DB 5 dup(?)  ; ARR DB 1,2,3,4
STR DB 'Enter The Value:$'
A DB 3
B DB 8
.CODE

MAIN PROC
    
    MOV AX,@Data
    MOV DS,AX
    LEA DX, STR
    MOV AH,09H
    INT 21H
    LEA BX, ARR
    MOV CX,5
    
INP:
    MOV AH,01H
    INT 21H
    MOV [BX],AL
    DEC CX
    INC BX
    CMP CX,00
    JNE INP   ; JGE
    
    LEA BX,ARR
    MOV CX,5
PRINT:
    MOV DL,[BX]
    MOV AH,02H
    INC BX
    DEC CX
    INT 21H
    CMP CX,00
    JNE PRINT
    
    MOV AL,A
    MOV A,2
    MUL A
    NEG AL
    MOV A,AL
    MOV AL,B
    ADD AL,A
    MOV A,AL
    MOV AH,02H
    MOV DL,A
    ADD DL, 30h
    INT 21H
    
MAIN ENDP