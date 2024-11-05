org 100h

jmp start
output db "The Alphabets from Z - A: $"

start:

mov dx, offset output
mov ah, 09h
int 21h        

mov cx, 26
mov al, 'Z'

print_reverse:
    mov dl, al
    mov ah, 02h
    int 21h      

    dec al       
    loop print_reverse   

mov ah, 4Ch     
int 21h
