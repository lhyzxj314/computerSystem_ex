#include<stdio.h>

int div16(int x) {
	return x < 0 ? (x + (1<<4) - 1) >> 4 : x >> 4;
}

int main(void) {
	int result;
	result = div16(16);
	printf("div16(16) = %d\n", result);
	result = div16(31);
	printf("div16(31) = %d\n", result);
	result = div16(-31);
	printf("div16(-31) = %d\n", result);
}
