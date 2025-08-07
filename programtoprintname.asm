dosseg
.model small
.stack 100h
.data
.code
main proc
mov dl,'A'
mov ah,2
int 21h

mov dl,"L"
mov ah,2
int 21h

mov dl,"I"
mov ah,2
int 21h

mov ah,4ch
main endp
end main