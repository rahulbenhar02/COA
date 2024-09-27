org 100h 
mov dx, offset msg_input 
mov ah, 09h 
int 21h 
 
mov dx, offset buffer 
mov ah, 0Ah 
int 21h 
 
mov dx, offset msg_output 
mov ah, 09h 
int 21h 
 
mov dx, offset buffer+2 
mov ah, 09h 
int 21h 
 
mov ah, 4ch 
int 21h 
 
msg_input db 'Enter a String : $' 
msg_output db 0dh, 0ah, 'The Entered String is: $' 
buffer db 255 
 db ? 
 db 255 dup('$') 
 
end 

