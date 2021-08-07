	.file	"string_loop.c"
# GNU C17 (Ubuntu 9.3.0-17ubuntu1~20.04) version 9.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu string_loop.c
# -mtune=generic -march=x86-64 -fverbose-asm -fasynchronous-unwind-tables
# -fstack-protector-strong -Wformat -Wformat-security
# -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec -fcommon
# -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
# -fipa-stack-alignment -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
# -fmerge-debug-strings -fpeephole -fplt -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fsemantic-interposition -fshow-column -fshrink-wrap-separate
# -fsigned-zeros -fsplit-ivs-in-unroller -fssa-backprop
# -fstack-clash-protection -fstack-protector-strong -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math -ftree-cselim
# -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -funit-at-a-time -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.globl	lowercase
	.type	lowercase, @function
lowercase:
.LFB6:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# p, p
# string_loop.c:22:    while (*p != 0)
	jmp	.L2	#
.L3:
# string_loop.c:23: 	*(p++) |= 0x20;
	movq	-8(%rbp), %rax	# p, p.0_1
	leaq	1(%rax), %rdx	#, tmp86
	movq	%rdx, -8(%rbp)	# tmp86, p
# string_loop.c:23: 	*(p++) |= 0x20;
	movzbl	(%rax), %edx	# *p.1_10, _2
	orl	$32, %edx	#, _3
	movb	%dl, (%rax)	# _3, *p.1_10
.L2:
# string_loop.c:22:    while (*p != 0)
	movq	-8(%rbp), %rax	# p, tmp87
	movzbl	(%rax), %eax	# *p_5, _4
# string_loop.c:22:    while (*p != 0)
	testb	%al, %al	# _4
	jne	.L3	#,
# string_loop.c:24: }
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	lowercase, .-lowercase
	.section	.rodata
.LC0:
	.string	"done"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$144, %rsp	#,
	movl	%edi, -132(%rbp)	# argc, argc
	movq	%rsi, -144(%rbp)	# argv, argv
# string_loop.c:29: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp89
	movq	%rax, -8(%rbp)	# tmp89, D.2856
	xorl	%eax, %eax	# tmp89
# string_loop.c:30:    int numiters = 10000000;
	movl	$10000000, -116(%rbp)	#, numiters
# string_loop.c:35:    for(i=0; i<99; i++)
	movl	$0, -120(%rbp)	#, i
# string_loop.c:35:    for(i=0; i<99; i++)
	jmp	.L5	#
.L6:
# string_loop.c:37:       string[i] = 'A';
	movl	-120(%rbp), %eax	# i, tmp85
	cltq
	movb	$65, -112(%rbp,%rax)	#, string
# string_loop.c:35:    for(i=0; i<99; i++)
	addl	$1, -120(%rbp)	#, i
.L5:
# string_loop.c:35:    for(i=0; i<99; i++)
	cmpl	$98, -120(%rbp)	#, i
	jle	.L6	#,
# string_loop.c:39:    string[99] = '\0';		/* null-terminate the string */
	movb	$0, -13(%rbp)	#, string
# string_loop.c:41:    for(i=0; i<numiters; i++)
	movl	$0, -120(%rbp)	#, i
# string_loop.c:41:    for(i=0; i<numiters; i++)
	jmp	.L7	#
.L8:
# string_loop.c:43:       lowercase(string);
	leaq	-112(%rbp), %rax	#, tmp86
	movq	%rax, %rdi	# tmp86,
	call	lowercase	#
# string_loop.c:41:    for(i=0; i<numiters; i++)
	addl	$1, -120(%rbp)	#, i
.L7:
# string_loop.c:41:    for(i=0; i<numiters; i++)
	movl	-120(%rbp), %eax	# i, tmp87
	cmpl	-116(%rbp), %eax	# numiters, tmp87
	jl	.L8	#,
# string_loop.c:45:    printf("done\n");
	leaq	.LC0(%rip), %rdi	#,
	call	puts@PLT	#
# string_loop.c:47:    return 0;
	movl	$0, %eax	#, _11
# string_loop.c:48: }
	movq	-8(%rbp), %rdx	# D.2856, tmp90
	xorq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp90
	je	.L10	#,
	call	__stack_chk_fail@PLT	#
.L10:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
