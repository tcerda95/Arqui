#include <stdio.h>

void magia(char str[]);

int main(void) {
	char str[] = "hello world\n";
	magia(str);
	printf(str);
	return 0;
}

void magia(char str[]) {
	while (*str != '\0') {
		if (*str >= 'a' && *str <= 'z')
			*str = *str - ('a' - 'A');
		str++;
	}
}

