#include<stdio.h>

int odd_parity(unsigned long x) {
	int result = 0;
	
	while (x != 0) {
		char bresult;
		unsigned char bx = x & 0xff;
		asm("test %[x], %[x] \n\t"
	    	"setnp %[v]      \n\t"
	    	: [v] "=r" (bresult)
	    	: [x] "r" (bx)
	    	);
		result ^= (int) bresult;
        	x = x >> 8;
	}
	
	return result;
}

int main(void) {
	unsigned long x = 1003;
	int result = odd_parity(x);
	printf("result = %d \n", result);
}
