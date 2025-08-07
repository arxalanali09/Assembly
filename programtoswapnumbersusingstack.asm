dosseg
.model small
.stack 100h
.data
.code 
main proc 
mov ax,'2'
push ax
mov bx,'4'
push bx
pop ax ;moves 4 to ax 
mov ah,2
int 21h
pop bx ;moves 2 to ax
mov ah,2
int 21h
mov ah,4ch
int 21h
main endp
end main