dosseg
.model small
.stack 100h
.data
a dw '2'
b dw '3'
.code
Main proc
mov ax,@data
mov ds,ax
mov ax,a
mov bx,b 
add bx,ax
mov dx,bx
sub dx,48
mov ah,2
int 21h
mov ah,4ch
int 21h
main endp
end main 
