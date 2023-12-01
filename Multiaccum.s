r = 1;
for( long i=0; i<n; ++i )
{
if( i%2 == 0)
r = r * 4;
}
Si assuma che le variabili r e n siano definite nel segmento .data in questo modo:
.data
.p2align 2
.global n
n: .dword 0
.global r
r: .dword 0
//
r = 1
i = 0 //sempre 4 byte
if (i >= n) goto end_for
init_for:
ands mod, i, #1
if(mod != 0 ) goto end_if
r = r * 4
end_if
i++
if(i < n) goto init_for
end_for:
// caricare label di r
// fare store del risultato dentro r
codice:
adr x0, n
ldr w0, [x0] //n

mov w1, #0 //r
mov w2, #0 //i
cmp w2, w0
b.ge end_for
init_for:
ands w3, w2, #1
cmp w3, #0
b.ne end_if
lsl w1, w1, #2
end_if:
addi w2, w2, #1
cmp w2, w0
b.lt init_for
end_for:
adr x0, r
str w1, [x0]