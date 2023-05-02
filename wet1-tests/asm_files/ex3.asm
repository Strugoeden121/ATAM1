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
    xor %r8, %r8


LOOP_HW3:
    mov (%rsi, %rax, 4), %r8
    cmp %r8 , (%r9, %rbx, 4) 
    jge ARR2_HW3
    cmp (%rsi, %rax, 4) , %r11d # input from arr1- check if was inputed before
    je END_ROUND_HW3
    mov (%rsi, %rax, 4), %r11d 
    mov %r11d, (%r10, %rcx, 4)
    inc %rax

ARR2_HW3:
    cmp (%r9, %rbx, 4) , %r11d # input from arr2- check if was inputed before
    je END_ROUND_HW3
    mov (%r9, %rbx, 4), %r11d 
    mov %r11d, (%r10, %rcx, 4)
    inc %rbx

END_ROUND_HW3:
    inc %rcx
    xor %r8, %r8
    cmp %r8, (%rsi, %rax, 4)
    jne LOOP_HW3
    xor %r8, %r8
    cmp %r8, (%r9, %rbx, 4)
    jne LOOP_HW3

END_HW3:
