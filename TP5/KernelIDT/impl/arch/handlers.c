
#include "types.h"
#include "klib.h"

int get_key();
void int_08();
void int_09();

static const char map[] = { '\0', '\0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '\'', '¿', '\b',
						'\t', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '\0', '+', '\n',
						'\0', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ñ', '{', '|', '\0',
						'}', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '-', '\0', '\0', '\0', ' '
					};

void irqDispatcher(dword irq){	
	switch(irq) {
		case 0:
			int_08();
			break;	
		case 1:
			int_09();
			break;
	}
	return;
}

static int i = 0;
static int j = 0;
static char *video = (char *) 0xb8000;

void int_08(){
	if ( i % 91 == 0 ) /* transcurrieron 5 segundos */
		video[i / 91] = '|';
	i++;
}

void int_09() {
	video[j++] = map[get_key()];
}
