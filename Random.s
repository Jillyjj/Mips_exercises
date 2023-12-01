/*#Si trasformi il seguente frammento di codice C in uno equivalente Assembly
ARM A64.
r = 1;
for( long i=0; i<n; ++i )
{
if( i%4 == 0)
r = r * 2;
}
Si assuma che le variabili r e n siano definite nel segmento .data in questo modo:
.data
.p2align 2
.global n
n: .dword 0
.global r
r: .dword 0
Nota: Non è permesso usare l’istruzione MUL.
*/
r = 1
i = 0
if (i >= n) goto end_for
if(i%4 == 0) end_if
r = r * 2
end_if
i++
if(i<n) goto init_for
end_for

adr x0, r 	// x0 = &r
ldr x0, [x0] // w0 = r
adr x1, n 	// x1 = &n
ldr x1, [x1] // w1 = n
movz x0, #1 	// r = 1
movz x2, #0 	// i = 0

cmp x2, x0
b.ge end_for
init_for:
	ands x3, x2, #3
	cmp x3, #0
	b.ne end_if
	lsl x0, x0, #1 // modulo e moltiplicazione accumulativa 
	//vanno tipo x=2 // r*=2(x) // lsl x0,x0, #x(x (= 2 )non register)-1 
end_if:
addi x2, x2, #1
cmp x2, x1
b.lt init_for
end_for:
//bisogna anche salvare i valori dentro i registri di r e n
adr x0, r
str x1, [x0]
