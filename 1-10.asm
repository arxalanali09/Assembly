dosseg
.model small
.stack 100h
.data
.code
main proc
mov cx,10
mov dx,48
L1:
mov ah,4ch
int 21h
ADD dx,1
Loop L1
main endp
end main