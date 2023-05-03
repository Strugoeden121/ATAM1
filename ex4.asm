.global _start

.section .text
_start:
#your code here
    # TODO - add check source isn't 0 and add to regs
    xor %r10, %r10
    
    mov (Value), %r8d  # r8d = value
    lea Source, %rcx # rcx = source mem
    mov (%rcx), %r12 # r12 = source node
    cmp %r10, (head)
    je END_HW1 
    mov (head), %rax # rax = current node mem
    # add check if is non existing
    mov (%rax), %r9d  # r9d = current node value 
    cmp %r9d, %r8d # check if first-node is the value
    je CHANGE_NODE_Head_PREV_HW1
LOOP_HW1:
    mov %rax, %r11 # r11 = pre node
    mov 4(%rax), %rax # rax move to next
    cmp %rax, %r10 # if current node is Null 
    je END_HW1
    mov (%rax), %r9d  # update current node value 
    cmp %r9d, %r8d # check if current-node is the value
    je CHANGE_NODE_PREV_HW1
    jmp LOOP_HW1    

CHANGE_NODE_Head_PREV_HW1:
    mov %r12, (head)
    jmp CHANGE_BACK_HW1
    

CHANGE_NODE_PREV_HW1:
    mov %r11, %r15 # r15 = temp with pre-node 
    add $4, %r15 # pre.next
    cmp %r11, %r12
    je NEIGHBORS_SOURCE_BEFORE_VALUE_HW1 
    mov %r12, (%r15) # pre.next = source  (source is not before-neighbor value)
    
    # from here HANDLE_VALUE - need to update pre of source to be current with Value

NEIGHBORS_SOURCE_BEFORE_VALUE_HW1:
    


CHANGE_BACK_HW1:
    mov 4(%rax), %r13 # r13 = node after current with Value
    mov 4(%r12), %r14 # r14 = node after Source


END_HW1:
