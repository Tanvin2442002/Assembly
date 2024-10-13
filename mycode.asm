


.MODEL SMALL
.STACK 100H
.DATA

ARR DB 5 dup(?)  ; ARR DB 1,2,3,4
STR DB 'Enter The Value:$'
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
    
MAIN ENDP