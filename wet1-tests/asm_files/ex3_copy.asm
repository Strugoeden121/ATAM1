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


LOOP_HW3:
    mov (%rsi, %rax, 4), %r8d
    cmp %r8d , (%r9, %rbx, 4) 
    jge ARR2_HW3
    mov %rax, %r12
    inc %rax
    cmp (%rsi, %r12, 4) , %r11d # input from arr1- check if was inputed before
    je END_ROUND_HW3
    dec %rax
    mov (%rsi, %rax, 4), %r11d 
    mov %r11d, (%r10, %rcx, 4)
    inc %rax
    inc %rcx
    jmp END_ROUND_HW3

ARR2_HW3:
    mov %rbx, %r12
    inc %rbx
    cmp (%r9, %r12, 4) , %r11d # input from arr2- check if was inputed before
    je END_ROUND_HW3
    dec %rbx
    mov (%r9, %rbx, 4), %r11d 
    mov %r11d, (%r10, %rcx, 4)
    inc %rbx
    inc %rcx

END_ROUND_HW3:
    xor %r8d, %r8d
    cmp %r8d, (%rsi, %rax, 4)
    jne LOOP_HW3
    xor %r8d, %r8d
    cmp %r8d, (%r9, %rbx, 4)
    jne LOOP_HW3

END_HW3:
    xor %r11d, %r11d
    mov %r11d, (%r10, %rcx, 4)




bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall

.section .data
  array1: .int 94,94,88,87,85,82,81,77,76,74,68,67,65,63,53,41,37,34,28,22,20,16,13,8,5,0
  array2: .int 68,65,21,0
  mergedArray: .zero 26



