INC_PATH = include/
DIRECTIVES = -fno-builtin -nostartfiles -nostdlib -I $(INC_PATH)
FLAGS = -g -m32 -c

all:
	nasm -f aout -g loader.asm -o loader.o 
	nasm  -f aout -g rtc.asm -o rtc.o 
	nasm  -f aout -g keys.asm -o keys.o 
	gcc $(FLAGS) kernel.c -o kernel.o $(DIRECTIVES) 
	gcc $(FLAGS) video_driver.c -o video_driver.o $(DIRECTIVES) 
	gcc $(FLAGS) strings.c -o strings.o $(DIRECTIVES) 
	gcc $(FLAGS) keyboard_driver.c -o keyboard_driver.o $(DIRECTIVES) 
	
	ld -melf_i386 -T link.ld -o kernel.bin loader.o kernel.o rtc.o video_driver.o strings.o keys.o keyboard_driver.o
	rm *.o
	mcopy kernel.bin z:/boot -o
clean:
	rm *.o
	rm kernel.bin
	
