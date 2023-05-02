.global _start

.section .text
_start:
#your code here
    lea array1, %rsi
    lea array2, %r9
    lea mergedArray, %r10

    xor %rax, %rax # index arr1
    xor %rbx, %rbx # index arr2
    xor %rcx, %rcx # index merged
    xor %r11d, %r11d # last inputed to merged 
    xor %r8d, %r8d
    xor %r12, %r12


LOOP_HW1:
    mov (%rsi, %rax, 4), %r8d
    cmp %r8d , (%r9, %rbx, 4) 
    jge ARR2_HW1
    mov %rax, %r12
    inc %rax
    cmp (%rsi, %r12, 4) , %r11d # input from arr1- check if was inputed before
    je END_ROUND_HW1
    dec %rax
    mov (%rsi, %rax, 4), %r11d 
    mov %r11d, (%r10, %rcx, 4)
    inc %rax
    inc %rcx
    jmp END_ROUND_HW1

ARR2_HW1:
    mov %rbx, %r12
    inc %rbx
    cmp (%r9, %r12, 4) , %r11d # input from arr2- check if was inputed before
    je END_ROUND_HW1
    dec %rbx
    mov (%r9, %rbx, 4), %r11d 
    mov %r11d, (%r10, %rcx, 4)
    inc %rbx
    inc %rcx

END_ROUND_HW1:
    xor %r8d, %r8d
    cmp %r8d, (%rsi, %rax, 4)
    jne LOOP_HW1
    xor %r8d, %r8d
    cmp %r8d, (%r9, %rbx, 4)
    jne LOOP_HW1

END_HW1:
    xor %r11d, %r11d
    mov %r11d, (%r10, %rcx, 4)
