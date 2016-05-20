#ifndef __VIDEO_DRIVER__H__
#define __VIDEO_DRIVER__H__

void set_color(char color);
void print_str(char *str, int row, int col);
void put_char(char c);
void print_char(char c, int row, int col);
void print_num(int num, int row, int col);
void print(char *str, int len, int row, int col);
void clear();

#define DEFAULT_COLOR 0x0F
#define CLEAR_COLOR 0x00
#define HEIGHT 25
#define WIDTH 80

#endif
