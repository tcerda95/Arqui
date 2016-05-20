#include "types.h"
#include "arch/video_driver.h"
#include "arch/syscalls.h"

void sys_write(unsigned int fds, const char * str, unsigned int length) {
	/* TODO: backupear color */
	if (fds == STDERR)
		set_color(ERROR_COLOR);
	put(str, length);
}
