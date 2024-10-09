org 100h

JMP start

input1 db "Enter the First Number: $"
input2 db 0Dh,0Ah,"Enter the Second Number: $"
output db 0Dh,0Ah,"The Difference is: $"

start:

    mov dx, offset input1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, 30h 
    mov bl, al   

    mov dx, offset input2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h 
    
    sub bl, al

    mov dx, offset output
    mov ah, 09h
    int 21h

    add bl, 30h

    mov dl, bl
    mov ah, 02h
    int 21h

    ret