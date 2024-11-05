org 100h                

jmp start
output db "The Digits from 0 - 9: $" 

start:
mov dx, offset output
mov ah, 09h        ; Display the message
int 21h

mov cx, 10
mov al, '0'

print_loop:
    mov dl, al
    mov ah, 02h
    int 21h        ; Print the digit in DL
    inc al
    loop print_loop

mov ah, 4ch        ; Exit program
int 21h
