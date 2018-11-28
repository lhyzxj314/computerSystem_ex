	.file	"dsqrt.c"
	.text
	.globl	dsqrt
	.type	dsqrt, @function
dsqrt:
.LFB23:
	.cfi_startproc
#APP
# 5 "dsqrt.c" 1
	sqrtsd %xmm0, %xmm0 
	
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE23:
	.size	dsqrt, .-dsqrt
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"result = %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movsd	.LC0(%rip), %xmm0
	call	dsqrt
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	858993459
	.long	1072902963
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
