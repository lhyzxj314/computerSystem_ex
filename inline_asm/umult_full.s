	.file	"umult_full.c"
	.text
	.globl	umult_full
	.type	umult_full, @function
umult_full:
.LFB23:
	.cfi_startproc
	movq	%rdx, %rcx
#APP
# 4 "umult_full.c" 1
	movq %rdi, %rax   	
	mulq %rsi 		
	movq %rax, (%rcx) 
	movq %rdx, 8(%rcx) 
	
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE23:
	.size	umult_full, .-umult_full
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"dest[1] = %lu\n"
.LC1:
	.string	"dest[0] = %lu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	$0, (%rsp)
	movq	$0, 8(%rsp)
	movq	%rsp, %rdx
	movabsq	$8888888888888888, %rsi
	movabsq	$9999999999999999, %rdi
	call	umult_full
	movq	8(%rsp), %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	(%rsp), %rdx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L5
	movl	$0, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
