.model small
.stack 100h
.data
.code
Main proc ;description
 
    mov dl,"A"
    mov al,2
    int 21h
    mov ah,4ch
    int 21h
main endp
end main

    
