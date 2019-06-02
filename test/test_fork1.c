#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>


int main() {
	fork();
	fork();
	printf("hello\n");
	exit(0);
}
