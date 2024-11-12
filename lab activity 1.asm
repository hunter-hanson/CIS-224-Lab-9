.data
    A:  .word 10       # Example value for X
    B:  .word 2       # Example value for W
    C:  .word 5        # Example value for Z
    D:  .word 0        # Variable to store the result

.text
    .globl main

main:
    lw   $t0, A        # Load X into $t0
    lw   $t1, B        # Load W into $t1
    lw   $t2, C        # Load Z into $t2

    add  $t3, $t0, $t1   # $t3 = X + W
    sub  $t3, $t3, $t2   # $t3 = (X + W) - Z

    sw   $t3, D          # Store the final result in Y

    li   $v0, 1          # Load system call for printing integer
    move $a0, $t3        # Move the result into $a0 (argument for syscall)
    syscall              # Print the result

    li   $v0, 10         # Exit the program
    syscall
