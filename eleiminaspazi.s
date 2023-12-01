char s[16];
int n;
strcpy( s, "pippo pluto");
n = eliminaspazi(s); // s=="pippopluto", n==1
strcpy( s, "");
n = eliminaspazi(s); // s=="", n==0
strcpy( s, " ");
2
n = eliminaspazi(s); // s=="", n==3
strcpy( s, " # ");
n = eliminaspazi(s); // s=="#", n==2
strcpy( s, " TE ST ");
n = eliminaspazi(s); // s=="TEST", n==7

eliminaspazi(char *s){
	char *sn;
	int l = 0;
	int t = 0;
	int len = strlen (s);
int i
while(*s  != '\0'){
	if(*s != ' '){
		sn = (char*)malloc(sizeof(char))
		sn[l++] = *s;
	}else{
		t++;
	}
	i++
	s = s + 1;
}
sn[l] = '\0';
return sn;
}

C goto 
eliminaspazi:
char *sn
int  l, t
l = 0
t = 0
if(*sn == '\0') goto end_while
init_while:
if(*s == ' ') goto end_if

sn[l++]=*s //strb
goto skip
end_if:
t++
skip:
s++
if(*s != '\0') goto init_while
end_while
sn[l] = '\0' //strb
return sn
}
eliminaspazi:
mov x1, x0 // s -> x0 // sn -> x1 // t -> x2
mov x2, #0


ldrb w1, [x0]
cmp w1, #0
b.eq end_while
init_while:
cmp w1, #0x20
b.eq end_if
strb w2, [x1]
addi x1, x1, 1
b skip
end_if:
addi x2, x2, 1
skip:
addi x0, x0, 1

ldrb w3, [x0]
cmp w3, #0
b.ne init_while
mov w3, #0 //mette al bit meno significativo 0
strb w3, [x1]
end_while

mov x0, x2
ret
