#include <stdio.h>

unsigned int factorial(int n);

int main(int argc, char *argv[]) {

	if (argc > 1) {
		int b;
		int a;
		sscanf(argv[1],"%d",&b);
		a = factorial(b);
		printf("%d\n", a);
	}
	else
		printf("Envíar factorial a calcular como argumento.\n");

	return 0;
}
