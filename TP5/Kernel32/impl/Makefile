INC_PATH = include/
DIRECTIVES = -fno-builtin -nostartfiles -nostdlib -I $(INC_PATH)
FLAGS = -g -m32 -c

all:
	nasm -f aout -g loader.asm -o loader.o 
	nasm  -f aout -g rtc.asm -o rtc.o 
	gcc $(FLAGS) kernel.c -o kernel.o $(DIRECTIVES) 
	gcc $(FLAGS) video_driver.c -o video_driver.o $(DIRECTIVES) 
	gcc $(FLAGS) strings.c -o strings.o $(DIRECTIVES) 
	
	ld -melf_i386 -T link.ld -o kernel.bin kernel.o loader.o rtc.o video_driver.o strings.o
	rm *.o
	mcopy kernel.bin z:/boot -o
clean:
	rm *.o
	rm kernel.bin
	
