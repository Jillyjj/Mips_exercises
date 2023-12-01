Si trasformi il seguente frammento di codice C in uno equivalente Assembly
ARM A64.
for(int i=0; i<n; ++i )
A[i]++;
Si assuma che le variabili A e n siano definite nel segmento .data in questo modo:
.data
.p2align 2
.global i
n: .word 10
.global A
A: .dword 1,3,7,4,8,1,2,3,9,9


------------------------------------------------------------------
incremeneta:
i = 0
if (i >= n) goto end_for
init_for:
a[i] = a[i] + 1
i++
if(i < n)
end_for:

//---------------------------------------------------ARM-------------------------------
incremeneta:
adr x0, a
ldr w1, [x0]
mov w2, #0
cmp w2, w1
b.ge end_for
init_for:
add w3, x0, w2, LSL #2
ldr w4, [x3]
addi w4, w4, #1
str w4, [x3]
addi w2, w2, #1
cmp w2, w1
b.lt init_for
end_for:
ret
--------------------------------------------------------------------------------------

Si scriva una funzione Assembly ARM 64 int stringavuota(char* s) che
prenda in input una stringa e restituisca 1 se la stringa è vuota, 0 altrimenti.
Nota: 3 punti bonus se non si utilizzano istruzioni branch
Esempi:
stringavuota(""); // 1
stringavuota("a"); // 0
stringavuota("ciao"); // 0
stringavuota(" "); // 0

int stringavuota(char *s){
	int count = 0;
	while(*s != '\0'){
		count++;
		s++;
	}
	if(count != 0)
		return 1;
	else 
		return 0;
}

//c -> goto
stringavuota:
count = 0
if (*s == '\0') goto end_while
init_while:
count++
s++
if(*s != '\0') goto init_while
end_while:
if(count == 0) goto retun0
return1:
ret 1
return0:
ret 0
//--------------------------------------------------<ARM>-----------------------------------------------------------
stringavuota:
adr x0, s
ldrb w1, [x0]
mov w2, #0
cmp w1, #0
b.eq end_while
init_while:
addi w2, w2, #1
addi x0, x0, #1
ldrb w1, [x0]
cmp w1, #0
b.ne init_while
end_while:
cmp w2, #0
b.eq return 0
return1:
mov x0, #1
ret
return0:
mov x0, #0
ret
---------------------------------------------------------------------------------------------------------
Si trasformi il seguente frammento di codice C in uno equivalente Assembly
ARM A64.
for(int i=0; i<n; ++i )
A[i]--;
Si assuma che le variabili A e n siano definite nel segmento .data in questo modo:
.data
.p2align 2
.global n
n: .word 10
.global A
A: .word 1,3,7,4,8,1,2,3,9,9
//----------------------------------------c->goto--------------------------------------------
decrementa:
i = 0
if(i >= n) goto end_for
init_for:
A[i]--
i++
if(i < n) goto init_for
end_for:
//----------------------------------------arm------------------------------------------------------------
decrementa:
adr x0, a
adr x1, n
ldr w1, [x1]
mov w2,w1
b.ge end_for
init_for:
add w3, x0, w2, LSL #2
ldr w4, [w3]
sub w4, w4, #1
str w4, [x0]
addi w2, w2, #1
cmp w2, w1
b.lt init_for
end_for:
ret 
//-------------------------------------------------
Si scriva una funzione Assembly ARM 64 int nonvuota(char* s) che prenda
in input una stringa e restituisca 0 se la stringa è vuota, 1 altrimenti.
Nota: 3 punti bonus se non si utilizzano istruzioni branch
Esempi:
nonvuota(""); // 0
nonvuota("a"); // 1
nonvuota("ciao"); // 1
nonvuota(" "); // 1
//--------------------------------------------------------------C------------------------------------
int non_Vuota(char *s){
if(*s == '\0')
return 1;
else return 0;
}
// ___________________________________________C -> goto _________________________________________________________
non_Vuota: 
ldrb w1, [x0]
cbz w1, stringa_vuota
nonvuota:
mov x0, #0
ret
stringa_vuota:
mov x0, #1
ret
_________________________________________________________________________________________________________________
Si trasformi il seguente frammento di codice C in uno equivalente Assembly
ARM A64.
r = n/2;
for( long i=0; i<n; ++i )
{
if( i%4 == 0)
r = r * 2;
}
Si assuma che le variabili r e n siano senza segno e definite nel segmento .data
in questo modo:
.data
.p2align 2
.global n
n: .dword 0
.global r
r: .dword 0
//-------------------------------------------------C->goto_-----------------------------------------------------
func:
r = n/2
i = 0;
if(i >= n) goto end_for
init_for:
if(i % 4 != 0) goto end_if
r = r * 2
end_if:
i++
if(i < n) goto init_for
end_for:
ret r
//------------------------------------------------------ARM-------------------------------------------------------
adr x0, n
ldr w1, [x0]
mov w2, w1
asr w2, w2, #1
mov w3, #0
cmp w3, w1
b.ge end_for
init_for:
ands w4, w3, #3
cmp w4, #0
b.ne end_if
mul w5, w2, #2
end_if:
addi w3, w3, #1
cmp w3, w1
b.lt init_for
end_for:
adr x0, r
str w5, [x0]
ret
___________________________________________________________________________________________________________________________
int v[] = { 0, 0, 0, 0, 0, 0, 0, 0 };
media8(v); // 0
int v[] = { 0, 1, -3, 4, -1, 3, 6, 6 };
media8(v); // 2
int v[] = { -6, 1, -3, 4, -1, 2, -8, -5};
media8(v); // -2
//-----------------------------------------------------C---------------------------------------------------------
int media(int *v){
	int i = 0;
	int sum = 0;
	for(int i = 0; i < 8; i++){
		posizione = indirizzo_iniziale + (indice_elemento * sizeof(tipo_dato))
		
		sum += a[i];
	}
	sum/=8;
}
//---------------------------------------------------C->goto--------------------------------------------------------------
int media(int *v){
	i = 0;
	sum = 0;
	if(i >= 8) goto end_for
	init_for:
	temp = *v + i * 4
	sum += temp
	i++
	if(i < 8) goto init_for
	end_for:
	sum = sum / 8
	ret sum
}
//---------------------------------------------------ARM--------------------------------------------------------------------
media:
adr x0, v
ldr w1, [x0]
mov w2, #0 // i
mov w3, #0 // sum
cmp w2, #8
b.ge end_for
init_for:
add w4, x0, w2, LSL #2
ldr w5, [w4]
add w3, w3, w5
addi w2, w2, #1
 addi x0, x0, #4 bisogna commentarla o no ? No, è giusto così per evitare la sovrascrittura di x0
