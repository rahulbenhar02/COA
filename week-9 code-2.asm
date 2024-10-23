org 100h

jmp start
input db "Enter the single Digit: $"
output1 db 0Dh,0Ah,"The Digit is Odd $"
output2 db 0Dh,0Ah,"The Digit is Even $"
start:

mov dx, offset input
mov ah, 09h
int 21h

mov ah, 01h
int 21h
sub al, 30h 

mov bl, 02h
div bl

cmp ah, 0h
je even
cmp ah, 01h
je odd

odd:
mov dx, offset output1
mov ah, 09h
int 21h  
call endprogram

even:
mov dx, offset output2
mov ah, 09h
int 21h
call endprogram

endprogram:
mov ah, 4Ch
int 21h

ret