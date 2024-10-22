ORG 100h
jmp start

input1 db "Enter the first Digit: $"
input2 db 0Dh,0Ah,"Enter the second Digit: $"
output db 0Dh,0Ah,"The Sum of Two Digits is: $"

start:
    mov dx, offset input1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    mov bl, al

    mov dx, offset input2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    mov bh, al

    sub bl, 30h
    sub bh, 30h
    
    add bl, bh   

    mov dx, offset output
    mov ah, 09h
    int 21h
        
    add bl, 30h        
    mov dl, bl
    mov ah, 02h
    int 21h


    mov ah, 4Ch
    int 21h

ret