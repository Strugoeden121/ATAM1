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
    mov (%rax), %rdi
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

bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall

.section .data
  root: .quad node_0
  node_0:
            .quad 767
            .quad node_1
            .quad 0
  node_1:
            .quad 630
            .quad node_2
            .quad 0
  node_2:
            .quad 313
            .quad node_4
            .quad node_3
  node_4:
            .quad 57
            .quad 0
            .quad 0
  node_3:
            .quad 390
            .quad 0
            .quad node_5
  node_5:
            .quad 491
            .quad 0
            .quad 0
  new_node: .quad 504, 0, 0

