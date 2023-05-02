.global _start

.section .text
_start:
    movl (num), %ebx  # ebx = num 
    xor %rax, %rax   # eax = i for loop 
    xor %dl, %dl     # dx = take byte from mem
    # lea source, %rcx   # rcx = mem spot of source 
    # lea destination, %rdi # rdi = mem spot of dest
    cmp $0, %ebx  
    jl negative_HW2
    je end_HW2
    movsx %ebx, %rbx


loop_HW2:
    cmp %rbx, %rax
    jge end_HW2

    mov source(%rax), %dl

    lea destination(%rax), %rcx
    
    mov %dl, (%rcx)
    inc %rax
    
    
    jmp loop_HW2

negative_HW2:
    movl %ebx, (destination)
  

end_HW2:


bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall



.section .data
  num: .int 29
  source: .byte 105,40,140,182,243,195,139,136,109,12,153,177,19,106,225,37,63,142,112
  destination: .byte 44,92,37,141,94,116,179,13,171,221
               .zero 19
               .byte 1



