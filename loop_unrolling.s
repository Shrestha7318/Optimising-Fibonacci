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

loop:
    CMP R3, R4
    BGE end_loop

    LDR R0, [R2, #-8]
    LDR R1, [R2, #-4]
    ADD R5, R0, R1
    STR R5, [R2], #4

    ADD R3, R3, #1
    CMP R3, R4
    BGE end_loop

    LDR R0, [R2, #-8]
    LDR R1, [R2, #-4]
    ADD R5, R0, R1
    STR R5, [R2], #4

    ADD R3, R3, #1
    B loop

end_loop:
    BX LR

.section .note.GNU-stack,"",%progbits
