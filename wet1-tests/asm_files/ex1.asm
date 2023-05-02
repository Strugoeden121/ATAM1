.global _start

.section .data
  num: .quad 0
  Bool: .byte 0

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

bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall
