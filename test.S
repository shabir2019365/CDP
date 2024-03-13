// Muhammad Shabir Khan


.text
// start code here
// Insert your code

.global _main

_main:
  add a1, x0, x0
  la t0, num
  lw a0, 0(t0)  # Load argument (n) to a0
  add a1, a0, x0
  jal ra, factorial  # Call factorial function

  addi a1, a0, 0  # Print result (a0 already contains it)
  addi a0, x0, 1  # Print syscall number for stdout
  ecall           # Print the factorial

  addi a1, x0, '\n'  # Print newline character
  addi a0, x0, 11    # Print syscall number for newline
  ecall           # Print newline

  addi a0, x0, 10  # Exit syscall number
  ecall           # Exit program

factorial:
  # YOUR CODE HERE
    li t0, 1
    # Base case: if n is 0 or 1, return 1
    beqz a0, base_case
    
    beq a0, t0, base_case

    # Recursive case: n! = n * (n-1)!
    addi sp, sp, -4    # Allocate space for the return address
    sw ra, 0(sp)       # Save the return address on the stack
    # Argument setup for the recursive call
    addi a1, a1, -1    # Decrement n
    # Multiply n by the result of the recursive call
    mul a0, a0, a1
    beq a1, t0, return

    jal ra, factorial  # Recursive call

return:
    lw ra, 0(sp)       # Restore the return address
    addi sp, sp, 4     # Free space on the stack
    jr ra             # Jump back to the calling function

base_case:
    li a0, 1          # Return 1 for the base case
    jr ra             # Jump back to the calling function


// end code here
write_tohost:
li x1, 1
sw x1, tohost, t5
j write_tohost
.data
// start data section here
// Initialize data here (if required)

num: .word 5       # Initial value for num
result: .word 0    # Store the factorial result here
// end data section here
.align 12
.section ".tohost","aw",@progbits;
.align 4; .global tohost; tohost: .dword 0;
.align 4; .global fromhost; fromhost: .dword 0;
