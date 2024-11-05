org 100h

jmp start:
output db "The Alphabets from A-Z: $"    

start:
mov dx, offset output
mov ah, 09h
int 21h

mov cx, 26
mov al, 'A'

print_alpha:
    mov dl, al
    mov ah, 02h
    int 21h
    
    inc al
    loop print_alpha
    
mov ah, 4Ch
int 21h    




