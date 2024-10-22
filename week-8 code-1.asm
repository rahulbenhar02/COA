org 100h

mov ah, 02h       
mov dl, '2'      
int 21h           

mov ah, 02h       
mov dl, '3'       
int 21h          

mov ah, 4Ch       
int 21h           

ret