org 100h 
 
mov dx, offset msg_input 
mov ah, 09h 
int 21h 
 
mov ah, 01h 
int 21h 
mov cl, al 
 
mov dx, offset msg_output 
mov ah, 09h 
int 21h 
 
mov dl, cl 
mov ah, 02h 
int 21h 
jmp endprogram 
 
endprogram: 
mov ah, 4ch 
int 21h 
 
msg_input db 'Enter any character : $' 
msg_output db 0dh, 0ah, 'The entered character is: $' 
 
end 