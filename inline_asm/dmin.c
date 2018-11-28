#include<stdio.h>

double dmin(double x, double y) {
	double result;
	asm("vminsd %[x], %[y], %[p] \n\t"
	    : [p] "=x" (result)
	    : [x] "x" (x), [y] "x" (y));
	return result;
}

int main(void) {
	double x = 13.2;
	double y = 9.9;
	double result = dmin(x, y);
	printf("result = %lf \n", result);
}
