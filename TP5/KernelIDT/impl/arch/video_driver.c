#include "arch/video_driver.h"
#include "arch/strings.h"
#define MAX_DIGITS 15

static char *video = (char *) 0xB8000;
static char color = DEFAULT_COLOR;
static int cursor = 0; /* solo para put_char por ahora */

static unsigned int count_digits(int num);
static char valid_pos(int row, int col);

static char valid_pos(int row, int col) {
	return row < HEIGHT && col < WIDTH && row >= 0 && col >= 0;
}

static unsigned int count_digits(int num) {
	int digits = 1;
	if (num < 0)
		num *= -1;
	while ((num /= 10) > 0)
		digits++;
	return digits;
}

void set_color(char c) {
	color = c;
}

void print_str(char *str, int row, int col) {
	int backup = cursor;
	cursor = row * WIDTH + col;
	while (*str != '\0')
		put_char(*str++);
	cursor = backup;
}

void print_char(char c, int row, int col) {
	print(&c, 1, row, col);
}

void put_char(char c) {
	if (c == '\b') {
		cursor--;
		print_char(' ', cursor / WIDTH, cursor % WIDTH);
	}
	else if (c == '\n') {
		cursor += WIDTH - (cursor % WIDTH); /* cursor al comienzo de nueva linea */
	}
	else if (c == '\t') { /* reset cursor */
		cursor = 0;
	}
	else {
		print_char(c, cursor / WIDTH, cursor % WIDTH);
		cursor++;
	}

}

void print_num(int num, int row, int col) {
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

	print(str, digits, row, col);
}

void print(char *str, int len, int row, int col) {
	if (valid_pos(row, col)) {
		int effective_pos = (WIDTH*row + col)*2; /* duplica debido a los colores */
		int effective_len = len*2;
		int i;
		for (i = effective_pos; i < effective_len+effective_pos; i += 2) {
			video[i] = *str++;
			video[i+1] = color;
		}
	}
}

void clear() {
	int i = 0;
	for (i = 0; i < WIDTH*HEIGHT*2; i += 2) {
		video[i] = ' ';
		video[i+1] = CLEAR_COLOR;
	}
	cursor = 0;
}
