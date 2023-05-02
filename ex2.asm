.global _start

.section .text
_start:
    movl (num) %ebx  # ebx = num 
    xor %eax, %eax   # eax = i for loop 
    xor %dx, %dx     # dx = take byte from mem
    lea source, %rcx   # rcx = mem spot of source 
    test %ebx, %ebx  
    js negative_HW2


loop_HW2:
    cmp %eax, %ebx
    jge end_HW2

    movb (%rcx, %eax), %dx 
    inc %eax
    movb %dx, (destination)
    
    j loop_HW2

negative_HW2:
    movl %ebx, (destination)
  

end_HW2:
