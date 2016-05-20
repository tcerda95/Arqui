
#include "types.h"
#include "klib.h"
#include "arch/video_driver.h"
#include "arch/keyboard_driver.h"

void int_08();
void int_09();

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

void int_08(){
	if ( i % 91 == 0 ) /* transcurrieron 5 segundos */
		print_num(i/91, 0, 0);
	i++;
}

void int_09() {
	int c = get_char();
	if (c != -1) {
		put_char(c);
		j++;
	}
}
