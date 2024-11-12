.STACK 100H 

.DATA 
    prompt      DB 'Enter a single-digit number for the Fibonacci term (n): $' 
    resultMsg   DB 'The Fibonacci term is: $' 
    result      DW ? 
    newline     DB 13, 10, '$' 

.CODE 
MAIN PROC 
    ; Initialize data segment
    MOV AX, @DATA 
    MOV DS, AX 

    ; Display the prompt message
    MOV DX, OFFSET prompt 
    MOV AH, 09H 
    INT 21H 

    ; Read single-digit input
    MOV AH, 01H 
    INT 21H 
    SUB AL, '0' ; Convert ASCII to numeric
    MOV CL, AL 

    ; Check special cases for n = 0 or n = 1
    CMP CL, 0 
    JE FIB_ZERO 
    CMP CL, 1 
    JE FIB_ONE 

    ; Calculate Fibonacci for n > 1
    MOV AL, 0       ; Fib(0)
    MOV BL, 1       ; Fib(1)
    MOV CH, 2       ; Counter for loop (starting from Fib(2))
FIB_LOOP: 
    ADD AL, BL      ; Calculate next Fibonacci term
    MOV DL, AL      ; Temporary store in DL
    MOV AL, BL      ; Move current Fib(n-1) to Fib(n-2)
    MOV BL, DL      ; Move next Fibonacci term to Fib(n-1)
    INC CH          ; Increment loop counter
    CMP CH, CL      ; Check if reached desired term
    JNE FIB_LOOP 

    ; Store the result in BX
    MOV result, BX 

    ; Display the result
    MOV DX, OFFSET newline 
    MOV AH, 09H 
    INT 21H 
    MOV DX, OFFSET resultMsg 
    MOV AH, 09H 
    INT 21H 
    MOV AX, result 
    CALL DISPLAY_NUMBER 

    ; Exit the program
    MOV AH, 4CH 
    INT 21H 

; Subroutine: DISPLAY_NUMBER
DISPLAY_NUMBER PROC 
    MOV BX, 10       ; Base 10 divisor
    XOR CX, CX       ; Clear counter
DIVIDE_LOOP: 
    XOR DX, DX       ; Clear DX for division
    DIV BX           ; AX / BX, remainder in DX
    PUSH DX          ; Save remainder on stack
    INC CX           ; Increment digit count
    TEST AX, AX      ; Check if quotient is zero
    JNZ DIVIDE_LOOP 

DISPLAY_DIGITS: 
    POP DX           ; Retrieve digit from stack
    ADD DL, '0'      ; Convert to ASCII
    MOV AH, 02H      ; Display character
    INT 21H 
    LOOP DISPLAY_DIGITS ; Repeat for all digits

    RET 
DISPLAY_NUMBER ENDP 

; Special case: Fibonacci(0)
FIB_ZERO: 
    MOV result, 0 
    JMP DISPLAY_RESULT 

; Special case: Fibonacci(1)
FIB_ONE: 
    MOV result, 1 
    JMP DISPLAY_RESULT 

; Display result subroutine
DISPLAY_RESULT: 
    MOV DX, OFFSET newline 
    MOV AH, 09H 
    INT 21H 
    MOV DX, OFFSET resultMsg 
    MOV AH, 09H 
    INT 21H 
    MOV AX, result 
    CALL DISPLAY_NUMBER 
    MOV AH, 4CH 
    INT 21H 

END MAIN
