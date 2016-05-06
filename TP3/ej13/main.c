#include <stdio.h>
#include <string.h>

typedef struct persona {
	char nombre[10];
	char apellido[16];
	int edad;
} persona;

persona copy(persona p) {
	persona new;
	strcpy(new.nombre, p.nombre);
	strcpy(new.apellido, p.apellido);
	new.edad = p.edad;
	return new;
}

int main (void) {
	persona p1 = {"severo", "ejercicio", 420};
	persona p2 = copy(p1);
}
