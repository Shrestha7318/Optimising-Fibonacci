.global fibonacci
.global fibonacci_sequence

.section .bss
.balign 4
fibonacci_sequence: .space 400

.section .text
.balign 4
fibonacci:
    MOV R0, #0      // Fib(n-2)
    MOV R1, #1      // Fib(n-1)
    LDR R2, =fibonacci_sequence
    STR R0, [R2], #4
    STR R1, [R2], #4

    MOV R3, #2
    LDR R4, [sp]

loop_min_mem:
    CMP R3, R4
    BGE end_loop

    ADD R5, R0, R1
    STR R5, [R2], #4

    // Update R0 and R1 for the next iteration
    MOV R0, R1
    MOV R1, R5

    ADD R3, R3, #1
    B loop_min_mem

end_loop:
    BX LR

.section .note.GNU-stack,"",%progbits 
