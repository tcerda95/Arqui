
#define STDOUT 1

int sys_write(int fd, void *buffer, int size);
int strlen(const char *str);

int main(int argc, char *argv[]) {
	const char *cadena = "hola como te va??\n";
	puts(cadena);
	return 0;
}

int puts(const char *str) {
	int len = strlen(str);
	return sys_write(STDOUT, (void *)str, len);
}

int strlen(const char *str) {
	int i = 0;
	while (*str++ != '\0')
		i++;
	return i;
}
