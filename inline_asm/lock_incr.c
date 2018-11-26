#include<stdio.h>

void lock_incr(int *ptr) {
	asm("lock   \n\t"
	    "addl $1, %[x]  \n\t"
	    : [x] "+m" (*ptr) 
	);
}

int main(void) {
	int cnt = 0;
	int i;
	for (i = 0; i < 5; i++) {
		lock_incr(&cnt);
	}
	printf("cnt=%d \n", cnt);
}
