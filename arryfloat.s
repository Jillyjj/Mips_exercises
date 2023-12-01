int temp = 0;
int temp2 = 0;
for(int i = 0; i < n; i++){
temp = a[n-i-1];
temp2 = a[i];
a[n-i-1] = temp2;
a[i] = temp;
}
// c-goto
temp = 0
temp2 = 0
if(i >= n) goto end_for
init_for:
temp = a[n - i - 1]
temp2 = a[i]
a[n - i - 1] = temp2
a[i] = temp 
// arm
array:
adr x0, a // array a 
adr x1, n
ldr w1, x1 //n
mov w3, #0 //temp
mov w4, #0 //temp2
mov w2, #0 //i
cmp w2, w1
b.ge end_for
init_for:
sub x3, x2, x1
sub x3, x3, #1
lsl x3, x3, #2

add x4, x0, x3
ldr w5, [x4] //temp
mov w3, w5
add x5, x0, x2, LSL #2
ldr w6, [x5] //temp2
mov w4, w6
str w5, [x5]
str w6, [x4]
cmp w2, w1
b.lt init_for
end_for:

