org 100h 
jmp start
msg1: db "quotient of two 8-bit numbers is: " ,0Dh,0Ah,24h
msg: db "",0Dh,0AH,24h 
msg2: db "remainder of two 8-bit numbers is: " ,0Dh,0Ah,24h 
start:
mov dx,msg1
mov ah,09h
int 21h
mov ax,0FFh
mov bl,07h
div bl
mov bl,al 
mov bh,ah
and al,0F0h
shr al,4
add al,30h
cmp al,39h
jle first
add al,7h
first:
 mov dl,al
 mov ah,02h
 int 21h
mov al,bl
and al,0Fh
add al,30h
cmp al,39h
jle second
add al,7h
second:
 mov dl,al
 mov ah,02h
 int 21h
mov dx,msg
mov ah,09h
int 21h
mov dx,msg2
mov ah,09h
int 21h
mov bl,bh
and bl,0F0h
shr bl,4
add bl,30h
cmp bl,39h
jle third
add bl,7h
third:
 mov dl,bl
 mov ah,02h
 int 21h
mov bl,bh
and bl,0Fh
add bl,30h 
cmp bl,39h
jle fourth
add bl,7h
fourth:
 mov dl,bl
 mov ah,02h
 int 21h
ret