cmp w2, #8
b.lt init_for
end_for:
asr w3, w3, #3
str w3, [x0]
ret 

_____________________________________________________________________________________________________________________________
Si trasformi il seguente frammento di codice C in uno equivalente Assembly
ARM A64.
r = n/2;
for( int i=0; i<n; ++i )
{
if( i%4 == 0)
r = r * 2;
}
Si assuma che le variabili r e n siano senza segno e definite nel segmento .data
in questo modo:
.data
.p2align 2
.global n
n: .word 0
.global r
r: .word 0
//------------------------------------------c-> goto ---------------------------------------------------------------------------
int func(int n){
	r = n / 2 
	i = 0
	if(i >= n) goto end_for
	init_for:
	if(i % 4 != 0) goto end_if
	r = r * 2
	end_if:
	i++
	if(i < n) goto init_for
	end_for:
ret r
}
//------------------------------------------------------------ARM------------------------------------------------------------------
func:
adr x0, n
ldr w1, [x0]
mov w2, w1
asr w2, w2, #1
mov w3, #0
cmp w3, w1
b.ge end_for
init_for:
ands w4, w3, #3
cmp w4, #0
b.ne end_if
mul w2, w2, #2
end_if:
addi w3, w3, #1
cmp w3, w1
b.lt init_for
end_for:
adr x0, r
str w2, [x0]
ret
____________________________________________________________________________________________________________________________________
Si scriva una funzione Assembly ARM 64 long media8( long* v ) che prenda
in input un array di 8 interi (con segno) e restituisca la loro media aritmetica
(intera, con segno). Nota: Se la media produce un valore frazionario x, la
funzione ritorna il più grande intero minore di x.
Esempi:
long v[] = { 0, 0, 0, 0, 0, 0, 0, 0 };
media8(v); // 0
long v[] = { 0, 1, -3, 4, -1, 3, 6, 6 };
media8(v); // 2
long v[] = { -6, 1, -3, 4, -1, 2, -8, -5};
media8(v); // -2
2
long v[] = { -6, 1, -3, 4, -1, 2, -8, 5};
media8(v); // -1
long v[] = { 6, -1, 3, -4, 1, -2, 8, -5};
media8(v); // 0
//-------------------------------------------------------------c--------------------------------------------------------------------
long media8(long* v){
	long sum = 0;
	long i = 0;
	for(i = 0; i < 8; i++){
		sum+=a[i];
	}
	sum /= 8;
	return sum;
}
//-----------------------------------------------------------C->goto-----------------------------------------------------------------
long media8(long *v){
	sum = 0
	i = 0
	if(i >= 8) goto end_for
	init_for:
	temp = *a + i * i
	sum += temp
	i++
	if(i < 8) goto init_for
	end_for:
	ret sum
}
//------------------------------------------------------------ARM----------------------------------------------------------------------
media8:
mov w2, #0
mov w3, #0
cmp w3, #8
b.ge end_for
init_for:
add w4, x0, w3, lsl #2
ldr w5, [w4]
add w2, w2, w5
addi x0, x0, #1
addi w3, w3, #1
cmp w3, #8
b.lt init_for
end_for:
str w2, [x0]
ret
________________________________________________________________________________________________________________________________________

palindroma:
mov x1, x0
ldrb w2, [x0]
cmp w2, #0
b.eq return0
ldrb w3, [x1]
cmp w3, #0
b.eq end_while1
init_while1:
addi x1, x1, #1
ldrb w3, [x1]
cmp w3, #0
b.ne init_while1
end_while1:
subi x1, x1, #1
ldrb w3, [x1]
ldrb w2, [x0]
cmp w2, w3
b.gt end_while2
init_while2:
cmp w3, w2
b.ne return0
subi x1, x1, #1
addi x0, x0, #1
ldrb w3, [x1]
ldrb w2, [x0]
cmp w2, w3
b.le init_while2
end_while2:
return1:
mov x0, #1
ret
return0:
mov x0, #0
ret
_______________________________________________________________________________________________________________________________________





























