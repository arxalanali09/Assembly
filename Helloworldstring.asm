dosseg
.model small
.stack 100h
.data
var1 db, 'Hello world$'
.code
main proc
mov ax,@data
mov ds,ax
mov ax,offset var1
mov ah,9
int 21h 
mov ah,4ch
int 21h
main endp
end main
