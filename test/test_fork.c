#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>


int main() {
	int x = 1;
	
	if (fork() == 0) {
		printf("p1: x=%d\n", ++x);
	}
	printf("p2: x=%d\n", --x);
	exit(0);
}
