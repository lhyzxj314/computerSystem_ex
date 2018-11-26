#include<stdio.h>

int pushtest() {
	asm("movq %%rsp, %%rax \n\t"
	    "pushq %%rsp \n\t"
	    "popq %%rdx  \n\t"
	    "subq %%rdx, %%rax \n\t"
	    : : : "%rax", "%rsp", "%rdx"
			);
}

int main(void) {
	int result = pushtest();
	printf("result = %d\n", result);
}
