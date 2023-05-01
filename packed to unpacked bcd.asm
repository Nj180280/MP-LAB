data segment 
packed db 13h 
unpacked db 0000h
data ends 
code segment 
assume cs:code, ds:data
start: 
mov ax,data
mov ds,ax 
mov al,packed
and al,0Fh 
mov bl,al ; move al value 03 to bl 
mov al,packed; now al is 13 
mov cl,04h; we have to rotate 4 times , cl is used as counter
and al,0F0h
rol al,cl ; 04 will be stored in al now 
mov bh,al 
mov ax,bx ; move final result to ax register
code ends 
end start 

