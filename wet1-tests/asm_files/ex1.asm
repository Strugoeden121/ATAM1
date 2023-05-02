.global _start

.section .text
_start:
    xor %al, %al
    movq (num), %rbx
loop_HW1:
    shr $1, %rbx
    jae j_inc_HW1
    inc %al
j_inc_HW1:
    test %rbx, %rbx
    jnz loop_HW1
    mov %al, (Bool)


