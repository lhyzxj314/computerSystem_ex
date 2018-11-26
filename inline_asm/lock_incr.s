	.file	"lock_incr.c"
	.text
	.globl	lock_incr
	.type	lock_incr, @function
lock_incr:
.LFB23:
	.cfi_startproc
#APP
# 4 "lock_incr.c" 1
	lock   
	addl $1, (%rdi)  
	
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE23:
	.size	lock_incr, .-lock_incr
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"cnt=%d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	$0, 4(%rsp)
	movl	$0, %ebx
	jmp	.L3
.L4:
	leaq	4(%rsp), %rdi
	call	lock_incr
	addl	$1, %ebx
.L3:
	cmpl	$4, %ebx
	jle	.L4
	movl	4(%rsp), %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L7
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
