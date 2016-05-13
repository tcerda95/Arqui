#define COLS 80

int get_char();
void editor_mode();

unsigned int seconds();
unsigned int minutes();
unsigned int hour();
unsigned int month();

int str_len(char *str);

void print_str(char *str, char color, int row, int col);
void print_num(int num, char color, int row, int col);
void print(char *str, int len, char color, int row, int col);
void clear();

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
	unsigned int mins = minutes();
	unsigned int hrs = hour();
	unsigned int secs = seconds();
	int i = 0;
	char c;

	clear();
	print_str(msg, 0xF2, 0, 0);
	print_str(other_msg,  0x0F, 2, 20);
	print_num(-2345, 0x0F, 2, 0);

	print_str("Horas:", 0x0F, 3, 0);
	print_num(hrs, 0x0F, 3, 8);

	print_str("Mins:", 0x0F, 4, 0);
	print_num(mins, 0x0F, 4, 7);

	print_str("Segundos:", 0x0F, 5, 0);
	print_num(secs, 0x0F, 5, 11);

	print_str("Mes:", 0x0F, 6, 0);
	print_num(month(), 0x0F, 6, 6);

	clear();
	while(1) {
		if ((c = get_char()) != -1) {
			print_char(c, 0x0F, i/COLS, i%COLS);
			i++;
		}
	}
}
