org 100h
jmp start  

input db "Enter The Digit:$ "  
output db 0Dh,0Ah,"The Digit is: $"
error_msg db 0Dh,0Ah,"The Entered Character is Not a Digit!$"    

start:                                                           
mov dx, offset input
mov ah, 09h
int 21h

mov ah, 01h 
int 21h   
mov bl, al 

cmp al, '0'
JL error
cmp al, '9'
JG error 

mov dx, offset output
mov ah, 09h
int 21h 

mov dl, bl
mov ah, 02h
int 21h  
call endprogram
  

error:
mov dx, offset error_msg
mov ah, 09h
int 21h

endprogram:
mov ah, 4ch
int 21h
 
end