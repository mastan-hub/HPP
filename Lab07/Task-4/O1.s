	.file	"Multigrid0.c"
	.text
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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, %r12d
	movslq	%edi, %rbp
	leaq	0(,%rbp,8), %rdi
	call	malloc@PLT
	movq	%rax, %r13
	testl	%r12d, %r12d
	jle	.L1
	movq	%rax, %rbx
	leal	-1(%r12), %eax
	leaq	8(%r13,%rax,8), %r12
.L3:
	movl	$8, %esi
	movq	%rbp, %rdi
	call	calloc@PLT
	movq	%rax, (%rbx)
	addq	$8, %rbx
	cmpq	%r12, %rbx
	jne	.L3
.L1:
	movq	%r13, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
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
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %r12
	testl	%esi, %esi
	jle	.L7
	movq	%rdi, %rbx
	leal	-1(%rsi), %eax
	leaq	8(%rdi,%rax,8), %rbp
.L8:
	movq	(%rbx), %rdi
	call	free@PLT
	addq	$8, %rbx
	cmpq	%rbp, %rbx
	jne	.L8
.L7:
	movq	%r12, %rdi
	call	free@PLT
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.size	dealloc_matrix, .-dealloc_matrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"%lf\n"
	.text
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, %r13
	movq	%rsi, %rdi
	movl	%edx, %ebx
	leaq	.LC0(%rip), %rsi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L15
	movq	%rax, %r12
	testl	%ebx, %ebx
	jle	.L16
	movq	%r13, %rbp
	leal	-1(%rbx), %eax
	leaq	8(%r13,%rax,8), %r15
	leaq	8(,%rax,8), %r14
	leaq	.LC1(%rip), %r13
	jmp	.L13
.L20:
	addq	$8, %rbp
	cmpq	%r15, %rbp
	je	.L17
.L13:
	movl	$0, %ebx
