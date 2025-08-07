.model small
.stack 100h
.data
.code
main proc
    ; Set video mode to 13h (320x200, 256-color graphics mode)
    mov ax, 13h
    int 10h
    
    ; Draw rectangle of 25x25 (starting at top-left corner)
    ; Rectangle background color (blue, color 1Fh)
    mov cx, 25           ; Height of rectangle
    mov dx, 25           ; Width of rectangle
    mov bh, 1Fh          ; Rectangle color (blue)
    call draw_rectangle
    
    ; Draw square inside the 25x25 rectangle (starting at 5,5 inside rectangle)
    mov cx, 10           ; Height of square
    mov dx, 10           ; Width of square
    mov bh, 4Fh          ; Square color (yellow)
    call draw_square
    
    ; Exit to DOS
    mov ah, 4Ch
    int 21h

main endp