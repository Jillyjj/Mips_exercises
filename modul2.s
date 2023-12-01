r = 0;
for( int i=0; i<n; ++i )
{
if( i%2 == 0)
r+=i;
}
Si assuma che le variabili r e n siano definite nel segmento .data in questo modo:
.data
.global n
n: .word 0
.global r
r: .word 0
//
r = 0
i = 0
if(i >= n) goto ent_for
init_for:
i++
ands mod, i, #2-1
if(mod != 0) end_if 
r+=i
end_if
if(i < n) init_for
}
//arm
// n -> x0 // r -> w1 // i -> w2
codice:
adr x0, n
ldr w0, [x0]
mov w1, #0 //r
mov w2, #0
cmp w2, w0
b.ge end_for
init_for:
addi w2, w2, #1
ands w3, w2, #1
cmp w3, #0
b.ne end_if
add w1, w1, w2
end_if:
cmp w2, w0
b.lt init_for
end_for:
adr x0, r
str w1, [x0]

