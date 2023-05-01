dosseg
.model small
.stack 100h
.data
num dw 5      ; the number to calculate the factorial of
fact dw 1     ; the factorial result, initialized to 1
.code
main proc
mov ax, @data   ; set up the data segment
mov ds, ax

mov cx, num     ; load the number into CX
mov ax,num
dec cx          ; decrement CX by 1

loop1:
mul cx          ; multiply AX by CX
dec cx          ; decrement CX by 1
jnz loop1       ; jump to loop1 if CX is not zero

mov fact, ax    ; store the result in fact

mov ah, 09h     ; print the result
lea dx, [fact]
int 21h

mov ah, 4Ch     ; exit the program
int 21h

main endp
end main
