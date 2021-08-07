	.file	"Multigrid0.c"
	.text
	.p2align 4
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movslq	%edi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	0(,%rbp,8), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	malloc@PLT
	movq	%rax, %r13
	testl	%ebp, %ebp
	jle	.L1
	movq	%rax, %rbx
	leal	-1(%rbp), %eax
	leaq	8(%r13,%rax,8), %r12
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$8, %esi
	movq	%rbp, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r12, %rbx
	jne	.L3
.L1:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE41:
	.size	alloc_matrix, .-alloc_matrix
	.p2align 4
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testl	%esi, %esi
	jle	.L8
	leal	-1(%rsi), %eax
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L9
.L8:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%r12, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE42:
	.size	dealloc_matrix, .-dealloc_matrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"%lf\n"
	.text
	.p2align 4
	.globl	read_data
	.type	read_data, @function
read_data:
.LFB43:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	leaq	.LC0(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	fopen@PLT
	testq	%rax, %rax
	je	.L18
	testl	%ebx, %ebx
	jle	.L17
	movq	%rax, %r12
	leal	-1(%rbx), %eax
	leaq	.LC1(%rip), %r13
	leaq	8(%rbp,%rax,8), %r15
	leaq	8(,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L15:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L16:
	movq	0(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	addq	%rbx, %rdx
	addq	$8, %rbx
	call	__isoc99_fscanf@PLT
	cmpq	%rbx, %r14
	jne	.L16
	addq	$8, %rbp
	cmpq	%r15, %rbp
	jne	.L15
.L17:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movl	$-1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	read_data, .-read_data
	.p2align 4
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB44:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	jle	.L24
	addl	$1, %edi
	movl	$1, %r8d
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L23:
	addl	$1, %eax
	addl	%r8d, %r8d
	cmpl	%edi, %eax
	jne	.L23
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	movl	$1, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE44:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC2:
	.string	"\n"
	.text
	.p2align 4
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB45:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %r14
	leaq	.LC2(%rip), %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movsd	%xmm0, (%rsp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L26
	movsd	(%rsp), %xmm4
	leal	-1(%rbx), %ebp
	xorl	%r13d, %r13d
	movapd	%xmm4, %xmm7
	mulsd	%xmm4, %xmm7
	movsd	%xmm7, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L28:
	pxor	%xmm1, %xmm1
	movsd	.LC3(%rip), %xmm0
	xorl	%ebx, %ebx
	cvtsi2sdl	%r13d, %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm1, 8(%rsp)
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	8(%rsp), %xmm1
	movsd	%xmm0, 24(%rsp)
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movq	(%r14,%r13,8), %r12
	movsd	%xmm0, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L29:
	pxor	%xmm2, %xmm2
	movsd	.LC3(%rip), %xmm0
	cvtsi2sdl	%ebx, %xmm2
	mulsd	%xmm2, %xmm0
	movsd	%xmm2, 16(%rsp)
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	16(%rsp), %xmm2
	movsd	%xmm0, 8(%rsp)
	movsd	.LC4(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	8(%rsp), %xmm1
	movq	%rbx, %rax
	mulsd	40(%rsp), %xmm1
	mulsd	%xmm0, %xmm1
	mulsd	24(%rsp), %xmm1
	mulsd	32(%rsp), %xmm1
	movsd	%xmm1, (%r12,%rbx,8)
	addq	$1, %rbx
	cmpq	%rbp, %rax
	jne	.L29
	leaq	1(%r13), %rax
	cmpq	%r13, %rbp
	je	.L26
	movq	%rax, %r13
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L26:
	addq	$48, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE45:
	.size	fill_f, .-fill_f
	.p2align 4
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB46:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L36
	leal	-1(%rsi), %eax
	movq	.LC7(%rip), %xmm2
	pxor	%xmm1, %xmm1
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L34:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L35:
	movsd	(%rax), %xmm0
	addq	$8, %rax
	andpd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	%rax, %rdx
	jne	.L35
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L34
	movapd	%xmm1, %xmm0
	ret
.L36:
	pxor	%xmm1, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE46:
	.size	L1_norm, .-L1_norm
	.p2align 4
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB47:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L43
	leal	-1(%rsi), %eax
	pxor	%xmm2, %xmm2
	salq	$3, %rax
	movapd	%xmm2, %xmm1
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L40:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L41:
	movsd	(%rax), %xmm0
	addq	$8, %rax
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	%rax, %rdx
	jne	.L41
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L40
	ucomisd	%xmm1, %xmm2
	movapd	%xmm1, %xmm3
	sqrtsd	%xmm3, %xmm3
	ja	.L49
	movapd	%xmm3, %xmm0
	ret
.L43:
	pxor	%xmm3, %xmm3
	movapd	%xmm3, %xmm0
	ret
.L49:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movapd	%xmm1, %xmm0
	movsd	%xmm3, 8(%rsp)
	call	sqrt@PLT
	movsd	8(%rsp), %xmm3
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	movapd	%xmm3, %xmm0
	ret
	.cfi_endproc
.LFE47:
	.size	L2_norm, .-L2_norm
	.p2align 4
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB48:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rdx
	movsd	(%rdx), %xmm1
	testl	%esi, %esi
	jle	.L50
	leal	-1(%rsi), %eax
	leaq	8(%rdi), %rcx
	movq	.LC7(%rip), %xmm2
	movapd	%xmm1, %xmm0
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdi
	leaq	8(%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L52:
	leaq	8(%rdx), %rax
	addq	%rsi, %rdx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L55:
	movsd	(%rax), %xmm0
	addq	$8, %rax
.L56:
	andpd	%xmm2, %xmm0
	maxsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	cmpq	%rdx, %rax
	jne	.L55
	cmpq	%rdi, %rcx
	je	.L50
	movq	(%rcx), %rdx
	addq	$8, %rcx
	movsd	(%rdx), %xmm0
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L50:
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE48:
	.size	Max_norm, .-Max_norm
	.p2align 4
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB49:
	.cfi_startproc
	endbr64
	cmpl	$2, %ecx
	jle	.L65
	leal	-3(%rcx), %r8d
	movsd	.LC8(%rip), %xmm1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	addq	$2, %r8
	movq	%rsi, %rbx
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L61:
	movq	(%rdi,%rsi,8), %rcx
	movq	-8(%rdi,%rsi,8), %rdx
	movl	$1, %eax
	movq	8(%rdi,%rsi,8), %r11
	movq	0(%rbp,%rsi,8), %r10
	movq	(%rbx,%rsi,8), %r9
	.p2align 4,,10
	.p2align 3
.L60:
	movsd	(%rcx,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	subsd	(%rdx,%rax,8), %xmm0
	subsd	(%r11,%rax,8), %xmm0
	subsd	-8(%rcx,%rax,8), %xmm0
	subsd	8(%rcx,%rax,8), %xmm0
	subsd	(%r10,%rax,8), %xmm0
	movsd	%xmm0, (%r9,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %r8
	jne	.L60
	addq	$1, %rsi
	cmpq	%rsi, %r8
	jne	.L61
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L65:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE49:
	.size	L_def, .-L_def
	.p2align 4
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB50:
	.cfi_startproc
	endbr64
	cmpl	$2, %edx
	jle	.L68
	leal	-3(%rdx), %ecx
	movsd	.LC9(%rip), %xmm1
	movl	$1, %r11d
	addq	$2, %rcx
	.p2align 4,,10
	.p2align 3
.L71:
	movq	-8(%rdi,%r11,8), %r10
	movq	8(%rdi,%r11,8), %r9
	movl	$1, %eax
	movq	(%rdi,%r11,8), %rdx
	movq	(%rsi,%r11,8), %r8
	.p2align 4,,10
	.p2align 3
.L70:
	movsd	(%r10,%rax,8), %xmm0
	addsd	(%r9,%rax,8), %xmm0
	addsd	-8(%rdx,%rax,8), %xmm0
	addsd	8(%rdx,%rax,8), %xmm0
	addsd	(%r8,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rcx
	jne	.L70
	addq	$1, %r11
	cmpq	%r11, %rcx
	jne	.L71
.L68:
	ret
	.cfi_endproc
.LFE50:
	.size	GS_update, .-GS_update
	.p2align 4
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB51:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L74
	movq	(%rdi), %r8
	movslq	%esi, %rax
	leal	-1(%rsi), %ecx
	salq	$3, %rax
	salq	$3, %rcx
	movq	-8(%rdi,%rax), %r9
	leaq	-8(%rax), %r10
	movq	%r8, %rdx
	xorl	%eax, %eax
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L77:
	movq	8(%rdi,%rax), %rdx
	addq	$8, %rax
.L76:
	movq	$0x000000000, (%r8,%rax)
	movq	$0x000000000, (%r9,%rax)
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r10)
	cmpq	%rcx, %rax
	jne	.L77
.L74:
	ret
	.cfi_endproc
.LFE51:
	.size	set_BC, .-set_BC
	.p2align 4
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB52:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L78
	leal	-1(%rdx), %r10d
	movsd	.LC8(%rip), %xmm1
	xorl	%r8d, %r8d
	leaq	1(%r10), %r9
	salq	$4, %r9
	.p2align 4,,10
	.p2align 3
.L80:
	movq	%r8, %rax
	movq	(%rsi,%r8,8), %rdx
	salq	$4, %rax
	movq	(%rdi,%rax), %rax
	leaq	(%r9,%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L81:
	movsd	(%rax), %xmm0
	addq	$16, %rax
	addq	$8, %rdx
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rdx)
	cmpq	%rax, %rcx
	jne	.L81
	leaq	1(%r8), %rax
	cmpq	%r10, %r8
	je	.L78
	movq	%rax, %r8
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L78:
	ret
	.cfi_endproc
.LFE52:
	.size	res_R, .-res_R
	.p2align 4
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB53:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L84
	leal	-1(%rdx), %eax
	movq	%rdi, %r8
	salq	$3, %rax
	leaq	8(%rdi,%rax), %r10
	leaq	8(%rax), %r9
	.p2align 4,,10
	.p2align 3
.L85:
	movq	(%r8), %rax
	leaq	(%r9,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L86:
	movq	$0x000000000, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L86
	addq	$8, %r8
	cmpq	%r10, %r8
	jne	.L85
.L84:
	cmpl	$1, %ecx
	jle	.L83
	leal	-2(%rcx), %eax
	movsd	.LC10(%rip), %xmm1
	movsd	.LC9(%rip), %xmm2
	xorl	%r11d, %r11d
	leaq	8(,%rax,8), %r10
	.p2align 4,,10
	.p2align 3
.L89:
	movq	(%rdi,%r11,2), %r9
	movq	8(%rsi,%r11), %rcx
	xorl	%eax, %eax
	movq	8(%rdi,%r11,2), %r8
	movq	(%rsi,%r11), %rdx
	.p2align 4,,10
	.p2align 3
.L88:
	movsd	(%rdx), %xmm0
	addq	$8, %rdx
	movsd	%xmm0, (%r9,%rax,2)
	movsd	-8(%rdx), %xmm0
	addsd	(%rcx,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%r8,%rax,2)
	movsd	-8(%rdx), %xmm0
	addsd	(%rdx), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%r9,%rax,2)
	movsd	-8(%rdx), %xmm0
	addsd	(%rdx), %xmm0
	addsd	(%rcx,%rax), %xmm0
	addsd	8(%rcx,%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, 8(%r8,%rax,2)
	addq	$8, %rax
	cmpq	%rax, %r10
	jne	.L88
	addq	$8, %r11
	cmpq	%r11, %r10
	jne	.L89
.L83:
	ret
	.cfi_endproc
.LFE53:
	.size	prol_P, .-prol_P
	.p2align 4
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movsd	%xmm0, 24(%rsp)
	movsd	%xmm1, 8(%rsp)
	testl	%edi, %edi
	jle	.L106
	leal	1(%rdi), %ecx
	movl	$1, %eax
	movl	$1, %edx
	.p2align 4,,10
	.p2align 3
.L95:
	addl	$1, %eax
	addl	%edx, %edx
	cmpl	%ecx, %eax
	jne	.L95
	leal	1(%rdx), %r14d
	cmpl	$1, %ebx
	jle	.L94
	movl	$1, %eax
	movl	$1, %ebp
	.p2align 4,,10
	.p2align 3
.L96:
	addl	$1, %eax
	addl	%ebp, %ebp
	cmpl	%eax, %ebx
	jne	.L96
	leal	1(%rbp), %eax
	movl	%eax, 40(%rsp)
.L98:
	movl	%r14d, %edi
	movl	%edx, 44(%rsp)
	call	alloc_matrix
	movl	40(%rsp), %edi
	movq	%rax, %r13
	call	alloc_matrix
	movl	%r14d, %edi
	movq	%rax, 32(%rsp)
	call	alloc_matrix
	movl	40(%rsp), %edi
	movq	%rax, %rbp
	call	alloc_matrix
	movsd	8(%rsp), %xmm3
	movslq	44(%rsp), %rdx
	movq	%rax, 16(%rsp)
	movapd	%xmm3, %xmm0
	divsd	%xmm3, %xmm0
	comisd	.LC11(%rip), %xmm0
	jbe	.L105
	leal	-1(%rbx), %eax
	leaq	8(,%rdx,8), %rbx
	movl	%eax, 44(%rsp)
.L104:
	movq	%r15, %rdi
	movl	%r14d, %edx
	movq	%r12, %rsi
	call	GS_update
	movl	%r14d, %ecx
	movq	%r12, %rdx
	movq	%r13, %rsi
	call	L_def
	movq	32(%rsp), %rsi
	movl	40(%rsp), %edx
	movq	%r13, %rdi
	call	res_R
	movsd	8(%rsp), %xmm1
	movsd	24(%rsp), %xmm0
	movq	%rsi, %rdx
	movl	44(%rsp), %edi
	movq	16(%rsp), %rsi
	call	multigrid_vcycle
	movq	16(%rsp), %rsi
	movl	%r14d, %edx
	movq	%rbp, %rdi
	movl	40(%rsp), %ecx
	call	prol_P
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L101:
	movq	(%r15,%rsi), %rdx
	movq	0(%rbp,%rsi), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L102:
	movsd	(%rdx,%rax), %xmm0
	subsd	(%rcx,%rax), %xmm0
	movsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rbx
	jne	.L102
	addq	$8, %rsi
	cmpq	%rsi, %rbx
	jne	.L101
	movl	%r14d, %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	GS_update
	movl	%r14d, %esi
	movq	%r13, %rdi
	call	L2_norm
	divsd	8(%rsp), %xmm0
	comisd	.LC11(%rip), %xmm0
	ja	.L104
.L105:
	movl	%r14d, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	40(%rsp), %ebx
	movq	32(%rsp), %rdi
	movl	%ebx, %esi
	call	dealloc_matrix
	movl	%r14d, %esi
	movq	%rbp, %rdi
	call	dealloc_matrix
	movq	16(%rsp), %rdi
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebx, %esi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	dealloc_matrix
.L106:
	.cfi_restore_state
	movl	$2, %r14d
	movl	$1, %edx
.L94:
	cmpl	$1, %ebx
	jne	.L107
	movsd	24(%rsp), %xmm0
	movq	8(%r12), %rdx
	movq	8(%r15), %rax
	mulsd	%xmm0, %xmm0
	mulsd	8(%rdx), %xmm0
	movsd	%xmm0, 8(%rax)
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L107:
	.cfi_restore_state
	movl	$2, 40(%rsp)
	jmp	.L98
	.cfi_endproc
.LFE40:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.p2align 4
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB54:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L115
	leal	-1(%rdx), %r8d
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L117:
	movq	(%rdi,%r10,8), %rdx
	movq	(%rsi,%r10,8), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L118:
	movsd	(%rdx,%rax,8), %xmm0
	subsd	(%r9,%rax,8), %xmm0
	movq	%rax, %rcx
	movsd	%xmm0, (%rdx,%rax,8)
	addq	$1, %rax
	cmpq	%r8, %rcx
	jne	.L118
	leaq	1(%r10), %rax
	cmpq	%r10, %r8
	je	.L115
	movq	%rax, %r10
	jmp	.L117
	.p2align 4,,10
	.p2align 3
.L115:
	ret
	.cfi_endproc
.LFE54:
	.size	u_update, .-u_update
	.p2align 4
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB55:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L120
	leal	-1(%rsi), %eax
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L122:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L123:
	movq	$0x000000000, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L123
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L122
.L120:
	ret
	.cfi_endproc
.LFE55:
	.size	set_zeros, .-set_zeros
	.p2align 4
	.globl	verify
	.type	verify, @function
verify:
.LFB56:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L132
	movq	.LC7(%rip), %xmm2
	movsd	.LC11(%rip), %xmm1
	leal	-1(%rdx), %r9d
	xorl	%r10d, %r10d
.L127:
	movq	(%rdi,%r10,8), %r8
	movq	(%rsi,%r10,8), %rcx
	xorl	%eax, %eax
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L134:
	leaq	1(%rax), %rdx
	cmpq	%rax, %r9
	je	.L133
	movq	%rdx, %rax
.L128:
	movsd	(%r8,%rax,8), %xmm0
	subsd	(%rcx,%rax,8), %xmm0
	andpd	%xmm2, %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L134
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L133:
	leaq	1(%r10), %rax
	cmpq	%r10, %r9
	je	.L132
	movq	%rax, %r10
	jmp	.L127
.L132:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE56:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC13:
	.string	"\nResult OK!"
.LC14:
	.string	"\nResult not OK!"
.LC16:
	.string	"time = %lf s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$1, %edx
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$9, %eax
	.p2align 4,,10
	.p2align 3
.L136:
	addl	%edx, %edx
	subl	$1, %eax
	jne	.L136
	pxor	%xmm0, %xmm0
	movsd	.LC12(%rip), %xmm1
	movl	$29793, %eax
	movl	$1680762733, 49(%rsp)
	cvtsi2sdl	%edx, %xmm0
	movw	%ax, 53(%rsp)
	movapd	%xmm1, %xmm2
	movb	$0, 55(%rsp)
	divsd	%xmm0, %xmm2
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %ebp
	movl	%ebp, %edi
	movsd	%xmm2, (%rsp)
	call	alloc_matrix
	movl	%ebp, %edi
	movq	%rax, %r14
	call	alloc_matrix
	movl	%ebp, %edi
	movq	%rax, %r13
	call	alloc_matrix
	movl	%ebp, %edx
	leaq	49(%rsp), %rsi
	movq	%r14, %rdi
	movq	%rax, %r12
	call	read_data
	movsd	(%rsp), %xmm2
	movl	%ebp, %esi
	movq	%r12, %rdi
	movapd	%xmm2, %xmm0
	movsd	%xmm2, 8(%rsp)
	call	fill_f
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	L2_norm
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	movsd	%xmm0, (%rsp)
	call	gettimeofday@PLT
	movsd	(%rsp), %xmm1
	movq	%r12, %rdx
	movq	%r13, %rsi
	movsd	8(%rsp), %xmm2
	movl	$9, %edi
	movapd	%xmm2, %xmm0
	call	multigrid_vcycle
	xorl	%esi, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday@PLT
	movl	%ebp, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	verify
	testl	%eax, %eax
	je	.L137
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
.L138:
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movsd	.LC15(%rip), %xmm2
	leaq	.LC16(%rip), %rsi
	cvtsi2sdq	40(%rsp), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	cvtsi2sdq	32(%rsp), %xmm1
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	24(%rsp), %xmm1
	divsd	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdq	16(%rsp), %xmm2
	addsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movl	%ebp, %esi
	movq	%r14, %rdi
	call	dealloc_matrix
	movl	%ebp, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L142
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L137:
	.cfi_restore_state
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L138
.L142:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.str1.1
.LC17:
	.string	"%lf "
	.text
	.p2align 4
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB57:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L149
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leal	-1(%rsi), %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	8(%rdi,%rax,8), %r14
	leaq	8(,%rax,8), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	.LC17(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.p2align 4,,10
	.p2align 3
.L145:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L146:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	movsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L146
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L145
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L149:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE57:
	.size	print_matrix, .-print_matrix
	.globl	epsilon
	.section	.rodata
	.align 8
	.type	epsilon, @object
	.size	epsilon, 8
epsilon:
	.long	2296604913
	.long	1055193269
	.globl	pi
	.align 8
	.type	pi, @object
	.size	pi, 8
pi:
	.long	1413754136
	.long	1074340347
	.globl	l
	.align 4
	.type	l, @object
	.size	l, 4
l:
	.long	9
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	1413754136
	.long	1074340347
	.align 8
.LC4:
	.long	3700601565
	.long	1075168253
	.align 8
.LC5:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	0
	.long	1074790400
	.align 8
.LC9:
	.long	0
	.long	1070596096
	.align 8
.LC10:
	.long	0
	.long	1071644672
	.align 8
.LC11:
	.long	2296604913
	.long	1055193269
	.align 8
.LC12:
	.long	0
	.long	1072693248
	.align 8
.LC15:
	.long	0
	.long	1093567616
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
