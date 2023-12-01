#include <stdio.h>
palindroma(char *s){
char *k = s;
while(*k != '\0'){
	k++;
}
k--;
while(*s <= *k){
	if(*s != *k){
	return 0;
	}
	k--;
	s++;
}
return 1;
}
palindroma:
char *k = s;
if(*k == '\0') goto exitreturn1

init_while:
k++
if(k != '\0') goto init_while
k--
exit_while:

if(*s > *k) goto exitloop
initloop:
if(*s == *k) goto exitif
goto return0
exitif:
k--
s++
if(*s <= *k) goto initloop
exitloop:
exitreturn1:
mov x0, #1
ret 
return0:
mov x0, #0
ret
/////////////////////////////////////////
// k -> x1 // s -> x0 
palindroma:
mov x1, x0
ldrb w1, [x1]
cmp w1, #0
b.eq return0
init_while:
addi x1, x1, #1
ldrb w1, [x1]
cmp w1, #0
b.ne init_while
addi x1,x1,#-1
exit_while:
ldrb w1, [x1]
ldrb w0, [x0]
cmp w0,w1
b.gt exitloop
initloop:
cmp w0,w1
b.eq exitif
b return0
exitif:
addi x1,x1,#-1
addi x0,x0,#1
ldrb w1, [x1]
ldrb w0, [x0]
cmp w0,w1
b.le initloop
exitloop:
exitreturn1:
mov x0, #1
ret 
return0:
mov x0, #0
ret
