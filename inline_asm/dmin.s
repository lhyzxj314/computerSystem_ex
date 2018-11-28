	.file	"dmin.c"
	.text
	.globl	dmin
	.type	dmin, @function
dmin:
.LFB23:
	.cfi_startproc
#APP
# 5 "dmin.c" 1
	vminsd %xmm0, %xmm1, %xmm0 
	
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE23:
	.size	dmin, .-dmin
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"result = %lf \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movsd	.LC0(%rip), %xmm1
	movsd	.LC1(%rip), %xmm0
	call	dmin
	leaq	.LC2(%rip), %rsi
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
	.long	3435973837
	.long	1076088012
	.align 8
.LC1:
	.long	1717986918
	.long	1076520550
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