.L14:
	movq	%rbx, %rdx
	addq	0(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addq	$8, %rbx
	cmpq	%rbx, %r14
	jne	.L14
	jmp	.L20
.L15:
	movl	$-1, %eax
	jmp	.L11
.L16:
	movl	$1, %eax
	jmp	.L11
.L17:
	movl	$1, %eax
.L11:
	addq	$8, %rsp
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
	.cfi_endproc
.LFE43:
	.size	read_data, .-read_data
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB44:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	jle	.L24
	addl	$1, %edi
	movl	$1, %edx
	movl	$1, %eax
.L23:
	addl	%edx, %edx
	addl	$1, %eax
	cmpl	%edi, %eax
	jne	.L23
.L21:
	movl	%edx, %eax
	ret
.L24:
	movl	$1, %edx
	jmp	.L21
	.cfi_endproc
.LFE44:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC2:
	.string	"\n"
	.text
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB45:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
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
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, %rbp
	movl	%esi, %r14d
	movsd	%xmm0, (%rsp)
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	testl	%r14d, %r14d
	jle	.L26
	movsd	(%rsp), %xmm7
	movapd	%xmm7, %xmm6
	mulsd	%xmm7, %xmm6
	movsd	%xmm6, 40(%rsp)
	movl	$0, %r13d
	leal	-1(%r14), %r12d
	jmp	.L28
.L32:
	addl	$1, %r13d
	addq	$8, %rbp
	cmpl	%r13d, %r14d
	je	.L26
.L28:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%r13d, %xmm1
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm1, 8(%rsp)
	mulsd	%xmm1, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	%xmm0, 24(%rsp)
	movsd	.LC5(%rip), %xmm0
	mulsd	8(%rsp), %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	%xmm0, 32(%rsp)
	movl	$0, %ebx
.L29:
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%ebx, %xmm2
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm2, 8(%rsp)
	mulsd	%xmm2, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	%xmm0, 16(%rsp)
	movsd	.LC4(%rip), %xmm4
	mulsd	8(%rsp), %xmm4
	movapd	%xmm4, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movapd	%xmm0, %xmm1
	movq	0(%rbp), %rax
	movsd	16(%rsp), %xmm0
	mulsd	40(%rsp), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	24(%rsp), %xmm0
	mulsd	32(%rsp), %xmm0
	movsd	%xmm0, (%rax,%rbx,8)
	movq	%rbx, %rax
	addq	$1, %rbx
	cmpq	%rax, %r12
	jne	.L29
	jmp	.L32
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
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB46:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L37
	movq	%rdi, %rcx
	leal	-1(%rsi), %esi
	salq	$3, %rsi
	leaq	8(%rdi,%rsi), %rdi
	pxor	%xmm1, %xmm1
	addq	$8, %rsi
	movq	.LC7(%rip), %xmm2
	jmp	.L35
.L39:
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	je	.L33
.L35:
	movq	(%rcx), %rax
	leaq	(%rsi,%rax), %rdx
.L36:
	movsd	(%rax), %xmm0
	andpd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L36
	jmp	.L39
.L37:
	pxor	%xmm1, %xmm1
.L33:
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE46:
	.size	L1_norm, .-L1_norm
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB47:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	testl	%esi, %esi
	jle	.L45
	movq	%rdi, %rcx
	leal	-1(%rsi), %esi
	salq	$3, %rsi
	leaq	8(%rdi,%rsi), %rdi
	pxor	%xmm1, %xmm1
	addq	$8, %rsi
	jmp	.L42
.L48:
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	je	.L44
.L42:
	movq	(%rcx), %rax
	leaq	(%rsi,%rax), %rdx
.L43:
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L43
	jmp	.L48
.L44:
	movapd	%xmm1, %xmm2
	sqrtsd	%xmm2, %xmm2
	movsd	%xmm2, 8(%rsp)
	pxor	%xmm0, %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L49
.L40:
	movsd	8(%rsp), %xmm0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L49:
	.cfi_restore_state
	movapd	%xmm1, %xmm0
	call	sqrt@PLT
	jmp	.L40
.L45:
	pxor	%xmm3, %xmm3
	movsd	%xmm3, 8(%rsp)
	jmp	.L40
	.cfi_endproc
.LFE47:
	.size	L2_norm, .-L2_norm
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB48:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	movsd	(%rax), %xmm1
	testl	%esi, %esi
	jle	.L50
	movq	%rdi, %rcx
	leal	-1(%rsi), %esi
	salq	$3, %rsi
	leaq	8(%rdi,%rsi), %rdi
	addq	$8, %rsi
	movq	.LC7(%rip), %xmm2
	jmp	.L52
.L58:
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	je	.L50
.L52:
	movq	(%rcx), %rax
	leaq	(%rsi,%rax), %rdx
.L55:
	movsd	(%rax), %xmm0
	andpd	%xmm2, %xmm0
	maxsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L55
	jmp	.L58
.L50:
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE48:
	.size	Max_norm, .-Max_norm
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB49:
	.cfi_startproc
	endbr64
	cmpl	$2, %ecx
	jle	.L59
	movq	%rdi, %r8
	leaq	8(%rdx), %r11
	leaq	8(%rsi), %r9
	leal	-3(%rcx), %eax
	leaq	8(%rdi,%rax,8), %r10
	leaq	16(,%rax,8), %rdi
	movsd	.LC8(%rip), %xmm1
	jmp	.L61
.L64:
	addq	$8, %r8
	addq	$8, %r11
	addq	$8, %r9
	cmpq	%r10, %r8
	je	.L59
.L61:
	movl	$8, %eax
.L62:
	movq	8(%r8), %rdx
	movapd	%xmm1, %xmm0
	mulsd	(%rdx,%rax), %xmm0
	movq	(%r8), %rcx
	subsd	(%rcx,%rax), %xmm0
	movq	16(%r8), %rcx
	subsd	(%rcx,%rax), %xmm0
	subsd	-8(%rdx,%rax), %xmm0
	movq	%rax, %rcx
	addq	$8, %rax
	movq	(%r9), %rsi
	subsd	(%rdx,%rax), %xmm0
	movq	(%r11), %rdx
	subsd	(%rdx,%rcx), %xmm0
	movsd	%xmm0, (%rsi,%rcx)
	cmpq	%rdi, %rax
	jne	.L62
	jmp	.L64
.L59:
	ret
	.cfi_endproc
.LFE49:
	.size	L_def, .-L_def
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB50:
	.cfi_startproc
	endbr64
	cmpl	$2, %edx
	jle	.L65
	movq	%rdi, %rcx
	leaq	8(%rsi), %r8
	leal	-3(%rdx), %eax
	leaq	8(%rdi,%rax,8), %r10
	leaq	16(,%rax,8), %r9
	movsd	.LC9(%rip), %xmm1
	jmp	.L67
.L70:
	addq	$8, %rcx
	addq	$8, %r8
	cmpq	%r10, %rcx
	je	.L65
.L67:
	movl	$8, %eax
.L68:
	movq	8(%rcx), %rdx
	movq	(%rcx), %rdi
	movq	16(%rcx), %rsi
	movsd	(%rdi,%rax), %xmm0
	addsd	(%rsi,%rax), %xmm0
	addsd	-8(%rdx,%rax), %xmm0
	movq	%rax, %rsi
	addq	$8, %rax
	addsd	(%rdx,%rax), %xmm0
	movq	(%r8), %rdi
	addsd	(%rdi,%rsi), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx,%rsi)
	cmpq	%r9, %rax
	jne	.L68
	jmp	.L70
