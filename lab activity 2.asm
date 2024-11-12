.data
    A:  .word 3       # Example value for X
    B:  .word 1       # Example value for W
    C:  .word 2        # Example value for Z
    D:  .word 4        # Variable to store the result
    E:  .word 0
.text
    .globl main

main:
    lw   $t0, A        # Load X into $t0
    lw   $t1, B        # Load W into $t1
    lw   $t2, C        # Load Z into $t2
    lw   $t3, D

    sub  $t4, $t0, $t1   # $t3 = X + W
    sub  $t4, $t4, $t2   # $t3 = (X + W) - Z
    add  $t4, $t4, $t3
    

    sw   $t4, E          # Store the final result in Y

    li   $v0, 1          # Load system call for printing integer
    move $a0, $t4        # Move the result into $a0 (argument for syscall)
    syscall              # Print the result

    li   $v0, 10         # Exit the program
    syscall
