.data
n:      .word 7         # Change this for different Fibonacci(n)
fib_result: .word 0     #placeholder for Fib(n)
odd_result: .word 0     #place holder for isFibOdd(n)

.text
.globl main
main:
   
    lw $t0, n           # Load n
    li $t1, 0           # a = 0
    li $t2, 1           # b = 1
    ble $t0, 1, base    # if n <= 1, goto  base case

    li $t3, 1           # i = 1

fib_loop:
    beq $t3, $t0, fib_done  # if i == n, done

    add $t4, $t1, $t2   # temp = a + b
    move $t1, $t2       # a = b
    move $t2, $t4       # b = temp

    addi $t3, $t3, 1    # i++
    j fib_loop

base:  			
    sw $t0, fib_result  # if n <= 1, result = n
    move $t2, $t0       # duplicate for isOdd(m) function [n = m]
    j check_odd

fib_done:
    sw $t2, fib_result  # Store Fibonacci(n)


check_odd:
    move $t1, $t2       # Fibonacci(n) into t1
    li $t2, 2           # Repeated Sub by value (2)
    move $t3, $t1       # value = Fibonacci(n)
    

mod2_loop:
    blt $t3, $t2, mod2_end  # exit loop if value < 2
    sub $t3, $t3, $t2       # value -= 2
    
    j mod2_loop

mod2_end:

    beq $t3, $zero, even_case # same as part b  li $t5, 0 and beq $t3, $t5, even_case # remainder 
 
    li $t6, 1               # odd= 1
    j store_result

even_case:
    li $t6, 0               # even= 0

store_result:
    la $t7, odd_result
    sw $t6, 0($t7)          # store 1 if odd, 0 if even

end_loop:
    j end_loop              