.L65:
	ret
	.cfi_endproc
.LFE50:
	.size	GS_update, .-GS_update
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB51:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L71
	movslq	%esi, %rax
	leaq	-8(,%rax,8), %rcx
	leaq	(%rdi,%rcx), %r8
	leal	-1(%rsi), %eax
	leaq	8(,%rax,8), %rsi
	movl	$0, %eax
.L73:
	movq	(%rdi), %rdx
	movq	$0x000000000, (%rdx,%rax)
	movq	(%r8), %rdx
	movq	$0x000000000, (%rdx,%rax)
	movq	(%rdi,%rax), %rdx
	movq	$0x000000000, (%rdx)
	movq	(%rdi,%rax), %rdx
	movq	$0x000000000, (%rdx,%rcx)
	addq	$8, %rax
	cmpq	%rsi, %rax
	jne	.L73
.L71:
	ret
	.cfi_endproc
.LFE51:
	.size	set_BC, .-set_BC
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB52:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L75
	movq	%rdi, %r8
	leal	-1(%rdx), %eax
	movq	%rax, %rdx
	salq	$4, %rdx
	leaq	16(%rdi,%rdx), %r9
	leaq	8(,%rax,8), %rdi
	movsd	.LC8(%rip), %xmm1
	jmp	.L77
.L80:
	addq	$16, %r8
	addq	$8, %rsi
	cmpq	%r9, %r8
	je	.L75
.L77:
	movl	$0, %eax
.L78:
	movq	(%rsi), %rdx
	movq	(%r8), %rcx
	movapd	%xmm1, %xmm0
	mulsd	(%rcx,%rax,2), %xmm0
	movsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rdi
	jne	.L78
	jmp	.L80
.L75:
	ret
	.cfi_endproc
.LFE52:
	.size	res_R, .-res_R
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB53:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L82
	movq	%rdi, %r8
	leal	-1(%rdx), %eax
	leaq	8(%rdi,%rax,8), %r10
	leaq	8(,%rax,8), %r9
	jmp	.L83
.L94:
	addq	$8, %r8
	cmpq	%r10, %r8
	je	.L82
.L83:
	movl	$0, %eax
.L84:
	movq	(%r8), %rdx
	movq	$0x000000000, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%r9, %rax
	jne	.L84
	jmp	.L94
.L82:
	cmpl	$1, %ecx
	jle	.L91
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leal	-2(%rcx,%rcx), %ebx
	leal	-2(%rcx), %eax
	leaq	8(,%rax,8), %r10
	movl	$0, %r11d
	movsd	.LC10(%rip), %xmm1
	movsd	.LC9(%rip), %xmm2
	jmp	.L86
.L95:
	addq	$8, %rsi
	addl	$2, %r11d
	cmpl	%r11d, %ebx
	je	.L81
.L86:
	movslq	%r11d, %rax
	salq	$3, %rax
	leaq	(%rdi,%rax), %r9
	leaq	8(%rdi,%rax), %r8
	movl	$0, %edx
	movl	$0, %eax
.L87:
	movq	(%rsi), %rcx
	movsd	(%rcx,%rax), %xmm0
	movq	(%r9), %rcx
	movsd	%xmm0, (%rcx,%rdx)
	movq	(%r8), %rcx
	movq	(%rsi), %r12
	movq	8(%rsi), %rbp
	movsd	(%r12,%rax), %xmm0
	addsd	0(%rbp,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rcx,%rdx)
	movq	(%rsi), %rcx
	movsd	(%rcx,%rax), %xmm0
	movq	%rax, %rbp
	addq	$8, %rax
	movq	(%r9), %r12
	addsd	(%rcx,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%r12,%rdx)
	movq	(%rsi), %r12
	movq	8(%rsi), %rcx
	movsd	(%r12,%rbp), %xmm0
	addsd	(%r12,%rax), %xmm0
	addsd	(%rcx,%rbp), %xmm0
	addsd	(%rcx,%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movq	(%r8), %rcx
	movsd	%xmm0, 8(%rcx,%rdx)
	addq	$16, %rdx
	cmpq	%rax, %r10
	jne	.L87
	jmp	.L95
.L81:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L91:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE53:
	.size	prol_P, .-prol_P
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB54:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L96
	movq	%rdi, %r8
	leal	-1(%rdx), %eax
	leaq	8(%rdi,%rax,8), %r9
	leaq	8(,%rax,8), %rdi
	jmp	.L98
.L101:
	addq	$8, %r8
	addq	$8, %rsi
	cmpq	%r9, %r8
	je	.L96
.L98:
	movl	$0, %eax
.L99:
	movq	%rax, %rdx
	addq	(%r8), %rdx
	movq	(%rsi), %rcx
	movsd	(%rdx), %xmm0
	subsd	(%rcx,%rax), %xmm0
	movsd	%xmm0, (%rdx)
	addq	$8, %rax
	cmpq	%rax, %rdi
	jne	.L99
	jmp	.L101
.L96:
	ret
	.cfi_endproc
.LFE54:
	.size	u_update, .-u_update
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movsd	%xmm0, 32(%rsp)
	movsd	%xmm1, 8(%rsp)
	cmpl	$1, %edi
	jne	.L103
	movq	8(%rsi), %rax
	movq	8(%rdx), %rdx
	mulsd	%xmm0, %xmm0
	mulsd	8(%rdx), %xmm0
	movsd	%xmm0, 8(%rax)
.L102:
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
.L103:
	.cfi_restore_state
	movl	%edi, %r13d
	call	get_m
	leal	1(%rax), %ebx
	leal	-1(%r13), %eax
	movl	%eax, 44(%rsp)
	movl	%eax, %edi
	call	get_m
	leal	1(%rax), %r14d
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, %r13
	movl	%r14d, %edi
	call	alloc_matrix
	movq	%rax, %r15
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, 16(%rsp)
	movl	%r14d, %edi
	call	alloc_matrix
	movq	%rax, 24(%rsp)
	movsd	8(%rsp), %xmm3
	movapd	%xmm3, %xmm0
	divsd	%xmm3, %xmm0
	comisd	.LC11(%rip), %xmm0
	jbe	.L105
.L107:
	movl	%ebx, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	GS_update
	movl	%ebx, %ecx
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	L_def
	movl	%r14d, %edx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	res_R
	movsd	8(%rsp), %xmm1
	movsd	32(%rsp), %xmm0
	movq	%r15, %rdx
	movq	24(%rsp), %rsi
	movl	44(%rsp), %edi
	call	multigrid_vcycle
	movl	%r14d, %ecx
	movl	%ebx, %edx
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rdi
	call	prol_P
	movl	%ebx, %edx
	movq	16(%rsp), %rsi
	movq	%rbp, %rdi
	call	u_update
	movl	%ebx, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	GS_update
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	L2_norm
	divsd	8(%rsp), %xmm0
	comisd	.LC11(%rip), %xmm0
	ja	.L107
.L105:
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	%r14d, %esi
	movq	%r15, %rdi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	16(%rsp), %rdi
	call	dealloc_matrix
	movl	%r14d, %esi
	movq	24(%rsp), %rdi
	call	dealloc_matrix
	jmp	.L102
	.cfi_endproc
.LFE40:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB55:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L111
	movq	%rdi, %rcx
	leal	-1(%rsi), %eax
	leaq	8(%rdi,%rax,8), %rdi
	leaq	8(,%rax,8), %rsi
	jmp	.L113
.L116:
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	je	.L111
.L113:
	movl	$0, %eax
.L114:
	movq	(%rcx), %rdx
	movq	$0x000000000, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rsi
	jne	.L114
	jmp	.L116
.L111:
	ret
	.cfi_endproc
.LFE55:
	.size	set_zeros, .-set_zeros
	.globl	verify
	.type	verify, @function
verify:
.LFB56:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L121
	leal	-1(%rdx), %r9d
	movl	$0, %r10d
	movl	$0, %r11d
	movq	.LC7(%rip), %xmm2
	movsd	.LC11(%rip), %xmm1
.L119:
	movq	(%rdi,%r10,8), %r8
	movq	(%rsi,%r10,8), %rcx
	movq	%r11, %rax
	jmp	.L120
.L123:
	movq	%rdx, %rax
.L120:
	movsd	(%r8,%rax,8), %xmm0
	subsd	(%rcx,%rax,8), %xmm0
	andpd	%xmm2, %xmm0
	comisd	%xmm1, %xmm0
	ja	.L122
	leaq	1(%rax), %rdx
	cmpq	%r9, %rax
	jne	.L123
	leaq	1(%r10), %rax
	cmpq	%r9, %r10
	je	.L124
	movq	%rax, %r10
	jmp	.L119
.L121:
	movl	$1, %eax
	ret
.L122:
	movl	$0, %eax
	ret
.L124:
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
	.text
	.globl	main
	.type	main, @function
main:
.LFB39:
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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$9, %edi
	call	get_m
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC12(%rip), %xmm1
	movapd	%xmm1, %xmm3
	divsd	%xmm0, %xmm3
	movsd	%xmm3, (%rsp)
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %ebx
	movl	$1680762733, 49(%rsp)
	movw	$29793, 53(%rsp)
	movb	$0, 55(%rsp)
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, %r13
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, %r12
	movl	%ebx, %edi
	call	alloc_matrix
	movq	%rax, %rbp
	leaq	49(%rsp), %rsi
	movl	%ebx, %edx
	movq	%r13, %rdi
	call	read_data
	movsd	(%rsp), %xmm0
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	fill_f
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	L2_norm
	movsd	%xmm0, 8(%rsp)
	leaq	16(%rsp), %rdi
	movl	$0, %esi
	call	gettimeofday@PLT
	movsd	8(%rsp), %xmm1
	movsd	(%rsp), %xmm0
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movl	$9, %edi
	call	multigrid_vcycle
	leaq	32(%rsp), %rdi
	movl	$0, %esi
	call	gettimeofday@PLT
	movl	%ebx, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	verify
	testl	%eax, %eax
	je	.L126
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
.L127:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	40(%rsp), %xmm0
	movsd	.LC15(%rip), %xmm2
	divsd	%xmm2, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	32(%rsp), %xmm1
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	24(%rsp), %xmm1
	divsd	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdq	16(%rsp), %xmm2
	addsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	dealloc_matrix
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L130
	movl	$0, %eax
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L126:
	.cfi_restore_state
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L127
.L130:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.str1.1
.LC17:
	.string	"%lf "
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB57:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L137
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
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
	movq	%rdi, %rbp
	leal	-1(%rsi), %eax
	leaq	8(%rdi,%rax,8), %r14
	leaq	8(,%rax,8), %r13
	leaq	.LC17(%rip), %r12
	jmp	.L133
.L140:
	movl	$10, %edi
	call	putchar@PLT
	addq	$8, %rbp
	cmpq	%r14, %rbp
	je	.L131
.L133:
	movl	$0, %ebx
.L134:
	movq	0(%rbp), %rax
	movsd	(%rax,%rbx), %xmm0
	movq	%r12, %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	addq	$8, %rbx
	cmpq	%rbx, %r13
	jne	.L134
	jmp	.L140
.L131:
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
.L137:
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
