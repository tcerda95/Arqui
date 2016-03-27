#include "file_library.h"
#include <stdio.h>

int main(int argc, const char *argv[]) {
	const char *filename = "algo.txt";
	char buffer[100];
	unsigned int bytes_read;

	file f = file_open(filename, 0);

	while (file_read_line(buffer, f) != eof)
		printf("%s", buffer);

	file_close(f);
	return 0;
}
