.text 
.p2allign 2
.global _start
_start : 
	jal low2upp









// $s0 -> v // $t0 -> i // $a0 -> s // $a1 -> l


low2upp:

	addi $sp, $sp, -4
	sw $s0, 0($sp)
	li $t0, 0
init_for: 
	bge $t0, $a1 endfor
	add $t1, $a0, $t0, LSL #2
	lb $s0, 0($t1)
	blt $s0, 97 exit_if
	bgt $s0, 122 exit_if
	addi $t2, $s0, -32
	sb $t2, 0($t1)
exit_if:
	addi $t0, $t0, 1
	j init_for
endfor:
	
	lw $sp, 0($s0)
	addi $sp, $sp, 4
	jr $ra 