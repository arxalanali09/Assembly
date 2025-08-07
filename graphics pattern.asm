dosseg
.model small
.stack 100h
.DATA
    message DB 'Here is the blue parallelogram:', 0
    height EQU 10
    base EQU 20

.CODE
MAIN PROC
    ; Set video mode to 80x25 text mode
    MOV AH, 0
    MOV AL, 3
    INT 10h

    ; Set text color to blue
    MOV AH, 06h
    MOV AL, 0  ; Intense blue
    MOV BH, 0  ; Normal intensity
    MOV BL, 0  ; No blinking
    MOV CX, 0  ; Starting column
    MOV DX, 0  ; Starting row
    INT 10h

    ; Display the message
    LEA DX, message
    MOV AH, 9
    INT 21h

    ; Calculate starting position
    MOV CX, 80 / 2 - (base / 2)
    MOV DX, 10  ; Starting row

    ; Draw the parallelogram
    MOV BX, 0
    DRAW_LOOP:
        MOV AH, 2
        MOV DL, '*'
        INT 21h
        INC DX
        LOOP DRAW_LOOP

        MOV AH, 2
        MOV DL, 13
        INT 21h
        MOV DL, 10
        INT 21h

        INC CX
        INC BX
        CMP BX, height
        JBE DRAW_LOOP

    ; Wait for a key press
    MOV AH, 1
    INT 21h

    ; Return to DOS
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN