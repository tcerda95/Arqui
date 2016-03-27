#include "file_library.h"
#include <stdlib.h>

unsigned int sys_open(const char *filename, unsigned int access_mode); /*(0) RO, (1) WO, (2) RW*/
unsigned int sys_close(unsigned int file_descriptor);
unsigned int sys_read(void *buffer, unsigned int bytes, unsigned int file_descriptor);
unsigned int sys_write(void *buffer, unsigned int bytes, unsigned int file_descriptor);

struct fileCDT {
	unsigned int descriptor;
	int endf; /* TRUE if end of file reached, FALSE otherwise */
};

file file_open(const char *filename, unsigned int access_mode) {
	int file_descr = sys_open(filename, access_mode);
	file f;
	if (file_descr < 0) /* error */
		return 0; /* NULL */
	f = malloc(sizeof (struct fileCDT));
	f->descriptor = file_descr;
	f->endf = FALSE;
	return f;
}

int file_close(file f) {
	int d = f->descriptor;
	free(f);
	return sys_close(d);
}

int file_read(void *buffer, unsigned int n_elems, unsigned int elems_bytes, file f) {
	unsigned int bytes;
	int bytes_read;

	if (endf(f))
		return eof;

	bytes = n_elems*elems_bytes;
	bytes_read = sys_read(buffer, bytes, f->descriptor);

	if (bytes_read < 0) /* error */
		return error; 

	else if (bytes_read == 0) {
		f->endf = TRUE;
		return eof;
	}

	else if (bytes_read < bytes)
		f->endf = TRUE;

	return bytes_read;
}

int file_read_string(char *buffer, unsigned int n_chars, file f) {
	int bytes_read = file_read((void *) buffer, n_chars, sizeof (char), f);
	if (bytes_read != error) /* no error */
		buffer[bytes_read] = '\0';
	return bytes_read;
}

int file_read_char(file f) {
	char c;
	if (file_read((void *) &c, 1, sizeof(char), f) == eof)
		return eof;
	return c;
}

int file_read_line(char *buffer, file f) {
	int c, i;
	for (i = 0; (c = file_read_char(f)) != eof && c != '\n'; i++)
		buffer[i] = c;
	buffer[i] = '\0';
	return (i == 0 && c == eof) ? eof : i;
}

int file_write(void *buffer, unsigned int n_elems, unsigned int elems_bytes, file f) {
	unsigned int bytes = n_elems * elems_bytes;
	int bytes_written;

	bytes_written = sys_write(buffer, bytes, f->descriptor);

	if (bytes_written < 0)
		return error;

	return bytes_written;
}

int endf (file f) {
	return f->endf;
}
