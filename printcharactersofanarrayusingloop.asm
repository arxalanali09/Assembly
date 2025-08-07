dosseg
.model small
.stack 100h
.data
Arr1 db 'a','b','c'
.code
main proc 
mov ax,@data
mov ds,ax
mov dx,offset Arr1
mov cx,3
L1:
mov dx,[si]
mov ah,2
int 21h
inc si
loop L1
mov ah,4ch
int 21h

main endp
end main