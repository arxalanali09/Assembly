dosseg
.model small
.stack 100h
.data
.code
main proc
mov cx,26
mov dl,65
L1:
mov ah,2
int 21h
inc dl
loop L1
mov ax,10
mov ah,2
int 21h
mov ax,13
mov ah,2
int 21h
mov cx,26
mov dl,97
mov ah,2
l2:
mov ah,4ch
int 21h 
inc dl
loop l2
main endp
end main