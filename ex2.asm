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
    jl negative_HW2
    je end_HW2
    movsx %ebx, %rbx
    cmp %r9, %rsi
    jge loop_B_HW2




loop_F_HW2:
    cmp %rbx, %rax
    jge end_HW2
    mov source(%rax), %dl
    lea destination(%rax), %rcx
    mov %dl, (%rcx)
    inc %rax 
    jmp loop_F_HW2

loop_B_HW2:
    xor %r10, %r10 
    cmp %rbx, %r10
    jge end_HW2
    dec %rbx
    mov source(%rbx), %dl
    lea destination(%rbx), %rcx
    mov %dl, (%rcx)    
    jmp loop_B_HW2

negative_HW2:
    movl %ebx, (destination)
  

end_HW2:
