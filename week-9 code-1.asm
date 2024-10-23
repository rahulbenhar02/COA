org 100h         

start:
    mov ah, 01h      
    int 21h         
    sub al, '0'      
    mov bl, al       

   
    mov ah, 01h     
    int 21h         
    sub al, '0'   

   
    cmp bl, al      
    je equal       

    mov dx, offset notEqualMsg 
    mov ah, 09h     
    int 21h        
    jmp done        

equal:
   
    mov dx, offset equalMsg    
    mov ah, 09h     
    int 21h         

done:
   
    mov ah, 4Ch    
    int 21h 
    

equalMsg db 'Equal$', 0
notEqualMsg db 'Not Equal$', 0