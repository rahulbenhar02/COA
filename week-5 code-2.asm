org 100h
jmp start
msg1 : db "Remainder of two 16-bit numbers is: " ,0Dh,0Ah,24h 
msg : db "" ,0Dh,0Ah,24h
msg2 : db "Quotient of two 16-bit numbers is: " ,0Dh,0Ah,24h
start:
mov dx,msg1
mov ah,09h
int 21h
mov dx,0000h
mov ax,0FFFh
mov bx,0091h
div bx
mov bx,ax
mov cx,dx
mov ah,ch
and ah,0F0h
shr ah,4
add ah,30h
cmp ah,39h
jle first
add ah,7h
first:
 mov dl,ah
 mov ah,02h
 int 21h
mov ah,ch
and ah,0Fh
add ah,30h
cmp ah,39h
jle second
add ah,7h
second:
 mov dl,ah
 mov ah,02h
 int 21h 
mov ah,cl
and ah,0F0h
shr ah,4
add ah,30h
cmp ah,39h
jle third
add ah,7h
third:
 mov dl,ah
 mov ah,02h
 int 21h
mov ah,cl
and ah,0Fh
add ah,30h
cmp ah,39h
jle fourth
add ah,7h
fourth:
 mov dl,ah
 mov ah,02h
 int 21h
mov dx,msg
mov ah,09h
int 21h 
mov dx,msg2
mov ah,09h
int 21h
mov ah,bh
and ah,0F0h
shr ah,4
add ah,30h
cmp ah,39h
jle fifth
add ah,7h
fifth:
 mov dl,ah
 mov ah,02h
 int 21h
mov ah,bh
and ah,0Fh
add ah,30h
cmp ah,39h
jle sixth
add ah,7h
sixth:
 mov dl,ah
 mov ah,02h
 int 21h
mov ah,bl
and ah,0F0h
shr ah,4
add ah,30h
cmp ah,39h
jle seventh
add ah,7h
seventh:
 mov dl,ah
 mov ah,02h
 int 21h 
mov ah,bl
and ah,0Fh
add ah,30h
cmp ah,39h
jle eigth
add ah,7h
eigth:
 mov dl,ah
 mov ah,02h
 int 21h
mov ah,4ch
int 21h
