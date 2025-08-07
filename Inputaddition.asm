dosseg
.model small
.stack 100h
.data
.code
main proc 
mov ah,1
int 21h
mov bl,al
mov ah,1
int 21h
mov cl,al
ADD bl,cl
mov dl,bl
ADD dl,48
mov ah,2
int 21h
mov ah,4ch
main endp
end main
