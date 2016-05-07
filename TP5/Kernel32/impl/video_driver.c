#define HEIGHT 25
#define WIDTH 80

#define MAX_DIGITS 15

char *video = (char *) 0xB8000;

static unsigned int count_digits(int num);

int str_len(char *str);
void print_num(int num, char color, int row, int col);
void print(char *str, int len, char color, int row, int col);
void clear();

static unsigned int count_digits(int num) {
	int digits = 1;
	if (num < 0)
		num *= -1;
	while ((num /= 10) > 0)
		digits++;
	return digits;
}

void print_num(int num, char color, int row, int col) {
	unsigned int digits = count_digits(num);
	char str[MAX_DIGITS];
	int i;
	int k = 0;

	if (num < 0) {
		num *= -1;
		str[0] = '-';
		digits += 1;
		k = 1;
	}

	for (i = digits-1; i >= k; i--) {
		str[i] = (num % 10) + '0';
		num /= 10;
	}

	print(str, digits, color, row, col);
}

void print(char *str, int len, char color, int row, int col) {
	int effective_pos = (WIDTH*row + col)*2; /* duplica debido a los colores */
	int effective_len = len*2;
	int i;
	for (i = effective_pos; i < effective_len+effective_pos; i += 2) {
		video[i] = *str++;
		video[i+1] = color;
	}
}

void clear() {
	print("\0", HEIGHT*WIDTH, 0x00, 0, 0);
}
