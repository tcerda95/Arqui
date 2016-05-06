
char *video = (char *) 0xB8000;


static int str_len(char *str) {
	int i;
	for (i = 0; str[i] != '\0'; i++)
		;
	return i;
}

void print(char *str, char color, int position) {
	int effective_pos = position*2; /* duplica debido a los colores */
	int effective_len = str_len(str)*2;
	int i;
	for (i = effective_pos; i < effective_len+effective_pos; i += 2) {
		video[i] = *str++;
		video[i+1] = color;
	}
}

/**********************************************
kmain() 
Punto de entrada de codigo C.
*************************************************/
void kmain()
{
	/*
	char msg[] = {'A', (char)0xF2, 'r', (char)0xF2, 'q', (char)0xF2, 'u', (char)0xF2, 'i', (char)0xF2, 't', (char)0xF2, 'e', (char)0xF2, 
				  'c', (char)0xF2, 't', (char)0xF2, 'u', (char)0xF2, 'r', (char)0xF2, 'a', (char)0xF2, ' ', (char)0xF2, 'd', (char)0xF2, 
				  'e', (char)0xF2, ' ', (char)0xF2, 'l', (char)0xF2, 'a', (char)0xF2, 's', (char)0xF2, ' ', (char)0xF2, 'c', (char)0xF2, 
				  'o', (char)0xF2, 'm', (char)0xF2, 'p', (char)0xF2, 'u', (char)0xF2, 't', (char)0xF2, 'a', (char)0xF2, 'd', (char)0xF2, 
				  'o', (char)0xF2, 'r', (char)0xF2, 'a', (char)0xF2, 's', (char)0xF2};
	*/

	char *msg = "Arquitectura de las computadoras";
	char *other_msg = "Ponele que ejercicio 2";
	int leng = str_len(msg);

	print(msg, 0xF2, 0);
	print(other_msg, 0x0F, leng);

	while(1){
	}
}

