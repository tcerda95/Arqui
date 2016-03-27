#ifndef _file_library_h_
#define _file_library_h_

#define TRUE 1
#define FALSE 0

#define eof -1
#define error -2

typedef struct fileCDT * file;

file file_open(const char *filename, unsigned int access_mode); /*(0) RO, (1) WO, (2) RW*/
int file_close(file f);

int file_read(void *buffer, unsigned int n_elems, unsigned int elems_bytes, file f);
int file_read_string(char *buffer, unsigned int n_chars, file f);
int file_read_line(char *buffer, file f);
int file_read_char(file f);

int file_write(void *buffer, unsigned int n_elems, unsigned int elems_bytes, file f);

int endf(file f);


#endif
