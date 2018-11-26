#include<stdio.h>

int tmult_ok(long x, long y, long *dest) {
		char bresult;

		asm("imulq %[x], %[y]    \n\t"
		    "setb  %[b]          \n\t"
			: [y] "+r" (y), [b] "=r" (bresult)      /* outputs */
			: [x] "r" (x)                           /* inputs */
			);
		*dest = y;
		return (int) bresult;
}

int main(void) {
	long x = 9999999999;
	long y = 11;
	long dest = 0;
	int result = tmult_ok(x, y, &dest);
	printf("result = %d\n", result);
	printf("dest = %ld\n", dest);
}
