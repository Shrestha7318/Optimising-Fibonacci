.global fibonacci
.global fibonacci_sequence

.section .bss
.balign 4
fibonacci_sequence: .space 400

.section .text
.balign 4
fibonacci:
    MOV R0, #0
    MOV R1, #1
    LDR R2, =fibonacci_sequence
    STR R0, [R2], #4
    STR R1, [R2], #4

    MOV R3, #2
    LDR R4, [sp]

loop_pipeline:
    CMP R3, R4
    BGE end_loop

    ADD R5, R0, R1    // Calculate next Fibonacci value
    STR R5, [R2], #4  // Store the result in memory

    ADD R3, R3, #1    // Increment the loop counter
    MOV R0, R1        // Update R0 to the previous R1
    MOV R1, R5        // Update R1 to the new Fibonacci value

    B loop_pipeline

end_loop:
    BX LR

.section .note.GNU-stack,"",%progbits
