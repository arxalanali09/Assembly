dosseg
.model small
.stack 100h
.data
.code
main proc 
mov bl,5
mov cl,1
SUB bl,cl
mov dl,bl
ADD dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h
main endp
end main