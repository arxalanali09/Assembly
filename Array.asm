dosseg
.model small
.stack 100h
.data
Arr1 db 1,2,3,4
.code
main proc 
mov ax,@data
mov ds,ax
mov si,offset Arr1
mov dx,[si]
mov ah,2
int 21h
inc si
mov ah,2
int 21h
mov ah,4ch
int 21h
main endp
end main