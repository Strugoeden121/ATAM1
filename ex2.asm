.global _start

.section .text
_start:
    movl (num), %ebx  # ebx = num 
    lea destination, %rsi
    lea source, %r9
    xor %rax, %rax   # eax = i for loop 
    xor %dl, %dl     # dx = take byte from mem
    # lea source, %rcx   # rcx = mem spot of source 
    # lea destination, %rdi # rdi = mem spot of dest
    cmp $0, %ebx  
    jl negative_HW1
    je end_HW1
    movsx %ebx, %rbx
    cmp %r9, %rsi
    jge loop_B_HW1
