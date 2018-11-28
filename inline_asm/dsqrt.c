#include<stdio.h>

double dsqrt(double x) {
	double result;
	asm("sqrtsd %[x], %[p] \n\t"
		: [p] "=x" (result)
		: [x] "x" (x));
	return result;
}


int main(void) {
	double result = dsqrt(1.2);
	printf("result = %f\n", result);
}
