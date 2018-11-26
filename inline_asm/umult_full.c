#include<stdio.h>

void umult_full(unsigned long x, unsigned long y, unsigned long *dest) {
	asm("movq %[x], %%rax   	\n\t"
		"mulq %[y] 		\n\t"
		"movq %%rax, %[lo] \n\t"
		"movq %%rdx, %[hi] \n\t"
		: [lo] "=m" (dest[0]), [hi] "=m" (dest[1])
		: [x] "r" (x), [y] "r" (y)
		: "%rdx", "%rax");
}

int main(void) {
	unsigned long x = 9999999999999999l;
	unsigned long y = 8888888888888888l;
	unsigned long dest[2] = {0l, 0l};
	umult_full(x, y, dest);
	printf("dest[1] = %lu\n", dest[1]);
	printf("dest[0] = %lu\n", dest[0]);
}
