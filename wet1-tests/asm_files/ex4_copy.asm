.global _start

.section .text
_start:
#your code here
    # TODO - add check source isn't 0 and add to regs
    xor %r10, %r10
    mov $head, %rdi
    
    
    mov (Value), %r8d  # r8d = value int
    lea Source, %rcx # rcx = source mem
    mov (%rcx), %r12 # r12 = source node
    cmp %r10, (head)
    je END_HW1 
    mov (head), %rax # rax = current node value mem
    mov $head, %r11
    # add check if is non existing
    mov (%rax), %r9d  # r9d = current node value 
    cmp %r9d, %r8d # check if first-node is the value
    je CHANGE_NODE_PREV_SOURCE_HW1
LOOP_HW1:
    mov %rax, %r11 # r11 = pre node
    mov 4(%rax), %rax # rax move to next
    cmp %rax, %r10 # if current node is Null 
    je END_HW1
    mov (%rax), %r9d  # update current node value 
    cmp %r9d, %r8d # check if current-node is the value
    je CHANGE_BACK_HW1
    jmp LOOP_HW1 

CHANGE_NODE_PREV_SOURCE_HW1:
# ---------find source pre---------
    mov $head, %rbx # rbx = temp to find before source, starts at head
    mov (head), %rdx # rdx = current node to find source
FIND_PREV_SOURCE_HM1:
    cmp %r12, %rdx # if source==current
    je CHANGE_NODE_PREV_VALUE_HW1
    mov %rdx, %rbx
    add $4, %rdx
    mov (%rdx), %rdx
    jmp FIND_PREV_SOURCE_HM1   

CHANGE_NODE_HEAD_PREV_HW1:
    mov %r12, (head)
    mov 4(%rax), %r13 # r13 = node after current with Value
    mov 4(%r12), %r14 # r14 = node after Source
    jmp AFTER_VALUE_HW1
    

CHANGE_NODE_PREV_VALUE_HW1:
    cmp %rax, %r12 # id source = curr value node
    je END_HW1
    mov %r11, %r15 # r15 = temp with pre-node 
    cmp $head, %r11 # if head before-neighboor to value
    je CHANGE_NODE_HEAD_PREV_HW1
    add $4, %r15 # pre.next
    cmp %r11, %r12
    je NEIGHBORS_SOURCE_BEFORE_VALUE_BEFORE_HW1 
    mov %r12, (%r15) # pre.next = source  (source is not before-neighbor value)
    jmp AFTER_VALUE_HW1
    
    # from here HANDLE_VALUE - need to update pre of source to be current with Value


AFTER_VALUE_HW1:
    mov %rax, %rsi # rsi = temp current mem value
    add $4, %rsi # rsi = rsi.next
    cmp %r14, %rax # if source.next==current ->neighbors
    je NEIGHBORS_SOURCE_BEFORE_VALUE_AFTER_HW1
    mov %r14, (%rsi) # temp (with before value) = Source.next
    jmp CHANGE_PREV_HW1

CHANGE_PREV_HW1:
    mov %rbx, %r15 # temp with pre of source
    cmp $head, %rbx # if head before-neighboor to source
    je HEAD_TO_SOURCE_HM1  
    add $4, %r15 # pre.next
    cmp %rbx, %rax # if value before source
    je NEIGHBORS_VALUE_BEFORE_SOURCE_BEFORE_HW1
    mov %rax, (%r15) # pre source.next = value mem
    jmp AFTER_SOURCE_HW1

HEAD_TO_SOURCE_HM1:
    mov %rax, (head)
    jmp AFTER_SOURCE_HW1

AFTER_SOURCE_HW1:
    mov %rdx, %rsi # rsi = temp current mem from source
    add $4, %rsi # rsi = rsi.next
    cmp %r12, %r13 # if source==value.next ->neighbors
    je NEIGHBORS_VALUE_BEFORE_SOURCE_AFTER_HW1
    mov %r13, (%rsi) # source.next = value.next 
    jmp END_HW1


NEIGHBORS_VALUE_BEFORE_SOURCE_AFTER_HW1:
    mov %rax, (%rsi) # source.next = value mem
    jmp END_HW1  

NEIGHBORS_SOURCE_BEFORE_VALUE_AFTER_HW1:
    mov %r12, (%rsi) # value.next = source mem
    jmp CHANGE_PREV_HW1

NEIGHBORS_VALUE_BEFORE_SOURCE_BEFORE_HW1:
    mov %r14, (%r15) # pre_source.next = value_Node mem 
    jmp AFTER_SOURCE_HW1

NEIGHBORS_SOURCE_BEFORE_VALUE_BEFORE_HW1:
    mov %r12, (%r15) # pre_value.next = source mem
    jmp AFTER_VALUE_HW1

CHANGE_BACK_HW1:
    mov 4(%rax), %r13 # r13 = node after current with Value
    mov 4(%r12), %r14 # r14 = node after Source
    jmp CHANGE_NODE_PREV_SOURCE_HW1


END_HW1:



bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall

.section .data
  head:
            .quad node_0
  node_0:
            .int 288
            .quad node_1
  node_1:
            .int 69
            .quad node_2
  node_2:
            .int 687
            .quad 0
  Source: .quad node_2
  Value: .int 288

