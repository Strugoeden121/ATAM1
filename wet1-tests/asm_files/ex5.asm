.global _start

.section .text
_start:
#your code here
    mov (new_node), %r8  # r8 = new node value
# before loop
    xor %r10, %r10
    lea new_node, %rcx # rcx = new Node mem
    cmp %r10, (root)
    je ROOT_INSERT_HW1
    mov (root), %rax # rax = current node mem
LOOP_HW1:

    cmp (%rax), %r8
    je END_HW1
    jg RIGHT_HM1
    # GOING LEFT
    cmp %r10, 8(%rax)
    jne LEFT_SON_LOOP_HW1
    mov %rcx, 8(%rax)
    jmp END_HW1

LEFT_SON_LOOP_HW1:
    mov 8(%rax), %rax
    jmp LOOP_HW1

RIGHT_HM1:
    cmp %r10, 16(%rax)
    jne RIGHT_SON_LOOP_HW1
    mov %rcx, 16(%rax)
    jmp END_HW1
RIGHT_SON_LOOP_HW1:
    mov 16(%rax), %rax
    jmp LOOP_HW1


ROOT_INSERT_HW1:
    mov %rcx, (root)

END_HW1:

