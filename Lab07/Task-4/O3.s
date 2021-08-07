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
	cmpq	%rax, %rbp
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
	jle	.L39
	movl	%esi, %r9d
	leal	-1(%rsi), %eax
	pxor	%xmm0, %xmm0
	movl	%esi, %r8d
	shrl	%r9d
	leaq	8(%rdi,%rax,8), %r10
	andl	$-2, %r8d
	movapd	.LC8(%rip), %xmm4
	movq	.LC7(%rip), %xmm3
	salq	$4, %r9
	.p2align 4,,10
	.p2align 3
.L34:
	movq	(%rdi), %rdx
	cmpl	$1, %esi
	je	.L40
	movq	%rdx, %rax
	leaq	(%r9,%rdx), %rcx
	.p2align 4,,10
	.p2align 3
.L36:
	movupd	(%rax), %xmm1
	addq	$16, %rax
	andpd	%xmm4, %xmm1
	movapd	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	cmpq	%rax, %rcx
	jne	.L36
	movslq	%r8d, %rax
	cmpl	%esi, %r8d
	je	.L35
.L38:
	movsd	(%rdx,%rax,8), %xmm1
	andpd	%xmm3, %xmm1
	addsd	%xmm1, %xmm0
.L35:
	addq	$8, %rdi
	cmpq	%r10, %rdi
	jne	.L34
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	xorl	%eax, %eax
	jmp	.L38
.L39:
	pxor	%xmm0, %xmm0
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
	jle	.L51
	movl	%esi, %r9d
	leal	-1(%rsi), %eax
	pxor	%xmm3, %xmm3
	movl	%esi, %r8d
	shrl	%r9d
	leaq	8(%rdi,%rax,8), %r10
	movapd	%xmm3, %xmm0
	andl	$-2, %r8d
	salq	$4, %r9
	.p2align 4,,10
	.p2align 3
.L45:
	movq	(%rdi), %rdx
	cmpl	$1, %esi
	je	.L52
	movq	%rdx, %rax
	leaq	(%r9,%rdx), %rcx
	.p2align 4,,10
	.p2align 3
.L47:
	movupd	(%rax), %xmm1
	addq	$16, %rax
	mulpd	%xmm1, %xmm1
	movapd	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	cmpq	%rax, %rcx
	jne	.L47
	movslq	%r8d, %rax
	cmpl	%esi, %r8d
	je	.L46
.L50:
	movsd	(%rdx,%rax,8), %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
.L46:
	addq	$8, %rdi
	cmpq	%r10, %rdi
	jne	.L45
	ucomisd	%xmm0, %xmm3
	movapd	%xmm0, %xmm1
	sqrtsd	%xmm1, %xmm1
	ja	.L59
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	xorl	%eax, %eax
	jmp	.L50
.L51:
	pxor	%xmm1, %xmm1
	movapd	%xmm1, %xmm0
	ret
.L59:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movsd	%xmm1, 8(%rsp)
	call	sqrt@PLT
	movsd	8(%rsp), %xmm1
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	movapd	%xmm1, %xmm0
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
	movq	(%rdi), %rax
	movsd	(%rax), %xmm1
	testl	%esi, %esi
	jle	.L60
	leal	-1(%rsi), %eax
	movq	.LC7(%rip), %xmm2
	salq	$3, %rax
	leaq	8(%rax,%rdi), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L65:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L64:
	movsd	(%rax), %xmm0
	addq	$8, %rax
	andpd	%xmm2, %xmm0
	maxsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	cmpq	%rax, %rdx
	jne	.L64
	addq	$8, %rdi
	cmpq	%rdi, %rsi
	jne	.L65
.L60:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, -48(%rsp)
	movq	%rsi, -40(%rsp)
	movq	%rdx, -32(%rsp)
	movl	%ecx, -20(%rsp)
	cmpl	$2, %ecx
	jle	.L69
	leal	-3(%rcx), %eax
	movsd	.LC10(%rip), %xmm3
	movapd	.LC9(%rip), %xmm1
	movl	$1, %r9d
	addq	$2, %rax
	movq	%rax, -56(%rsp)
	leal	-2(%rcx), %eax
	movapd	%xmm3, %xmm2
	movl	%eax, %ecx
	movl	%eax, %ebx
	movl	%eax, -12(%rsp)
	orl	$1, %eax
	andl	$-2, %ecx
	shrl	%ebx
	movslq	%eax, %rdx
	movl	%ecx, -16(%rsp)
	salq	$3, %rdx
	salq	$4, %rbx
	addq	$8, %rbx
	leaq	-8(%rdx), %r14
	leaq	8(%rdx), %r13
	.p2align 4,,10
	.p2align 3
.L75:
	movq	-32(%rsp), %rdi
	movq	-48(%rsp), %rsi
	movq	(%rdi,%r9,8), %r8
	movq	-40(%rsp), %rdi
	movq	-8(%rsi,%r9,8), %rcx
	movq	(%rsi,%r9,8), %rax
	movq	(%rdi,%r9,8), %rdi
	movq	8(%rsi,%r9,8), %rsi
	leaq	8(%rcx), %r10
	leaq	24(%rdi), %r12
	leaq	8(%rdi), %rbp
	cmpq	%r10, %r12
	leaq	24(%rcx), %r10
	setbe	%r15b
	cmpq	%r10, %rbp
	setnb	%r10b
	orl	%r10d, %r15d
	leaq	32(%rax), %r10
	cmpq	%r10, %rbp
	setnb	%r11b
	cmpq	%r12, %rax
	setnb	%r10b
	orl	%r11d, %r10d
	andl	%r15d, %r10d
	cmpl	$3, -20(%rsp)
	leaq	24(%rsi), %r15
	setne	%r11b
	andl	%r11d, %r10d
	leaq	8(%rsi), %r11
	cmpq	%r11, %r12
	setbe	%r11b
	cmpq	%r15, %rbp
	setnb	%r15b
	orl	%r15d, %r11d
	testb	%r11b, %r10b
	je	.L76
	leaq	8(%r8), %r10
	leaq	24(%r8), %r11
	cmpq	%r10, %r12
	setbe	%r10b
	cmpq	%r11, %rbp
	setnb	%r11b
	orb	%r11b, %r10b
	je	.L76
	movl	$8, %r10d
	.p2align 4,,10
	.p2align 3
.L72:
	movupd	(%rax,%r10), %xmm0
	movupd	(%rcx,%r10), %xmm4
	movupd	(%rsi,%r10), %xmm5
	movupd	-8(%rax,%r10), %xmm6
	mulpd	%xmm1, %xmm0
	movupd	8(%rax,%r10), %xmm7
	subpd	%xmm4, %xmm0
	movupd	(%r8,%r10), %xmm4
	subpd	%xmm5, %xmm0
	subpd	%xmm6, %xmm0
	subpd	%xmm7, %xmm0
	subpd	%xmm4, %xmm0
	movups	%xmm0, (%rdi,%r10)
	addq	$16, %r10
	cmpq	%rbx, %r10
	jne	.L72
	movl	-12(%rsp), %r11d
	cmpl	%r11d, -16(%rsp)
	je	.L74
	movsd	(%rax,%rdx), %xmm0
	mulsd	%xmm2, %xmm0
	subsd	(%rcx,%rdx), %xmm0
	subsd	(%rsi,%rdx), %xmm0
	subsd	(%rax,%r14), %xmm0
	subsd	(%rax,%r13), %xmm0
	subsd	(%r8,%rdx), %xmm0
	movsd	%xmm0, (%rdi,%rdx)
.L74:
	addq	$1, %r9
	cmpq	%r9, -56(%rsp)
	jne	.L75
.L69:
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
	movq	-56(%rsp), %r11
	movl	$1, %r10d
	.p2align 4,,10
	.p2align 3
.L71:
	movsd	(%rax,%r10,8), %xmm0
	mulsd	%xmm3, %xmm0
	subsd	(%rcx,%r10,8), %xmm0
	subsd	(%rsi,%r10,8), %xmm0
	subsd	-8(%rax,%r10,8), %xmm0
	subsd	8(%rax,%r10,8), %xmm0
	subsd	(%r8,%r10,8), %xmm0
	movsd	%xmm0, (%rdi,%r10,8)
	addq	$1, %r10
	cmpq	%r10, %r11
	jne	.L71
	jmp	.L74
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
	jle	.L87
	leal	-3(%rdx), %ecx
	movsd	.LC11(%rip), %xmm2
	movl	$1, %r11d
	addq	$2, %rcx
	.p2align 4,,10
	.p2align 3
.L90:
	movq	(%rdi,%r11,8), %rdx
	movq	-8(%rdi,%r11,8), %r10
	movl	$1, %eax
	movq	8(%rdi,%r11,8), %r9
	movq	(%rsi,%r11,8), %r8
	movsd	(%rdx), %xmm1
	.p2align 4,,10
	.p2align 3
.L89:
	movsd	(%r10,%rax,8), %xmm0
	addsd	(%r9,%rax,8), %xmm0
	addsd	%xmm1, %xmm0
	addsd	8(%rdx,%rax,8), %xmm0
	addsd	(%r8,%rax,8), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	movsd	%xmm1, (%rdx,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rcx
	jne	.L89
	addq	$1, %r11
	cmpq	%r11, %rcx
	jne	.L90
.L87:
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
	jle	.L93
	movslq	%esi, %rax
	movq	(%rdi), %r10
	leal	-1(%rsi), %ecx
	salq	$3, %rax
	movq	-8(%rdi,%rax), %r8
	leaq	-8(%rax), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L95:
	movq	(%rdi,%rax,8), %rdx
	movq	$0x000000000, (%r10,%rax,8)
	movq	$0x000000000, (%r8,%rax,8)
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%rdx, %rcx
	jne	.L95
.L93:
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
	jle	.L115
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movsd	.LC10(%rip), %xmm2
	xorl	%r9d, %r9d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movapd	.LC9(%rip), %xmm1
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leal	-1(%rdx), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%r12d, %ecx
	movl	%r12d, %r8d
	movq	%r12, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	movslq	%edx, %rsi
	andl	$-2, %ecx
	movq	%rsi, %rax
	movl	%ecx, %r13d
	shrl	%r8d
	salq	$4, %rax
	salq	$3, %rsi
	leaq	-8(%rax), %r15
	leal	(%rcx,%rcx), %eax
	addl	$1, %ecx
	salq	$4, %r8
	movslq	%eax, %r14
	addl	$2, %eax
	movl	%ecx, -36(%rsp)
	salq	$3, %r13
	cltq
	salq	$3, %r14
	salq	$3, %rax
	movq	%rax, -32(%rsp)
	movl	%ecx, %eax
	salq	$3, %rax
	movq	%rax, -24(%rsp)
	leaq	1(%r12), %rax
	salq	$4, %rax
	movq	%rax, -16(%rsp)
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%r9, %rax
	movq	(%rbx,%r9,8), %rcx
	salq	$4, %rax
	movq	(%rdi,%rax), %rax
	leaq	(%rcx,%rsi), %r10
	cmpq	%r10, %rax
	leaq	(%rax,%r15), %r10
	setnb	%r11b
	cmpq	%r10, %rcx
	setnb	%r10b
	orb	%r10b, %r11b
	je	.L105
	xorl	%r10d, %r10d
	cmpl	$2, %ebp
	jbe	.L105
	.p2align 4,,10
	.p2align 3
.L102:
	movupd	(%rax,%r10,2), %xmm0
	movhpd	16(%rax,%r10,2), %xmm0
	mulpd	%xmm1, %xmm0
	movups	%xmm0, (%rcx,%r10)
	addq	$16, %r10
	cmpq	%r8, %r10
	jne	.L102
	movsd	(%rax,%r14), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, (%rcx,%r13)
	cmpl	-36(%rsp), %edx
	jle	.L100
	movq	-32(%rsp), %r11
	movsd	(%rax,%r11), %xmm0
	movq	-24(%rsp), %rax
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, (%rcx,%rax)
.L100:
	leaq	1(%r9), %rax
	cmpq	%r12, %r9
	je	.L97
.L118:
	movq	%rax, %r9
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L105:
	movq	-16(%rsp), %r11
	leaq	(%rax,%r11), %r10
	.p2align 4,,10
	.p2align 3
.L101:
	movsd	(%rax), %xmm0
	addq	$16, %rax
	addq	$8, %rcx
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, -8(%rcx)
	cmpq	%rax, %r10
	jne	.L101
	leaq	1(%r9), %rax
	cmpq	%r12, %r9
	jne	.L118
.L97:
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
.L115:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rdi, 24(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%ecx, 20(%rsp)
	testl	%edx, %edx
	jle	.L120
	leal	-1(%rdx), %eax
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %r12
	leaq	8(,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L121:
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	xorl	%esi, %esi
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r12, %rbx
	jne	.L121
.L120:
	movl	20(%rsp), %ebx
	cmpl	$1, %ebx
	jle	.L119
	leal	-2(%rbx), %eax
	movsd	.LC14(%rip), %xmm6
	movsd	.LC11(%rip), %xmm7
	leaq	8(,%rax,8), %rax
	movapd	.LC12(%rip), %xmm2
	movapd	.LC13(%rip), %xmm4
	movq	%rax, 8(%rsp)
	leal	-1(%rbx), %eax
	movapd	%xmm6, %xmm3
	movapd	%xmm7, %xmm5
	movq	%rax, %rbx
	leaq	8(,%rax,8), %rdi
	movl	%eax, 56(%rsp)
	salq	$4, %rax
	movq	%rax, 40(%rsp)
	movl	%ebx, %eax
	andl	$-2, %ebx
	movq	%rdi, 48(%rsp)
	leal	(%rbx,%rbx), %edi
	movslq	%ebx, %r8
	shrl	%eax
	salq	$4, %rax
	movslq	%edi, %rdi
	salq	$3, %r8
	movl	%ebx, 60(%rsp)
	salq	$3, %rdi
	movq	%rax, %r13
	leaq	8(%r8), %r10
	xorl	%ebx, %ebx
	leaq	8(%rdi), %r9
	.p2align 4,,10
	.p2align 3
.L127:
	movq	32(%rsp), %rsi
	movq	24(%rsp), %r14
	movq	40(%rsp), %rbp
	movq	48(%rsp), %r11
	movq	(%rsi,%rbx), %rax
	movq	8(%rsi,%rbx), %rdx
	movq	(%r14,%rbx,2), %rcx
	movq	8(%r14,%rbx,2), %rsi
	leaq	(%rax,%r11), %r15
	leaq	(%rdx,%r11), %r12
	leaq	(%rcx,%rbp), %r14
	addq	%rsi, %rbp
	cmpq	%rbp, %rax
	movq	%rbp, (%rsp)
	setnb	%bpl
	cmpq	%r15, %rsi
	setnb	%r11b
	orl	%r11d, %ebp
	cmpq	%r14, %rax
	setnb	%r11b
	cmpq	%r15, %rcx
	setnb	%r15b
	orl	%r15d, %r11d
	andl	%r11d, %ebp
	cmpl	$2, 20(%rsp)
	setne	%r11b
	andl	%r11d, %ebp
	cmpq	%r14, %rdx
	setnb	%r11b
	cmpq	%r12, %rcx
	setnb	%r14b
	orl	%r14d, %r11d
	andl	%ebp, %r11d
	cmpq	(%rsp), %rdx
	setnb	%bpl
	cmpq	%r12, %rsi
	setnb	%r12b
	orl	%r12d, %ebp
	testb	%bpl, %r11b
	je	.L128
	leaq	31(%rcx), %r11
	subq	%rsi, %r11
	cmpq	$62, %r11
	jbe	.L128
	movq	%rax, %rbp
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L124:
	movupd	0(%rbp), %xmm8
	movupd	8(%rbp), %xmm0
	addq	$16, %rbp
	movupd	(%rdx,%r11), %xmm1
	addpd	%xmm8, %xmm0
	movapd	%xmm8, %xmm9
	addpd	%xmm8, %xmm1
	mulpd	%xmm2, %xmm0
	mulpd	%xmm2, %xmm1
	unpckhpd	%xmm0, %xmm8
	unpcklpd	%xmm0, %xmm9
	movups	%xmm8, 16(%rcx,%r11,2)
	movapd	%xmm1, %xmm8
	movups	%xmm9, (%rcx,%r11,2)
	movupd	-16(%rbp), %xmm0
	movupd	-8(%rbp), %xmm10
	movupd	(%rdx,%r11), %xmm11
	movupd	8(%rdx,%r11), %xmm12
	addpd	%xmm10, %xmm0
	addpd	%xmm11, %xmm0
	addpd	%xmm12, %xmm0
	mulpd	%xmm4, %xmm0
	unpcklpd	%xmm0, %xmm8
	unpckhpd	%xmm0, %xmm1
	movups	%xmm8, (%rsi,%r11,2)
	movups	%xmm1, 16(%rsi,%r11,2)
	addq	$16, %r11
	cmpq	%r11, %r13
	jne	.L124
	movl	60(%rsp), %r14d
	cmpl	%r14d, 56(%rsp)
	je	.L126
	leaq	(%rax,%r8), %r11
	leaq	(%rdx,%r8), %rbp
	addq	%r10, %rax
	movsd	(%r11), %xmm0
	movsd	%xmm0, (%rcx,%rdi)
	addsd	0(%rbp), %xmm0
	mulsd	%xmm3, %xmm0
	movsd	%xmm0, (%rsi,%rdi)
	movsd	(%r11), %xmm0
	addsd	(%rax), %xmm0
	mulsd	%xmm3, %xmm0
	movsd	%xmm0, (%rcx,%r9)
	movsd	(%r11), %xmm0
	addsd	(%rax), %xmm0
	addsd	0(%rbp), %xmm0
	addsd	(%rdx,%r10), %xmm0
	mulsd	%xmm5, %xmm0
	movsd	%xmm0, (%rsi,%r9)
.L126:
	addq	$8, %rbx
	cmpq	8(%rsp), %rbx
	jne	.L127
.L119:
	addq	$72, %rsp
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
	.p2align 4,,10
	.p2align 3
.L128:
	.cfi_restore_state
	movq	8(%rsp), %rbp
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L123:
	movsd	(%rax,%r11), %xmm0
	movsd	%xmm0, (%rcx,%r11,2)
	addsd	(%rdx,%r11), %xmm0
	mulsd	%xmm6, %xmm0
	movsd	%xmm0, (%rsi,%r11,2)
	movsd	(%rax,%r11), %xmm0
	addsd	8(%rax,%r11), %xmm0
	mulsd	%xmm6, %xmm0
	movsd	%xmm0, 8(%rcx,%r11,2)
	movsd	(%rax,%r11), %xmm0
	addsd	8(%rax,%r11), %xmm0
	addsd	(%rdx,%r11), %xmm0
	addsd	8(%rdx,%r11), %xmm0
	mulsd	%xmm7, %xmm0
	movsd	%xmm0, 8(%rsi,%r11,2)
	addq	$8, %r11
	cmpq	%rbp, %r11
	jne	.L123
	jmp	.L126
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%edi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$280, %rsp
	.cfi_def_cfa_offset 336
	movq	%rdx, 56(%rsp)
	movsd	%xmm0, 136(%rsp)
	movsd	%xmm1, 64(%rsp)
	testl	%edi, %edi
	jle	.L180
	leal	1(%rdi), %edx
	movl	$1, %eax
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L142:
	addl	$1, %eax
	addl	%ebx, %ebx
	cmpl	%edx, %eax
	jne	.L142
	leal	1(%rbx), %eax
	movl	%eax, 152(%rsp)
	cmpl	$1, %r13d
	jle	.L141
	movl	$1, %eax
	movl	$1, %edx
	.p2align 4,,10
	.p2align 3
.L143:
	addl	$1, %eax
	addl	%edx, %edx
	cmpl	%eax, %r13d
	jne	.L143
	leal	1(%rdx), %eax
	movl	%eax, 12(%rsp)
.L145:
	movslq	152(%rsp), %r15
	leaq	0(,%r15,8), %rax
	movq	%rax, %rdi
	movq	%rax, 24(%rsp)
	call	malloc@PLT
	movslq	%ebx, %r8
	leaq	1(%r8), %rdi
	movq	%rax, 40(%rsp)
	movq	%rax, %r14
	leaq	0(,%rdi,8), %r12
	movq	%rax, 216(%rsp)
	movq	%r12, 48(%rsp)
	addq	%rax, %r12
	movq	%rdi, 88(%rsp)
	movq	%r12, 144(%rsp)
	.p2align 4,,10
	.p2align 3
.L147:
	movl	$8, %esi
	movq	%r15, %rdi
	addq	$8, %r14
	call	calloc@PLT
	movq	%rax, -8(%r14)
	cmpq	%r12, %r14
	jne	.L147
	movslq	12(%rsp), %r14
	leaq	0(,%r14,8), %rax
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	call	malloc@PLT
	leal	-1(%r14), %edi
	movl	%ebx, 72(%rsp)
	movl	%edi, 156(%rsp)
	movq	%rax, %rbx
	movq	%rdi, 192(%rsp)
	addq	$1, %rdi
	movq	%rdi, 80(%rsp)
	salq	$3, %rdi
	movq	%rdi, 32(%rsp)
	addq	%rax, %rdi
	movq	%rax, 208(%rsp)
	movq	%rdi, %r12
	movq	%rax, 224(%rsp)
	movq	%rdi, 264(%rsp)
	.p2align 4,,10
	.p2align 3
.L148:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r12, %rbx
	jne	.L148
	movq	24(%rsp), %rdi
	movl	72(%rsp), %ebx
	call	malloc@PLT
	movl	%ebx, 24(%rsp)
	movq	%rax, %r12
	movq	%rax, 240(%rsp)
	movq	48(%rsp), %rax
	movq	%rbp, 48(%rsp)
	movq	%r12, %rbp
	addq	%r12, %rax
	movq	%rax, 256(%rsp)
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L149:
	movl	$8, %esi
	movq	%r15, %rdi
	addq	$8, %rbp
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	%rbx, %rbp
	jne	.L149
	movq	16(%rsp), %rdi
	movl	24(%rsp), %ebx
	movq	48(%rsp), %rbp
	call	malloc@PLT
	movq	32(%rsp), %rdi
	movl	%ebx, 16(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rax, %rbx
	addq	%rax, %rdi
	movq	%rax, 232(%rsp)
	movq	%rdi, 248(%rsp)
	movq	%rdi, %r15
	.p2align 4,,10
	.p2align 3
.L150:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r15, %rbx
	jne	.L150
	movsd	64(%rsp), %xmm7
	movl	16(%rsp), %ebx
	movapd	%xmm7, %xmm0
	divsd	%xmm7, %xmm0
	comisd	.LC15(%rip), %xmm0
	jbe	.L213
	leal	-1(%r13), %eax
	leal	1(%rbx), %r9d
	movq	88(%rsp), %r8
	movq	%r12, 48(%rsp)
	movl	%eax, 200(%rsp)
	movq	%r14, %rax
	movl	%r9d, %r10d
	movl	%r9d, %r12d
	salq	$4, %rax
	andl	$-2, %r10d
	salq	$3, %r8
	movl	%ebx, 204(%rsp)
	leaq	-8(%rax), %r11
	movslq	%r10d, %r13
	movq	%rbp, 32(%rsp)
	movq	%r8, %rbx
	leaq	0(,%r14,8), %rax
	movl	%r9d, %r14d
	movq	%r11, %r9
	movq	208(%rsp), %r11
	movq	%rax, 184(%rsp)
	movl	156(%rsp), %eax
	shrl	%r14d
	movl	%r10d, %ebp
	salq	$4, %r14
	salq	$3, %r13
	movl	%eax, %r15d
	andl	$-2, %eax
	movl	%eax, %edx
	leal	(%rax,%rax), %eax
	shrl	%r15d
	movslq	%eax, %rcx
	addl	$2, %eax
	salq	$4, %r15
	leaq	0(,%rcx,8), %rdi
	movl	%edx, %ecx
	cltq
	movq	%rdi, 160(%rsp)
	leaq	0(,%rcx,8), %rdi
	salq	$3, %rax
	movq	%rdi, 168(%rsp)
	leal	1(%rdx), %edi
	movq	%rax, 176(%rsp)
	movl	%edi, %eax
	salq	$3, %rax
	movl	%edi, 16(%rsp)
	movq	%rax, 24(%rsp)
	movq	80(%rsp), %rax
	salq	$4, %rax
	movq	%rax, 128(%rsp)
.L175:
	movq	56(%rsp), %rsi
	movq	32(%rsp), %rdi
	movq	%r11, 88(%rsp)
	movl	152(%rsp), %edx
	movq	%r9, 80(%rsp)
	call	GS_update
	movl	152(%rsp), %ecx
	movq	%rsi, %rdx
	movq	40(%rsp), %rsi
	call	L_def
	movq	.LC10(%rip), %rax
	movl	%r12d, 96(%rsp)
	xorl	%ecx, %ecx
	movq	80(%rsp), %r9
	movq	88(%rsp), %r11
	movl	%ebp, 80(%rsp)
	movq	%r13, 88(%rsp)
	movq	40(%rsp), %r10
	movq	%rax, %xmm4
	movq	%r14, 104(%rsp)
	movq	168(%rsp), %r12
	movq	%rbx, 112(%rsp)
	movq	184(%rsp), %rbp
	movq	176(%rsp), %r14
	movq	160(%rsp), %rbx
	movl	156(%rsp), %r8d
	movq	192(%rsp), %r13
	movapd	.LC9(%rip), %xmm3
	.p2align 4,,10
	.p2align 3
.L153:
	movq	%rcx, %rax
	movq	(%r11,%rcx,8), %rdx
	salq	$4, %rax
	movq	(%r10,%rax), %rax
	leaq	(%rdx,%rbp), %rsi
	cmpq	%rsi, %rax
	leaq	(%rax,%r9), %rsi
	setnb	%dil
	cmpq	%rsi, %rdx
	setnb	%sil
	orb	%sil, %dil
	je	.L160
	xorl	%esi, %esi
	cmpl	$2, %r8d
	jbe	.L160
	.p2align 4,,10
	.p2align 3
.L156:
	movupd	(%rax,%rsi,2), %xmm0
	movhpd	16(%rax,%rsi,2), %xmm0
	mulpd	%xmm3, %xmm0
	movups	%xmm0, (%rdx,%rsi)
	addq	$16, %rsi
	cmpq	%r15, %rsi
	jne	.L156
	movsd	(%rax,%rbx), %xmm0
	movl	16(%rsp), %esi
	mulsd	%xmm4, %xmm0
	movsd	%xmm0, (%rdx,%r12)
	cmpl	%esi, 12(%rsp)
	jle	.L154
	movsd	(%rax,%r14), %xmm0
	movq	24(%rsp), %rax
	mulsd	%xmm4, %xmm0
	movsd	%xmm0, (%rdx,%rax)
.L154:
	leaq	1(%rcx), %rax
	cmpq	%r13, %rcx
	je	.L158
.L217:
	movq	%rax, %rcx
	jmp	.L153
.L180:
	movl	$2, 152(%rsp)
	movl	$1, %ebx
.L141:
	cmpl	$1, %r13d
	jne	.L181
	movq	56(%rsp), %rdi
	movq	8(%rbp), %rax
	movsd	136(%rsp), %xmm0
	movq	8(%rdi), %rdx
	mulsd	%xmm0, %xmm0
	mulsd	8(%rdx), %xmm0
	movsd	%xmm0, 8(%rax)
	addq	$280, %rsp
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
	.p2align 4,,10
	.p2align 3
.L160:
	.cfi_restore_state
	movq	128(%rsp), %rdi
	leaq	(%rax,%rdi), %rsi
	.p2align 4,,10
	.p2align 3
.L155:
	movsd	(%rax), %xmm0
	addq	$16, %rax
	addq	$8, %rdx
	mulsd	%xmm4, %xmm0
	movsd	%xmm0, -8(%rdx)
	cmpq	%rsi, %rax
	jne	.L155
	leaq	1(%rcx), %rax
	cmpq	%r13, %rcx
	jne	.L217
	.p2align 4,,10
	.p2align 3
.L158:
	movsd	64(%rsp), %xmm1
	movq	72(%rsp), %rsi
	movq	%r11, %rdx
	movq	%r9, 120(%rsp)
	movsd	136(%rsp), %xmm0
	movl	200(%rsp), %edi
	movl	80(%rsp), %ebp
	movq	88(%rsp), %r13
	movq	%r11, 80(%rsp)
	movl	96(%rsp), %r12d
	movq	104(%rsp), %r14
	movq	112(%rsp), %rbx
	call	multigrid_vcycle
	movq	72(%rsp), %rsi
	movl	12(%rsp), %ecx
	movq	48(%rsp), %rdi
	movl	152(%rsp), %edx
	call	prol_P
	movq	120(%rsp), %r9
	movq	48(%rsp), %r10
	xorl	%esi, %esi
	movl	204(%rsp), %edi
	movq	80(%rsp), %r11
	movq	32(%rsp), %r8
	.p2align 4,,10
	.p2align 3
.L161:
	movq	(%r8,%rsi), %rax
	movq	(%r10,%rsi), %rcx
	leaq	15(%rax), %rdx
	subq	%rcx, %rdx
	cmpq	$30, %rdx
	jbe	.L184
	xorl	%edx, %edx
	cmpl	$1, %edi
	jbe	.L184
	.p2align 4,,10
	.p2align 3
.L165:
	movupd	(%rax,%rdx), %xmm0
	movupd	(%rcx,%rdx), %xmm6
	subpd	%xmm6, %xmm0
	movups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%r14, %rdx
	jne	.L165
	cmpl	%r12d, %ebp
	je	.L164
	addq	%r13, %rax
	movsd	(%rax), %xmm0
	subsd	(%rcx,%r13), %xmm0
	movsd	%xmm0, (%rax)
.L164:
	addq	$8, %rsi
	cmpq	%rbx, %rsi
	jne	.L161
	movq	56(%rsp), %rsi
	movq	32(%rsp), %rdi
	movq	%r9, 88(%rsp)
	movl	152(%rsp), %edx
	movq	%r11, 80(%rsp)
	call	GS_update
	movq	40(%rsp), %rsi
	movq	88(%rsp), %r9
	pxor	%xmm0, %xmm0
	movq	80(%rsp), %r11
	movq	144(%rsp), %rdi
	.p2align 4,,10
	.p2align 3
.L169:
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	leaq	(%rdx,%r14), %rcx
	.p2align 4,,10
	.p2align 3
.L171:
	movupd	(%rax), %xmm2
	addq	$16, %rax
	mulpd	%xmm2, %xmm2
	addsd	%xmm2, %xmm0
	unpckhpd	%xmm2, %xmm2
	addsd	%xmm2, %xmm0
	cmpq	%rcx, %rax
	jne	.L171
	cmpl	%r12d, %ebp
	je	.L170
	movsd	(%rdx,%r13), %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
.L170:
	addq	$8, %rsi
	cmpq	%rdi, %rsi
	jne	.L169
	pxor	%xmm7, %xmm7
	movapd	%xmm0, %xmm1
	ucomisd	%xmm0, %xmm7
	sqrtsd	%xmm1, %xmm1
	ja	.L218
.L174:
	divsd	64(%rsp), %xmm1
	comisd	.LC15(%rip), %xmm1
	ja	.L175
	movq	48(%rsp), %r12
	movq	216(%rsp), %rbx
	movq	144(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L152:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L152
	movq	40(%rsp), %rdi
	call	free@PLT
	movq	224(%rsp), %rbx
	movq	264(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L177:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L177
	movq	208(%rsp), %rdi
	call	free@PLT
	movq	240(%rsp), %rbx
	movq	256(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L178:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L178
	movq	%r12, %rdi
	call	free@PLT
	movq	232(%rsp), %rbx
	movq	248(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L179:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L179
	movq	72(%rsp), %rdi
	addq	$280, %rsp
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
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L184:
	.cfi_restore_state
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L163:
	movsd	(%rax,%rdx), %xmm0
	subsd	(%rcx,%rdx), %xmm0
	movsd	%xmm0, (%rax,%rdx)
	addq	$8, %rdx
	cmpq	%rbx, %rdx
	jne	.L163
	jmp	.L164
.L213:
	movq	216(%rsp), %rbx
	movq	144(%rsp), %rbp
	jmp	.L152
.L218:
	movq	%r11, 96(%rsp)
	movq	%r9, 88(%rsp)
	movsd	%xmm1, 80(%rsp)
	call	sqrt@PLT
	movq	96(%rsp), %r11
	movq	88(%rsp), %r9
	movsd	80(%rsp), %xmm1
	jmp	.L174
.L181:
	movl	$2, 12(%rsp)
	jmp	.L145
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
	jle	.L238
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%r11d, %r11d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx
	movl	%edx, %esi
	leal	-1(%rdx), %edx
	movl	%esi, %r12d
	movl	%esi, %r10d
	movq	%rdx, %rbp
	andl	$-2, %r12d
	shrl	%r10d
	movl	%r12d, %r9d
	salq	$4, %r10
	salq	$3, %r9
	.p2align 4,,10
	.p2align 3
.L221:
	movq	(%rdi,%r11,8), %rax
	movq	(%rbx,%r11,8), %r8
	leaq	15(%rax), %rcx
	subq	%r8, %rcx
	cmpq	$30, %rcx
	jbe	.L229
	xorl	%ecx, %ecx
	cmpl	$1, %ebp
	jbe	.L229
	.p2align 4,,10
	.p2align 3
.L225:
	movupd	(%rax,%rcx), %xmm0
	movupd	(%r8,%rcx), %xmm1
	subpd	%xmm1, %xmm0
	movups	%xmm0, (%rax,%rcx)
	addq	$16, %rcx
	cmpq	%r10, %rcx
	jne	.L225
	cmpl	%r12d, %esi
	je	.L224
	addq	%r9, %rax
	movsd	(%rax), %xmm0
	subsd	(%r8,%r9), %xmm0
	movsd	%xmm0, (%rax)
.L224:
	leaq	1(%r11), %rax
	cmpq	%rdx, %r11
	je	.L219
.L241:
	movq	%rax, %r11
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L229:
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L223:
	movsd	(%rax,%rcx,8), %xmm0
	subsd	(%r8,%rcx,8), %xmm0
	movq	%rcx, %r13
	movsd	%xmm0, (%rax,%rcx,8)
	addq	$1, %rcx
	cmpq	%r13, %rdx
	jne	.L223
	leaq	1(%r11), %rax
	cmpq	%rdx, %r11
	jne	.L241
.L219:
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L238:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
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
	jle	.L247
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	8(%rdi,%rax,8), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	8(,%rax,8), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L244:
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	xorl	%esi, %esi
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r12, %rbx
	jne	.L244
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L247:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
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
	jle	.L257
	movq	.LC7(%rip), %xmm2
	movsd	.LC15(%rip), %xmm1
	leal	-1(%rdx), %r9d
	xorl	%r10d, %r10d
.L252:
	movq	(%rdi,%r10,8), %r8
	movq	(%rsi,%r10,8), %rcx
	xorl	%eax, %eax
	jmp	.L253
	.p2align 4,,10
	.p2align 3
.L259:
	leaq	1(%rax), %rdx
	cmpq	%rax, %r9
	je	.L258
	movq	%rdx, %rax
.L253:
	movsd	(%r8,%rax,8), %xmm0
	subsd	(%rcx,%rax,8), %xmm0
	andpd	%xmm2, %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L259
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L258:
	leaq	1(%r10), %rax
	cmpq	%r10, %r9
	je	.L257
	movq	%rax, %r10
	jmp	.L252
.L257:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE56:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC17:
	.string	"\nResult OK!"
.LC18:
	.string	"\nResult not OK!"
.LC20:
	.string	"time = %lf s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$513, %edi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$29793, %eax
	movl	$1680762733, 49(%rsp)
	movw	%ax, 53(%rsp)
	movb	$0, 55(%rsp)
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %r13
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %r12
	call	alloc_matrix
	movl	$513, %edx
	leaq	49(%rsp), %rsi
	movq	%r13, %rdi
	movq	%rax, %rbp
	call	read_data
	movsd	.LC16(%rip), %xmm2
	movl	$513, %esi
	movq	%rbp, %rdi
	movapd	%xmm2, %xmm0
	call	fill_f
	movl	$513, %esi
	movq	%rbp, %rdi
	call	L2_norm
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	movsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movl	$9, %edi
	movq	.LC16(%rip), %rax
	movsd	8(%rsp), %xmm1
	movq	%rax, %xmm0
	call	multigrid_vcycle
	xorl	%esi, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday@PLT
	movl	$513, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	verify
	testl	%eax, %eax
	je	.L261
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
.L262:
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movsd	.LC19(%rip), %xmm2
	leaq	.LC20(%rip), %rsi
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
	movl	$513, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%rbp, %rdi
	call	dealloc_matrix
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L265
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L261:
	.cfi_restore_state
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	jmp	.L262
.L265:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.str1.1
.LC21:
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
	jle	.L272
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
	leaq	.LC21(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.p2align 4,,10
	.p2align 3
.L268:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L269:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	movsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L269
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L268
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
.L272:
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
	.align 16
.LC8:
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.align 16
.LC9:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	0
	.long	1074790400
	.align 8
.LC11:
	.long	0
	.long	1070596096
	.section	.rodata.cst16
	.align 16
.LC12:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 16
.LC13:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.section	.rodata.cst8
	.align 8
.LC14:
	.long	0
	.long	1071644672
	.align 8
.LC15:
	.long	2296604913
	.long	1055193269
	.align 8
.LC16:
	.long	0
	.long	1063256064
	.align 8
.LC19:
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
