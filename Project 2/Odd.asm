.data
value:  .word 9 #<---- change this number to test if this is an odd or even number    
result: .word 0	#this will eventually be 1 or zero depending on given val

.text
.globl main

#	To find the whether or not the given value is odd, change the value parameter above
#	and then run the code. Press the stop button the stop the run and the result should be
#	a 1 or 0 (0 being even) stored into t6 on the register list on the right

main:
    la $t0, value		#load address of value into t0
    lw $t1, 0($t0)       	#load value into t1
    li $t2, 2             	#dividing by 2, move 2 into t2
    
    move $t3, $t1         	#move value into t3
    
    li $t4, 0             	#quotient counter is initially 0

mod2_loop:
    blt $t3, $t2, mod2_end	#move to mod2_end if value is <2
    sub $t3, $t3, $t2		#decrement value by 2
    addi $t4, $t4, 1		#increment quotient counter
    j mod2_loop			#loop
	
mod2_end:
    li $t5, 0			#checks for even
    beq $t3, $t5, even_case	#if remainder is 0, is even

    li $t6, 1            	#if result = 1, go to store result
    j store_result

even_case:
    li $t6, 0             	# result = 0 (even)

store_result:			
    la $t7, result		#store result intot7
    sw $t6, 0($t7)		#store result value into t6

end_loop:
    j end_loop