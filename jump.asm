dosseg
.model small
.stack 100h
.data
msg1 db "Numbers are equal$"
msg2 db "numbers are not equal$"
.code 
main proc 
mov ax, @data
mov ds,ax
mov dl,3
mov al,9

int 21h
cmp al,dl
je L1
mov dx,offset msg1
mov ah,9
int 21h
L1:
mov dx,offset msg2
mov ah,9
int 21h
main endp
end main
