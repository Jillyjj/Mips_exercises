/**
 * void low2upp(char *s, int l) {
int i;
char v;
for (i=0; i < l; i++) {
v = s[i];
if (v >= 97 && v <= 122)
s[i] = v - 32;
}
}
1. Tradurre in C con if-goto e goto.
2. Tradurre in assembly MIPS, usando $s0 per la variabile char v (in verit`a, il byte meno significativo del registro).
E’ possibile usare pseudo-istruzioni come blt, ble, bgt e bge.
*/
void low2upp(char *s, int l){
	int i
	char v
	i = 0
	init_for:
		if(i >= l) end_for
		v = s[i]
		if(v < 97) goto end_if
		if(v > 122) goto end_if
			v = v - 32 
			s[i] = v
	end_if:
	i++
	goto init_for
	end_for:
}
//$s0 -> v // $t0 -> i // $a0->s // $a1 -> l
low2upp:
	add $sp, $sp, -4
	sw $s0, 0($sp)

	li $t0, 0
init_for:
	bge $t0, $a1, end_for
	#add $t1, $a0, $t0, LSL #2 Non serve shift operation quando trattiamo con i char (dipende dalla grandezza della struttura dati, char 1B
	## int 4B)
	add $t1, $a0, $t0
	lb $s0, 0($t1)
	blt $s0, 97, end_if
	bgt $s0, 122, end_if
	add $t2, $s0, -32
	sb $t2, 0($t1)
end_if:
	addi $t0, $t0, 1
	j init_for
end_for:
	
	lw $sp, 0($sp)
	addi $sp, $sp, 4

	jr $ra
