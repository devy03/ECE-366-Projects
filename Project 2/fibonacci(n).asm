.data
n:      .word 6        # <-----Change this (n-value)
result: .word 0        # Fibonacci(n)

.text
.globl main
main:
    lw $t0, n          # n 
    li $t1, 0          # set a = 0
    li $t2, 1          # set b = 1
    ble $t0, 1, base   # if n <= 1, go to base case

    li $t3, 1          # set i = 1

loop:
    beq $t3, $t0, exit # if i == n, exit 

    add $t4, $t1, $t2  # temp = a + b
    move $t1, $t2      # a = b
    move $t2, $t4      # b = temp

    addi $t3, $t3, 1   # i++
    j loop

exit:
    sw $t2, result     # Store Fibonacci(n)
    j end

base:  			
    sw $t0, result     # Store Fibonacci(n)= n (if n = 0 or 1 or negative)
    j end

end:
    
