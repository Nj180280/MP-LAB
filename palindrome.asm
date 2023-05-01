dosseg
.model small
.stack 100h
.data
string db 'madam'
msg1 db 'not palindrome$'
msg2 db 'palindrome$'
.code
main proc
mov ax,@data
mov ds,ax
lea si,string
mov cx,5
l1:
mov bx,[si]
push bx
inc si
loop l1
mov cx,3
lea si,string
l2:
pop ax
mov bl,[si]
cmp al, bl
jne not_palindrome
inc si
loop l2
lea dx,msg2
mov ah,9
int 21h
jmp exit_prog
not_palindrome:
lea dx,msg1
mov ah,9
int 21h
exit_prog:
mov ah,4ch
int 21h
main endp
end main
