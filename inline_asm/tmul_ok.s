	.file	"tmul_ok.c"
	.text
	.globl	tmult_ok
	.type	tmult_ok, @function
tmult_ok:
.LFB23:
	.cfi_startproc
	movq	%rsi, %rax
#APP
# 6 "tmul_ok.c" 1
	imulq %rdi, %rax    
	setb  %dil          
	
# 0 "" 2
#NO_APP
	movq	%rax, (%rdx)
	movsbl	%dil, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	tmult_ok, .-tmult_ok
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"result = %d\n"
.LC1:
	.string	"dest = %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	$0, (%rsp)
	movq	%rsp, %rdx
	movl	$11, %esi
	movabsq	$9999999999, %rdi
	call	tmult_ok
	movl	%eax, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	(%rsp), %rdx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L5
	movl	$0, %eax
	addq	$24, %rsp
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
