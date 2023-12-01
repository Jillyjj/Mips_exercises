/*void string_print(char *str, int slen) {
int i;
char *p;
p = str;
for (i = 0; i < slen; i++)
print_char(*(p + i));
}*/
void string_print(char *str, int slen){
	int i;
	char *p;
	p=str;
	i = 0;
	init_for:
		if(i >= slen) goto end_for
		print(*(p+i))
		i++
	end_for:
}

