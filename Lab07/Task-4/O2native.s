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
	leaq	0(,%rbp,8), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
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
	call	calloc@PLT
	movq	%rax, (%rbx)
	addq	$8, %rbx
	cmpq	%r12, %rbx
	jne	.L3
.L1:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movq	%r13, %rax
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
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%r12, %rdi
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	.LC0(%rip), %rsi
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
	leaq	8(%rbp,%rax,8), %r15
	leaq	8(,%rax,8), %r14
	leaq	.LC1(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L15:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L16:
	movq	0(%rbp), %rdx
	movq	%r13, %rsi
	addq	%rbx, %rdx
	movq	%r12, %rdi
	xorl	%eax, %eax
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
	movl	$1, %eax
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
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
	movl	$-1, %eax
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
	jle	.L25
	incl	%edi
	movl	$1, %r8d
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L24:
	incl	%eax
	addl	%r8d, %r8d
	cmpl	%edi, %eax
	jne	.L24
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L25:
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
	vmovsd	%xmm0, (%rsp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L32
	vmovsd	(%rsp), %xmm2
	leal	-1(%rbx), %ebp
	vmulsd	%xmm2, %xmm2, %xmm6
	xorl	%r13d, %r13d
	vmovsd	%xmm6, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L29:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdl	%r13d, %xmm4, %xmm1
	xorl	%ebx, %ebx
	vmulsd	.LC3(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	8(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	movq	(%r14,%r13,8), %r12
	vmovsd	%xmm0, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L30:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdl	%ebx, %xmm3, %xmm1
	vmulsd	.LC3(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm4
	vmovapd	%xmm0, %xmm1
	vmulsd	8(%rsp), %xmm4, %xmm0
	movq	%rbx, %rax
	vmulsd	%xmm1, %xmm0, %xmm0
	vmulsd	24(%rsp), %xmm0, %xmm0
	vmulsd	32(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	%rbp, %rax
	jne	.L30
	leaq	1(%r13), %rax
	cmpq	%r13, %rbp
	je	.L32
	movq	%rax, %r13
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L32:
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
	jle	.L38
	leal	-1(%rsi), %eax
	salq	$3, %rax
	vmovq	.LC7(%rip), %xmm2
	leaq	8(%rdi,%rax), %rsi
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L36:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L37:
	vmovsd	(%rax), %xmm0
	addq	$8, %rax
	vandpd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	cmpq	%rax, %rdx
	jne	.L37
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L36
	vmovapd	%xmm1, %xmm0
	ret
.L38:
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%xmm1, %xmm0
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
	jle	.L45
	leal	-1(%rsi), %eax
	salq	$3, %rax
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	8(%rdi,%rax), %rsi
	vmovapd	%xmm2, %xmm1
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L42:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L43:
	vmovsd	(%rax), %xmm0
	addq	$8, %rax
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	cmpq	%rax, %rdx
	jne	.L43
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L42
	vucomisd	%xmm1, %xmm2
	vsqrtsd	%xmm1, %xmm1, %xmm3
	ja	.L51
	vmovapd	%xmm3, %xmm0
	ret
.L45:
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovapd	%xmm3, %xmm0
	ret
.L51:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	vmovapd	%xmm1, %xmm0
	vmovsd	%xmm3, 8(%rsp)
	call	sqrt@PLT
	vmovsd	8(%rsp), %xmm3
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	vmovapd	%xmm3, %xmm0
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
	vmovsd	(%rdx), %xmm1
	testl	%esi, %esi
	jle	.L52
	leal	-1(%rsi), %eax
	salq	$3, %rax
	leaq	8(%rdi), %rcx
	vmovq	.LC7(%rip), %xmm2
	leaq	(%rcx,%rax), %rdi
	vmovapd	%xmm1, %xmm0
	leaq	8(%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L54:
	leaq	8(%rdx), %rax
	addq	%rsi, %rdx
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L57:
	vmovsd	(%rax), %xmm0
	addq	$8, %rax
.L58:
	vandpd	%xmm2, %xmm0, %xmm0
	vmaxsd	%xmm1, %xmm0, %xmm1
	cmpq	%rdx, %rax
	jne	.L57
	cmpq	%rdi, %rcx
	je	.L52
	movq	(%rcx), %rdx
	addq	$8, %rcx
	vmovsd	(%rdx), %xmm0
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L52:
	vmovapd	%xmm1, %xmm0
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
	jle	.L68
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	-3(%rcx), %r8d
	vmovsd	.LC8(%rip), %xmm1
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdx, %rbp
	movq	%rsi, %rbx
	addq	$2, %r8
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L63:
	movq	(%rdi,%rsi,8), %rcx
	movq	-8(%rdi,%rsi,8), %rdx
	movq	8(%rdi,%rsi,8), %r11
	movq	0(%rbp,%rsi,8), %r10
	movq	(%rbx,%rsi,8), %r9
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L62:
	vmulsd	(%rcx,%rax,8), %xmm1, %xmm0
	vsubsd	(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	(%r11,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rcx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rcx,%rax,8), %xmm0, %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r9,%rax,8)
	incq	%rax
	cmpq	%rax, %r8
	jne	.L62
	incq	%rsi
	cmpq	%rsi, %r8
	jne	.L63
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L68:
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
	jle	.L77
	leal	-3(%rdx), %ecx
	vmovsd	.LC9(%rip), %xmm1
	addq	$2, %rcx
	movl	$1, %r11d
	.p2align 4,,10
	.p2align 3
.L74:
	movq	-8(%rdi,%r11,8), %r10
	movq	8(%rdi,%r11,8), %r9
	movq	(%rdi,%r11,8), %rdx
	movq	(%rsi,%r11,8), %r8
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L73:
	vmovsd	(%r10,%rax,8), %xmm0
	vaddsd	(%r9,%rax,8), %xmm0, %xmm0
	vaddsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vaddsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vaddsd	(%r8,%rax,8), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	cmpq	%rax, %rcx
	jne	.L73
	incq	%r11
	cmpq	%r11, %rcx
	jne	.L74
.L77:
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
	jle	.L81
	movq	(%rdi), %r8
	movslq	%esi, %rax
	salq	$3, %rax
	leal	-1(%rsi), %ecx
	movq	-8(%rdi,%rax), %r9
	leaq	-8(%rax), %r10
	salq	$3, %rcx
	movq	%r8, %rdx
	xorl	%eax, %eax
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L82:
	movq	8(%rdi,%rax), %rdx
	addq	$8, %rax
.L80:
	movq	$0x000000000, (%r8,%rax)
	movq	$0x000000000, (%r9,%rax)
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r10)
	cmpq	%rcx, %rax
	jne	.L82
.L81:
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
	jle	.L88
	leal	-1(%rdx), %r10d
	leaq	1(%r10), %r9
	vmovsd	.LC8(%rip), %xmm1
	xorl	%r8d, %r8d
	salq	$4, %r9
	.p2align 4,,10
	.p2align 3
.L85:
	movq	%r8, %rax
	salq	$4, %rax
	movq	(%rdi,%rax), %rax
	movq	(%rsi,%r8,8), %rdx
	leaq	(%r9,%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L86:
	vmulsd	(%rax), %xmm1, %xmm0
	addq	$16, %rax
	addq	$8, %rdx
	vmovsd	%xmm0, -8(%rdx)
	cmpq	%rax, %rcx
	jne	.L86
	leaq	1(%r8), %rax
	cmpq	%r10, %r8
	je	.L88
	movq	%rax, %r8
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L88:
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
	jle	.L90
	leal	-1(%rdx), %eax
	salq	$3, %rax
	movq	%rdi, %r8
	leaq	8(%rdi,%rax), %r10
	leaq	8(%rax), %r9
	.p2align 4,,10
	.p2align 3
.L91:
	movq	(%r8), %rax
	leaq	(%r9,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L92:
	movq	$0x000000000, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L92
	addq	$8, %r8
	cmpq	%r10, %r8
	jne	.L91
.L90:
	cmpl	$1, %ecx
	jle	.L99
	leal	-2(%rcx), %eax
	vmovsd	.LC10(%rip), %xmm1
	vmovsd	.LC9(%rip), %xmm2
	leaq	8(,%rax,8), %r10
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L95:
	movq	(%rdi,%r11,2), %r9
	movq	8(%rsi,%r11), %rcx
	movq	8(%rdi,%r11,2), %r8
	movq	(%rsi,%r11), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L94:
	vmovsd	(%rdx), %xmm0
	addq	$8, %rdx
	vmovsd	%xmm0, (%r9,%rax,2)
	vmovsd	-8(%rdx), %xmm0
	vaddsd	(%rcx,%rax), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r8,%rax,2)
	vmovsd	-8(%rdx), %xmm0
	vaddsd	(%rdx), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r9,%rax,2)
	vmovsd	-8(%rdx), %xmm0
	vaddsd	(%rdx), %xmm0, %xmm0
	vaddsd	(%rcx,%rax), %xmm0, %xmm0
	vaddsd	8(%rcx,%rax), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r8,%rax,2)
	addq	$8, %rax
	cmpq	%rax, %r10
	jne	.L94
	addq	$8, %r11
	cmpq	%r11, %r10
	jne	.L95
.L99:
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdx, 8(%rsp)
	vmovsd	%xmm0, 24(%rsp)
	vmovsd	%xmm1, (%rsp)
	testl	%edi, %edi
	jle	.L113
	leal	1(%rdi), %ecx
	movl	$1, %eax
	movl	$1, %edx
	.p2align 4,,10
	.p2align 3
.L102:
	incl	%eax
	addl	%edx, %edx
	cmpl	%ecx, %eax
	jne	.L102
	leal	1(%rdx), %r14d
	cmpl	$1, %ebx
	jle	.L101
	movl	$1, %eax
	movl	$1, %ebp
	.p2align 4,,10
	.p2align 3
.L103:
	incl	%eax
	addl	%ebp, %ebp
	cmpl	%eax, %ebx
	jne	.L103
	incl	%ebp
.L105:
	movl	%r14d, %edi
	movl	%edx, 44(%rsp)
	call	alloc_matrix
	movl	%ebp, %edi
	movq	%rax, %r13
	call	alloc_matrix
	movl	%r14d, %edi
	movq	%rax, 32(%rsp)
	call	alloc_matrix
	movl	%ebp, %edi
	movq	%rax, %r12
	call	alloc_matrix
	vmovsd	(%rsp), %xmm3
	movq	%rax, 16(%rsp)
	vdivsd	%xmm3, %xmm3, %xmm0
	movslq	44(%rsp), %rdx
	vcomisd	.LC11(%rip), %xmm0
	jbe	.L112
	leal	-1(%rbx), %eax
	movl	%eax, 44(%rsp)
	leaq	8(,%rdx,8), %rbx
.L111:
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
	movl	%r14d, %edx
	call	GS_update
	movq	%rsi, %rdx
	movl	%r14d, %ecx
	movq	%r13, %rsi
	call	L_def
	movq	32(%rsp), %rsi
	movl	%ebp, %edx
	movq	%r13, %rdi
	call	res_R
	movq	%rsi, %rdx
	vmovsd	(%rsp), %xmm1
	vmovsd	24(%rsp), %xmm0
	movq	16(%rsp), %rsi
	movl	44(%rsp), %edi
	call	multigrid_vcycle
	movq	16(%rsp), %rsi
	movl	%ebp, %ecx
	movl	%r14d, %edx
	movq	%r12, %rdi
	call	prol_P
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L108:
	movq	(%r15,%rsi), %rdx
	movq	(%r12,%rsi), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L109:
	vmovsd	(%rdx,%rax), %xmm0
	vsubsd	(%rcx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rbx
	jne	.L109
	addq	$8, %rsi
	cmpq	%rsi, %rbx
	jne	.L108
	movq	8(%rsp), %rsi
	movl	%r14d, %edx
	movq	%r15, %rdi
	call	GS_update
	movl	%r14d, %esi
	movq	%r13, %rdi
	call	L2_norm
	vdivsd	(%rsp), %xmm0, %xmm0
	vcomisd	.LC11(%rip), %xmm0
	ja	.L111
.L112:
	movl	%r14d, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movq	32(%rsp), %rdi
	movl	%ebp, %esi
	call	dealloc_matrix
	movl	%r14d, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movq	16(%rsp), %rdi
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	movl	%ebp, %esi
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
.L113:
	.cfi_restore_state
	movl	$2, %r14d
	movl	$1, %edx
.L101:
	cmpl	$1, %ebx
	jne	.L114
	vmovsd	24(%rsp), %xmm2
	movq	8(%rsp), %rdi
	vmulsd	%xmm2, %xmm2, %xmm0
	movq	8(%rdi), %rdx
	movq	8(%r15), %rax
	vmulsd	8(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
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
.L114:
	.cfi_restore_state
	movl	$2, %ebp
	jmp	.L105
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
	jle	.L128
	leal	-1(%rdx), %r8d
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L125:
	movq	(%rdi,%r10,8), %rdx
	movq	(%rsi,%r10,8), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L126:
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	%rax, %rcx
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	cmpq	%r8, %rcx
	jne	.L126
	leaq	1(%r10), %rax
	cmpq	%r10, %r8
	je	.L128
	movq	%rax, %r10
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L128:
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
	jle	.L134
	leal	-1(%rsi), %eax
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L131:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L132:
	movq	$0x000000000, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L132
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L131
.L134:
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
	jle	.L139
	vmovq	.LC7(%rip), %xmm2
	vmovsd	.LC11(%rip), %xmm1
	leal	-1(%rdx), %r9d
	xorl	%r10d, %r10d
.L137:
	movq	(%rdi,%r10,8), %r8
	movq	(%rsi,%r10,8), %rcx
	xorl	%eax, %eax
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L145:
	leaq	1(%rax), %rdx
	cmpq	%rax, %r9
	je	.L144
	movq	%rdx, %rax
.L138:
	vmovsd	(%r8,%rax,8), %xmm0
	vsubsd	(%rcx,%rax,8), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L145
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L144:
	leaq	1(%r10), %rax
	cmpq	%r10, %r9
	je	.L142
	movq	%rax, %r10
	jmp	.L137
.L139:
	movl	$1, %eax
	ret
.L142:
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
.L147:
	addl	%edx, %edx
	decl	%eax
	jne	.L147
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmovsd	.LC12(%rip), %xmm1
	movl	$29793, %eax
	movl	$1680762733, 49(%rsp)
	vdivsd	%xmm0, %xmm1, %xmm3
	vaddsd	%xmm1, %xmm0, %xmm0
	movw	%ax, 53(%rsp)
	movb	$0, 55(%rsp)
	vcvttsd2sil	%xmm0, %ebp
	movl	%ebp, %edi
	vmovsd	%xmm3, (%rsp)
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
	vmovsd	(%rsp), %xmm3
	movl	%ebp, %esi
	vmovapd	%xmm3, %xmm0
	movq	%r12, %rdi
	vmovsd	%xmm3, 8(%rsp)
	call	fill_f
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	L2_norm
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	vmovsd	%xmm0, (%rsp)
	call	gettimeofday@PLT
	vmovsd	8(%rsp), %xmm3
	vmovsd	(%rsp), %xmm1
	movq	%r12, %rdx
	vmovapd	%xmm3, %xmm0
	movq	%r13, %rsi
	movl	$9, %edi
	call	multigrid_vcycle
	xorl	%esi, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday@PLT
	movl	%ebp, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	verify
	testl	%eax, %eax
	je	.L148
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	vxorps	%xmm2, %xmm2, %xmm2
.L149:
	vcvtsi2sdq	40(%rsp), %xmm2, %xmm0
	vmovsd	.LC15(%rip), %xmm3
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	vdivsd	%xmm3, %xmm0, %xmm1
	vcvtsi2sdq	32(%rsp), %xmm2, %xmm0
	movl	$1, %eax
	vaddsd	%xmm0, %xmm1, %xmm0
	vcvtsi2sdq	24(%rsp), %xmm2, %xmm1
	vcvtsi2sdq	16(%rsp), %xmm2, %xmm2
	vdivsd	%xmm3, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm2
	vsubsd	%xmm2, %xmm0, %xmm0
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
	jne	.L153
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L148:
	.cfi_restore_state
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	vxorps	%xmm2, %xmm2, %xmm2
	jmp	.L149
.L153:
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
	jle	.L161
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leal	-1(%rsi), %eax
	leaq	8(%rdi,%rax,8), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
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
.L156:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L157:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L157
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L156
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
.L161:
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
