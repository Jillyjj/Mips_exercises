r = 1;
while( n-- && r%64 != 0 )
{
r += 15;
}
Si assuma che le variabili r e n siano definite nel segmento .data in questo modo:
.data
.p2align 2
.global n
n: .word 0
.global r
r: .word 0
// c- goto
n
r = 1
if(r % 64 == 0) goto end_while
init_while:
n--
r += 15
if(r%64 != 0) goto init_while
end_while:
adr
str

//arm 
codice:
adr x0, n
ldr w0, [x0] //n
mov w1, #1 //r
ands w2, w1, #63
cmp w2, #0 
b.eq end_while
init_while:
addi w0, w0, #-1
addi w1, w1, #15
cmp w2, #0
b.ne init_while
end_while:
adr x0, r
str w2, [x0]