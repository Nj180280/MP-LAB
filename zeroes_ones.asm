dosseg
.model small
.stack 100h
.data
num db 11001010b ; the 8-bit number to count zeroes and ones for
zeroes db 0     ; the number of zeroes, initialized to 0
ones db 0       ; the number of ones, initialized to 0

.code
main proc
mov ax, @data   ; set up the data segment
mov ds, ax

mov bl, num     ; load the number into BL

mov cx, 8       ; initialize loop counter to 8
count_bits:
test bl, 1      ; test the least significant bit of BL
jz bit_zero     ; jump to bit_zero if bit is 0
inc ones        ; increment ones count
jmp next_bit    ; jump to next_bit

bit_zero:
inc zeroes      ; increment zeroes count

next_bit:
shr bl, 1       ; shift right to check the next bit
loop count_bits ; decrement loop counter and loop if not zero

mov ah, 02h     ; print the counts
mov dl, zeroes
add dl, 48      ; convert to ASCII character
int 21h
mov dl, ','
int 21h
mov dl, ones
add dl, 48      ; convert to ASCII character
int 21h

mov ah, 4Ch     ; exit the program
int 21h

main endp
end main
