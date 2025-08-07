dosseg
.model small
.stack 100h
.data
MsgEq db 'numbers are equal$'
MsgUneq db 'numbers are unequal$'
MsgGr db 'Number is greater than second number$'
MsgLs db 'Number is lesser than second number$'
.code
main proc 
mov ax, @data
mov ds,ax
mov ah,1
int 21h
mov bl,al
mov ah,1
mov cl,al
int 21h
L1:
cmp bl,cl
je equal
mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h
mov dx,offset MsgUneq
mov ah,9
int 21h
mov bl,cl
jg greater
mov dx,offset MsgLs
mov ah,9
int 21h
jmp PRINT
Greater:
mov dx, offset MsgGr
mov ah,9
int 21h
jmp PRINT
Equal:
mov ax,offset MsgEq
mov ah,9
int 21h
jmp PRINT
PRINT:
mov ah,4ch
int 21h
main endp
end main