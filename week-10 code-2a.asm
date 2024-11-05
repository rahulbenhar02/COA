org 100h

jmp start
output db "The Numbers from 9 - 0: $"

start:

mov dx, offset output
mov ah, 09h
int 21h

mov cx, 10
mov al, '9'

print_reverse:
    mov dl, al
    mov ah, 02h
    int 21h
    
    dec al
    loop print_reverse

mov ah, 4Ch
int 21h    

ret




