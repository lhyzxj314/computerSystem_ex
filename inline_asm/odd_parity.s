	.file	"odd_parity.c"
	.text
	.globl	odd_parity
	.type	odd_parity, @function
odd_parity:
.LFB23:
	.cfi_startproc
	movl	$0, %eax
	jmp	.L2
.L3:
#APP
# 9 "odd_parity.c" 1
	test %dil, %dil 
	setnp %dl      
	
# 0 "" 2
#NO_APP
	movsbl	%dl, %edx
	xorl	%edx, %eax
	shrq	$8, %rdi
.L2:
	testq	%rdi, %rdi
	jne	.L3
	rep ret
	.cfi_endproc
.LFE23:
	.size	odd_parity, .-odd_parity
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"result = %d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$1003, %edi
	call	odd_parity
	movl	%eax, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
