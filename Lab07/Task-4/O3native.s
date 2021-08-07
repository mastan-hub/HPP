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
	jle	.L28
	leal	-1(%rdi), %eax
	cmpl	$13, %eax
	jbe	.L29
	movl	%edi, %edx
	vmovdqa	.LC2(%rip), %ymm0
	shrl	$3, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L25:
	incl	%eax
	vpslld	$1, %ymm0, %ymm0
	cmpl	%edx, %eax
	jne	.L25
	vmovdqa	%xmm0, %xmm1
	vextracti128	$0x1, %ymm0, %xmm0
	vpmulld	%xmm0, %xmm1, %xmm0
	movl	%edi, %ecx
	andl	$-8, %ecx
	leal	1(%rcx), %edx
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	cmpl	%ecx, %edi
	je	.L47
	vzeroupper
.L24:
	leal	1(%rdx), %ecx
	leal	(%rax,%rax), %esi
	cmpl	%ecx, %edi
	jl	.L41
	leal	2(%rdx), %ecx
	leal	0(,%rax,4), %esi
	cmpl	%ecx, %edi
	jl	.L41
	leal	3(%rdx), %ecx
	leal	0(,%rax,8), %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %esi
	leal	4(%rdx), %ecx
	sall	$4, %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %esi
	leal	5(%rdx), %ecx
	sall	$5, %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %esi
	leal	6(%rdx), %ecx
	sall	$6, %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %esi
	leal	7(%rdx), %ecx
	sall	$7, %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %esi
	leal	8(%rdx), %ecx
	sall	$8, %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %esi
	leal	9(%rdx), %ecx
	sall	$9, %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %esi
	leal	10(%rdx), %ecx
	sall	$10, %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %esi
	leal	11(%rdx), %ecx
	sall	$11, %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %esi
	leal	12(%rdx), %ecx
	sall	$12, %esi
	cmpl	%ecx, %edi
	jl	.L41
	movl	%eax, %ecx
	addl	$13, %edx
	sall	$13, %ecx
	sall	$14, %eax
	cmpl	%edx, %edi
	cmovl	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	movl	%esi, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	vzeroupper
	ret
.L29:
	movl	$1, %eax
	movl	$1, %edx
	jmp	.L24
	.cfi_endproc
.LFE44:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC3:
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
	leaq	.LC3(%rip), %rdi
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
	jle	.L53
	vmovsd	(%rsp), %xmm2
	leal	-1(%rbx), %ebp
	vmulsd	%xmm2, %xmm2, %xmm6
	xorl	%r13d, %r13d
	vmovsd	%xmm6, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L50:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdl	%r13d, %xmm4, %xmm1
	xorl	%ebx, %ebx
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	8(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC6(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	movq	(%r14,%r13,8), %r12
	vmovsd	%xmm0, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L51:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdl	%ebx, %xmm3, %xmm1
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
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
	cmpq	%rax, %rbp
	jne	.L51
	leaq	1(%r13), %rax
	cmpq	%r13, %rbp
	je	.L53
	movq	%rax, %r13
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L53:
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
	jle	.L62
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %r10d
	leal	-1(%rsi), %eax
	shrl	$2, %r10d
	movl	%esi, %r9d
	vmovapd	.LC9(%rip), %ymm4
	vmovq	.LC8(%rip), %xmm5
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rax, %r11
	pushq	%rbx
	.cfi_offset 3, -24
	salq	$5, %r10
	leaq	8(%rdi,%rax,8), %rbx
	andl	$-4, %r9d
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L57:
	movq	(%rdi), %rcx
	cmpl	$2, %r11d
	jbe	.L63
	movq	%rcx, %rax
	leaq	(%rcx,%r10), %rdx
	.p2align 4,,10
	.p2align 3
.L59:
	vandpd	(%rax), %ymm4, %ymm1
	addq	$32, %rax
	vaddsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm2
	vextractf128	$0x1, %ymm1, %xmm1
	vaddsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpq	%rdx, %rax
	jne	.L59
	movl	%r9d, %eax
	cmpl	%esi, %r9d
	je	.L58
.L61:
	movslq	%eax, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leaq	0(,%rdx,8), %r8
	vandpd	%xmm5, %xmm1, %xmm1
	leal	1(%rax), %edx
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L58
	vmovsd	8(%rcx,%r8), %xmm1
	addl	$2, %eax
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L58
	vmovsd	16(%rcx,%r8), %xmm1
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L58:
	addq	$8, %rdi
	cmpq	%rbx, %rdi
	jne	.L57
	vzeroupper
	popq	%rbx
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L63:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L61
.L62:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	vxorpd	%xmm0, %xmm0, %xmm0
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
	jle	.L80
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	leal	-1(%rsi), %eax
	movl	%esi, %r9d
	pushq	%rbp
	vxorpd	%xmm4, %xmm4, %xmm4
	movq	%rax, %r11
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	movl	%esi, %r10d
	shrl	$2, %r10d
	pushq	%rbx
	salq	$5, %r10
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	leaq	8(%rdi,%rax,8), %rbx
	subq	$32, %rsp
	andl	$-4, %r9d
	vmovapd	%xmm4, %xmm0
	.p2align 4,,10
	.p2align 3
.L74:
	movq	(%rdi), %rcx
	cmpl	$2, %r11d
	jbe	.L81
	movq	%rcx, %rax
	leaq	(%rcx,%r10), %rdx
	.p2align 4,,10
	.p2align 3
.L76:
	vmovupd	(%rax), %ymm1
	addq	$32, %rax
	vmulpd	%ymm1, %ymm1, %ymm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm2
	vextractf128	$0x1, %ymm1, %xmm1
	vaddsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpq	%rdx, %rax
	jne	.L76
	movl	%r9d, %eax
	cmpl	%esi, %r9d
	je	.L75
.L79:
	movslq	%eax, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leaq	0(,%rdx,8), %r8
	vmulsd	%xmm1, %xmm1, %xmm1
	leal	1(%rax), %edx
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L75
	vmovsd	8(%rcx,%r8), %xmm1
	addl	$2, %eax
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L75
	vmovsd	16(%rcx,%r8), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L75:
	addq	$8, %rdi
	cmpq	%rbx, %rdi
	jne	.L74
	vucomisd	%xmm0, %xmm4
	vsqrtsd	%xmm0, %xmm0, %xmm1
	ja	.L89
	vzeroupper
.L72:
	addq	$32, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	vmovapd	%xmm1, %xmm0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L79
.L80:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%xmm1, %xmm0
	ret
.L89:
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	.cfi_escape 0x10,0x6,0x2,0x76,0
	vmovsd	%xmm1, -24(%rbp)
	vzeroupper
	call	sqrt@PLT
	vmovsd	-24(%rbp), %xmm1
	jmp	.L72
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
	vmovsd	(%rax), %xmm1
	testl	%esi, %esi
	jle	.L90
	leal	-1(%rsi), %eax
	salq	$3, %rax
	vmovq	.LC8(%rip), %xmm2
	leaq	8(%rax,%rdi), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L95:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L94:
	vmovsd	(%rax), %xmm0
	addq	$8, %rax
	vandpd	%xmm2, %xmm0, %xmm0
	vmaxsd	%xmm1, %xmm0, %xmm1
	cmpq	%rax, %rdx
	jne	.L94
	addq	$8, %rdi
	cmpq	%rdi, %rsi
	jne	.L95
.L90:
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	-1(%rcx), %eax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$8, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, -8(%rsp)
	movq	%rdx, -16(%rsp)
	movl	%eax, -32(%rsp)
	cmpl	$1, %eax
	jle	.L116
	leal	-3(%rcx), %eax
	subl	$2, %ecx
	movl	%ecx, -24(%rsp)
	movq	%rdi, %r12
	movl	%ecx, %edi
	andl	$-4, %ecx
	leal	1(%rcx), %r14d
	movslq	%r14d, %r14
	salq	$3, %r14
	movl	%eax, -20(%rsp)
	addq	$2, %rax
	movq	%rax, (%rsp)
	leaq	-8(%r14), %rax
	movq	%rax, -40(%rsp)
	leaq	8(%r14), %rax
	movq	%rax, -48(%rsp)
	leal	2(%rcx), %eax
	movl	%eax, -52(%rsp)
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rsi
	movq	%rax, -64(%rsp)
	addq	$8, %rax
	movq	%rax, -80(%rsp)
	leal	3(%rcx), %eax
	movl	%eax, -56(%rsp)
	cltq
	salq	$3, %rax
	movq	%rsi, -72(%rsp)
	movq	%rax, -104(%rsp)
	leaq	-8(%rax), %rsi
	addq	$8, %rax
	vmovsd	.LC11(%rip), %xmm2
	shrl	$2, %edi
	movl	%ecx, -28(%rsp)
	movq	%rsi, -96(%rsp)
	movq	%rax, -88(%rsp)
	salq	$5, %rdi
	vmovapd	.LC10(%rip), %ymm1
	addq	$8, %rdi
	movl	$1, %r9d
	vmovapd	%xmm2, %xmm3
	.p2align 4,,10
	.p2align 3
.L105:
	movq	-16(%rsp), %rsi
	movq	-8(%r12,%r9,8), %rdx
	movq	(%rsi,%r9,8), %r8
	movq	-8(%rsp), %rsi
	leaq	8(%rdx), %r10
	movq	(%rsi,%r9,8), %rsi
	movq	(%r12,%r9,8), %rax
	leaq	40(%rsi), %r13
	leaq	8(%rsi), %rbx
	cmpq	%r10, %r13
	leaq	40(%rdx), %r10
	setbe	%r15b
	cmpq	%r10, %rbx
	setnb	%r10b
	orl	%r10d, %r15d
	leaq	48(%rax), %r10
	cmpq	%r10, %rbx
	setnb	%r11b
	cmpq	%r13, %rax
	setnb	%r10b
	orl	%r11d, %r10d
	andl	%r15d, %r10d
	movq	8(%r12,%r9,8), %rcx
	cmpl	$2, -20(%rsp)
	seta	%r11b
	andl	%r11d, %r10d
	leaq	8(%rcx), %r11
	cmpq	%r11, %r13
	leaq	40(%rcx), %r15
	setbe	%r11b
	cmpq	%r15, %rbx
	setnb	%r15b
	orl	%r15d, %r11d
	testb	%r11b, %r10b
	je	.L106
	leaq	8(%r8), %r10
	cmpq	%r10, %r13
	leaq	40(%r8), %r11
	setbe	%r10b
	cmpq	%r11, %rbx
	setnb	%r11b
	orb	%r11b, %r10b
	je	.L106
	movl	$8, %r10d
	.p2align 4,,10
	.p2align 3
.L102:
	vmulpd	(%rax,%r10), %ymm1, %ymm0
	vsubpd	(%rdx,%r10), %ymm0, %ymm0
	vsubpd	(%rcx,%r10), %ymm0, %ymm0
	vsubpd	-8(%rax,%r10), %ymm0, %ymm0
	vsubpd	8(%rax,%r10), %ymm0, %ymm0
	vsubpd	(%r8,%r10), %ymm0, %ymm0
	vmovupd	%ymm0, (%rsi,%r10)
	addq	$32, %r10
	cmpq	%rdi, %r10
	jne	.L102
	movl	-28(%rsp), %r15d
	cmpl	%r15d, -24(%rsp)
	je	.L104
	vmulsd	(%rax,%r14), %xmm3, %xmm0
	movq	-40(%rsp), %rbx
	movl	-32(%rsp), %r15d
	vsubsd	(%rdx,%r14), %xmm0, %xmm0
	vsubsd	(%rcx,%r14), %xmm0, %xmm0
	vsubsd	(%rax,%rbx), %xmm0, %xmm0
	movq	-48(%rsp), %rbx
	vsubsd	(%rax,%rbx), %xmm0, %xmm0
	movl	-52(%rsp), %ebx
	vsubsd	(%r8,%r14), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%r14)
	cmpl	%ebx, %r15d
	jle	.L104
	movq	-64(%rsp), %rbx
	movq	-72(%rsp), %r11
	vmulsd	(%rax,%rbx), %xmm3, %xmm0
	vsubsd	(%rdx,%rbx), %xmm0, %xmm0
	vsubsd	(%rcx,%rbx), %xmm0, %xmm0
	vsubsd	(%rax,%r11), %xmm0, %xmm0
	movq	-80(%rsp), %r11
	vsubsd	(%rax,%r11), %xmm0, %xmm0
	vsubsd	(%r8,%rbx), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%rbx)
	movl	-56(%rsp), %ebx
	cmpl	%ebx, %r15d
	jle	.L104
	movq	-104(%rsp), %rbx
	vmulsd	(%rax,%rbx), %xmm3, %xmm0
	vsubsd	(%rdx,%rbx), %xmm0, %xmm0
	vsubsd	(%rcx,%rbx), %xmm0, %xmm0
	movq	-96(%rsp), %rcx
	vsubsd	(%rax,%rcx), %xmm0, %xmm0
	movq	-88(%rsp), %rcx
	vsubsd	(%rax,%rcx), %xmm0, %xmm0
	vsubsd	(%r8,%rbx), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%rbx)
.L104:
	incq	%r9
	cmpq	(%rsp), %r9
	jne	.L105
	vzeroupper
.L116:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L106:
	.cfi_restore_state
	movq	(%rsp), %r11
	movl	$1, %r10d
	.p2align 4,,10
	.p2align 3
.L101:
	vmulsd	(%rax,%r10,8), %xmm2, %xmm0
	vsubsd	(%rdx,%r10,8), %xmm0, %xmm0
	vsubsd	(%rcx,%r10,8), %xmm0, %xmm0
	vsubsd	-8(%rax,%r10,8), %xmm0, %xmm0
	vsubsd	8(%rax,%r10,8), %xmm0, %xmm0
	vsubsd	(%r8,%r10,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%r10,8)
	incq	%r10
	cmpq	%r11, %r10
	jne	.L101
	jmp	.L104
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
	jle	.L124
	leal	-3(%rdx), %ecx
	vmovsd	.LC12(%rip), %xmm2
	addq	$2, %rcx
	movl	$1, %r11d
	.p2align 4,,10
	.p2align 3
.L121:
	movq	(%rdi,%r11,8), %rdx
	movq	-8(%rdi,%r11,8), %r10
	movq	8(%rdi,%r11,8), %r9
	movq	(%rsi,%r11,8), %r8
	vmovsd	(%rdx), %xmm1
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L120:
	vmovsd	(%r10,%rax,8), %xmm0
	vaddsd	(%r9,%rax,8), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vaddsd	(%r8,%rax,8), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	%xmm1, (%rdx,%rax,8)
	incq	%rax
	cmpq	%rax, %rcx
	jne	.L120
	incq	%r11
	cmpq	%r11, %rcx
	jne	.L121
.L124:
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
	jle	.L129
	movslq	%esi, %rax
	salq	$3, %rax
	movq	(%rdi), %r10
	movq	-8(%rdi,%rax), %r8
	leaq	-8(%rax), %r9
	leal	-1(%rsi), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L127:
	movq	(%rdi,%rax,8), %rdx
	movq	$0x000000000, (%r10,%rax,8)
	movq	$0x000000000, (%r8,%rax,8)
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	movq	%rax, %rdx
	incq	%rax
	cmpq	%rdx, %rcx
	jne	.L127
.L129:
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
	jle	.L150
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	leal	-1(%rdx), %r13d
	movl	%r13d, %ecx
	pushq	%r12
	andl	$-4, %ecx
	movl	%ecx, %r9d
	pushq	%rbx
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	movslq	%edx, %rsi
	movq	%rsi, %rax
	salq	$4, %rax
	andq	$-32, %rsp
	salq	$3, %r9
	leaq	-8(%rax), %r15
	leal	(%rcx,%rcx), %eax
	movq	%r9, -8(%rsp)
	leal	2(%rax), %r9d
	movslq	%r9d, %r9
	leal	1(%rcx), %r11d
	salq	$3, %r9
	movq	%r9, -24(%rsp)
	movl	%r11d, %r9d
	salq	$3, %r9
	movslq	%eax, %r14
	movq	%r9, -32(%rsp)
	leal	4(%rax), %r9d
	addl	$6, %eax
	cltq
	salq	$3, %rax
	movl	%r11d, -12(%rsp)
	leal	2(%rcx), %r11d
	addl	$3, %ecx
	movq	%rax, -64(%rsp)
	movl	%ecx, %eax
	salq	$3, %rax
	movq	%rax, -72(%rsp)
	movslq	%r9d, %r9
	leaq	1(%r13), %rax
	salq	$3, %r9
	salq	$4, %rax
	movq	%r9, -48(%rsp)
	movl	%r13d, %r8d
	movl	%r11d, %r9d
	movl	%r11d, -16(%rsp)
	movl	%ecx, -36(%rsp)
	movq	%rax, -80(%rsp)
	salq	$3, %r9
	shrl	$2, %r8d
	vmovsd	.LC11(%rip), %xmm2
	vmovapd	.LC10(%rip), %ymm1
	movq	%r9, -56(%rsp)
	movq	%r13, %r12
	salq	$3, %rsi
	salq	$5, %r8
	salq	$3, %r14
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L132:
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
	je	.L138
	xorl	%r10d, %r10d
	cmpl	$3, %r12d
	jbe	.L138
	.p2align 4,,10
	.p2align 3
.L135:
	vmovupd	(%rax,%r10,2), %ymm3
	vunpcklpd	32(%rax,%r10,2), %ymm3, %ymm0
	vpermpd	$216, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vmovupd	%ymm0, (%rcx,%r10)
	addq	$32, %r10
	cmpq	%r8, %r10
	jne	.L135
	vmulsd	(%rax,%r14), %xmm2, %xmm0
	movq	-8(%rsp), %r11
	vmovsd	%xmm0, (%rcx,%r11)
	cmpl	-12(%rsp), %edx
	jle	.L133
	movq	-24(%rsp), %r11
	vmulsd	(%rax,%r11), %xmm2, %xmm0
	movq	-32(%rsp), %r11
	vmovsd	%xmm0, (%rcx,%r11)
	cmpl	-16(%rsp), %edx
	jle	.L133
	movq	-48(%rsp), %r11
	vmulsd	(%rax,%r11), %xmm2, %xmm0
	movq	-56(%rsp), %r11
	vmovsd	%xmm0, (%rcx,%r11)
	cmpl	-36(%rsp), %edx
	jle	.L133
	movq	-64(%rsp), %r11
	vmulsd	(%rax,%r11), %xmm2, %xmm0
	movq	-72(%rsp), %rax
	vmovsd	%xmm0, (%rcx,%rax)
.L133:
	leaq	1(%r9), %rax
	cmpq	%r13, %r9
	je	.L147
.L153:
	movq	%rax, %r9
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L138:
	movq	-80(%rsp), %r11
	leaq	(%rax,%r11), %r10
	.p2align 4,,10
	.p2align 3
.L134:
	vmulsd	(%rax), %xmm2, %xmm0
	addq	$16, %rax
	addq	$8, %rcx
	vmovsd	%xmm0, -8(%rcx)
	cmpq	%r10, %rax
	jne	.L134
	leaq	1(%r9), %rax
	cmpq	%r13, %r9
	jne	.L153
.L147:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
.L150:
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	andq	$-32, %rsp
	subq	$160, %rsp
	movl	%ecx, 152(%rsp)
	testl	%edx, %edx
	jle	.L155
	leal	-1(%rdx), %eax
	movq	%rdi, %r14
	leaq	8(%rdi,%rax,8), %r15
	leaq	8(,%rax,8), %r13
	.p2align 4,,10
	.p2align 3
.L156:
	movq	(%r14), %rdi
	movq	%r13, %rdx
	xorl	%esi, %esi
	addq	$8, %r14
	call	memset@PLT
	cmpq	%r15, %r14
	jne	.L156
.L155:
	movl	152(%rsp), %eax
	leal	-1(%rax), %esi
	movl	%esi, 144(%rsp)
	testl	%esi, %esi
	jle	.L174
	subl	$2, %eax
	movl	%eax, 148(%rsp)
	leaq	8(,%rax,8), %rax
	movq	%rax, 152(%rsp)
	movl	%esi, %eax
	leaq	8(,%rax,8), %rcx
	movl	%esi, %r9d
	salq	$4, %rax
	andl	$-4, %esi
	movq	%rax, 136(%rsp)
	movslq	%esi, %rax
	movq	%rcx, 128(%rsp)
	leaq	0(,%rax,8), %rcx
	leal	(%rsi,%rsi), %eax
	movslq	%eax, %rdx
	salq	$3, %rdx
	movq	%rcx, 112(%rsp)
	addq	$8, %rcx
	movq	%rcx, 96(%rsp)
	leaq	8(%rdx), %rcx
	movq	%rcx, 88(%rsp)
	leal	1(%rsi), %ecx
	movq	%rdx, 104(%rsp)
	movslq	%ecx, %rdx
	movl	%ecx, 120(%rsp)
	leaq	0(,%rdx,8), %rcx
	leal	2(%rax), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	movl	%esi, 124(%rsp)
	movq	%rcx, 80(%rsp)
	addl	$2, %esi
	addq	$8, %rcx
	addl	$4, %eax
	movq	%rdx, 72(%rsp)
	movq	%rcx, 64(%rsp)
	cltq
	leaq	8(%rdx), %rcx
	movslq	%esi, %rdx
	salq	$3, %rax
	movq	%rcx, 56(%rsp)
	leaq	0(,%rdx,8), %rcx
	movl	%esi, 52(%rsp)
	movq	%rax, 32(%rsp)
	leaq	8(%rcx), %rsi
	addq	$8, %rax
	vmovsd	.LC15(%rip), %xmm5
	vmovsd	.LC12(%rip), %xmm7
	movq	%rcx, 40(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rax, 16(%rsp)
	shrl	$2, %r9d
	vmovapd	.LC13(%rip), %ymm3
	vmovapd	.LC14(%rip), %ymm4
	salq	$5, %r9
	xorl	%r8d, %r8d
	vmovapd	%xmm5, %xmm6
	vmovapd	%xmm7, %xmm8
	.p2align 4,,10
	.p2align 3
.L162:
	movq	(%rbx,%r8,2), %rdx
	movq	8(%rbx,%r8,2), %rcx
	movq	136(%rsp), %r11
	movq	(%r12,%r8), %rsi
	movq	128(%rsp), %rdi
	leaq	(%rdx,%r11), %r14
	addq	%rcx, %r11
	leaq	(%rsi,%rdi), %r15
	movq	8(%r12,%r8), %rax
	cmpq	%r11, %rsi
	setnb	%r10b
	cmpq	%r15, %rcx
	leaq	(%rax,%rdi), %r13
	setnb	%dil
	orl	%edi, %r10d
	cmpq	%r14, %rsi
	setnb	%dil
	cmpq	%r15, %rdx
	setnb	%r15b
	orl	%r15d, %edi
	andl	%edi, %r10d
	cmpl	$2, 148(%rsp)
	seta	%dil
	andl	%edi, %r10d
	cmpq	%r14, %rax
	setnb	%dil
	cmpq	%r13, %rdx
	setnb	%r14b
	orl	%r14d, %edi
	andl	%r10d, %edi
	cmpq	%r13, %rcx
	setnb	%r10b
	cmpq	%r11, %rax
	setnb	%r11b
	orl	%r11d, %r10d
	testb	%r10b, %dil
	je	.L163
	leaq	63(%rdx), %rdi
	subq	%rcx, %rdi
	cmpq	$126, %rdi
	jbe	.L163
	movq	%rsi, %r10
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L159:
	vmovupd	(%r10), %ymm2
	addq	$32, %r10
	vaddpd	-24(%r10), %ymm2, %ymm0
	vaddpd	(%rax,%rdi), %ymm2, %ymm1
	vpermpd	$68, %ymm2, %ymm9
	vmulpd	%ymm3, %ymm0, %ymm0
	vpermpd	$238, %ymm2, %ymm2
	vmulpd	%ymm3, %ymm1, %ymm1
	vpermpd	$68, %ymm0, %ymm10
	vpermpd	$238, %ymm0, %ymm0
	vshufpd	$12, %ymm0, %ymm2, %ymm2
	vshufpd	$12, %ymm10, %ymm9, %ymm9
	vmovupd	%ymm2, 32(%rdx,%rdi,2)
	vmovupd	%ymm9, (%rdx,%rdi,2)
	vmovupd	-32(%r10), %ymm2
	vaddpd	-24(%r10), %ymm2, %ymm0
	vpermpd	$68, %ymm1, %ymm2
	vpermpd	$238, %ymm1, %ymm1
	vaddpd	(%rax,%rdi), %ymm0, %ymm0
	vaddpd	8(%rax,%rdi), %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm0
	vpermpd	$68, %ymm0, %ymm9
	vpermpd	$238, %ymm0, %ymm0
	vshufpd	$12, %ymm9, %ymm2, %ymm2
	vshufpd	$12, %ymm0, %ymm1, %ymm0
	vmovupd	%ymm2, (%rcx,%rdi,2)
	vmovupd	%ymm0, 32(%rcx,%rdi,2)
	addq	$32, %rdi
	cmpq	%rdi, %r9
	jne	.L159
	movl	144(%rsp), %r15d
	movl	124(%rsp), %edi
	cmpl	%edi, %r15d
	je	.L161
	movq	112(%rsp), %r14
	movq	104(%rsp), %r11
	leaq	(%rsi,%r14), %rdi
	vmovsd	(%rdi), %xmm0
	leaq	(%rax,%r14), %r10
	vmovsd	%xmm0, (%rdx,%r11)
	vaddsd	(%r10), %xmm0, %xmm0
	movq	96(%rsp), %r14
	movq	88(%rsp), %r13
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r11)
	vmovsd	(%rdi), %xmm0
	leaq	(%rsi,%r14), %r11
	vaddsd	(%r11), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r13)
	vmovsd	(%rdi), %xmm0
	movl	120(%rsp), %edi
	vaddsd	(%r11), %xmm0, %xmm0
	vaddsd	(%r10), %xmm0, %xmm0
	vaddsd	(%rax,%r14), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r13)
	cmpl	%edi, %r15d
	jle	.L161
	movq	80(%rsp), %r14
	movq	72(%rsp), %r11
	leaq	(%rsi,%r14), %rdi
	vmovsd	(%rdi), %xmm0
	leaq	(%rax,%r14), %r10
	vmovsd	%xmm0, (%rdx,%r11)
	vaddsd	(%r10), %xmm0, %xmm0
	movq	64(%rsp), %r14
	movq	56(%rsp), %r13
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r11)
	vmovsd	(%rdi), %xmm0
	leaq	(%rsi,%r14), %r11
	vaddsd	(%r11), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r13)
	vmovsd	(%rdi), %xmm0
	movl	52(%rsp), %edi
	vaddsd	(%r11), %xmm0, %xmm0
	vaddsd	(%r10), %xmm0, %xmm0
	vaddsd	(%rax,%r14), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r13)
	cmpl	%edi, %r15d
	jle	.L161
	movq	40(%rsp), %r15
	movq	32(%rsp), %r11
	leaq	(%rsi,%r15), %rdi
	vmovsd	(%rdi), %xmm0
	leaq	(%rax,%r15), %r10
	vmovsd	%xmm0, (%rdx,%r11)
	vaddsd	(%r10), %xmm0, %xmm0
	movq	24(%rsp), %r15
	movq	16(%rsp), %r14
	vmulsd	%xmm6, %xmm0, %xmm0
	addq	%r15, %rsi
	vmovsd	%xmm0, (%rcx,%r11)
	vmovsd	(%rdi), %xmm0
	vaddsd	(%rsi), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r14)
	vmovsd	(%rdi), %xmm0
	vaddsd	(%rsi), %xmm0, %xmm0
	vaddsd	(%r10), %xmm0, %xmm0
	vaddsd	(%rax,%r15), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r14)
.L161:
	addq	$8, %r8
	cmpq	152(%rsp), %r8
	jne	.L162
	vzeroupper
.L174:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L163:
	.cfi_restore_state
	movq	152(%rsp), %r10
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L158:
	vmovsd	(%rsi,%rdi), %xmm0
	vmovsd	%xmm0, (%rdx,%rdi,2)
	vaddsd	(%rax,%rdi), %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,2)
	vmovsd	(%rsi,%rdi), %xmm0
	vaddsd	8(%rsi,%rdi), %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rdx,%rdi,2)
	vmovsd	(%rsi,%rdi), %xmm0
	vaddsd	8(%rsi,%rdi), %xmm0, %xmm0
	vaddsd	(%rax,%rdi), %xmm0, %xmm0
	vaddsd	8(%rax,%rdi), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rcx,%rdi,2)
	addq	$8, %rdi
	cmpq	%rdi, %r10
	jne	.L158
	jmp	.L161
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
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movl	%edi, %r13d
	pushq	%r12
	pushq	%rbx
	subq	$360, %rsp
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%rsi, -128(%rbp)
	movq	%rdx, -168(%rbp)
	vmovsd	%xmm0, -216(%rbp)
	vmovsd	%xmm1, -160(%rbp)
	testl	%edi, %edi
	jle	.L221
	leal	-1(%rdi), %ecx
	cmpl	$13, %ecx
	jbe	.L222
	movl	%edi, %edx
	vmovdqa	.LC2(%rip), %ymm0
	shrl	$3, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L179:
	incl	%eax
	vpslld	$1, %ymm0, %ymm0
	cmpl	%eax, %edx
	jne	.L179
	vmovdqa	%xmm0, %xmm1
	vextracti128	$0x1, %ymm0, %xmm0
	vpmulld	%xmm0, %xmm1, %xmm0
	movl	%r13d, %edx
	andl	$-8, %edx
	leal	1(%rdx), %eax
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %r12d
	cmpl	%edx, %r13d
	je	.L180
.L178:
	leal	1(%rax), %edx
	leal	(%r12,%r12), %esi
	cmpl	%edx, %r13d
	jl	.L232
	leal	2(%rax), %edx
	leal	0(,%r12,4), %esi
	cmpl	%edx, %r13d
	jl	.L232
	leal	3(%rax), %edx
	leal	0(,%r12,8), %esi
	cmpl	%edx, %r13d
	jl	.L232
	movl	%r12d, %esi
	leal	4(%rax), %edx
	sall	$4, %esi
	cmpl	%edx, %r13d
	jl	.L232
	movl	%r12d, %esi
	leal	5(%rax), %edx
	sall	$5, %esi
	cmpl	%edx, %r13d
	jl	.L232
	movl	%r12d, %esi
	leal	6(%rax), %edx
	sall	$6, %esi
	cmpl	%edx, %r13d
	jl	.L232
	movl	%r12d, %esi
	leal	7(%rax), %edx
	sall	$7, %esi
	cmpl	%edx, %r13d
	jl	.L232
	movl	%r12d, %esi
	leal	8(%rax), %edx
	sall	$8, %esi
	cmpl	%edx, %r13d
	jl	.L232
	movl	%r12d, %esi
	leal	9(%rax), %edx
	sall	$9, %esi
	cmpl	%edx, %r13d
	jl	.L232
	movl	%r12d, %esi
	leal	10(%rax), %edx
	sall	$10, %esi
	cmpl	%edx, %r13d
	jl	.L232
	movl	%r12d, %edx
	leal	11(%rax), %esi
	sall	$11, %edx
	cmpl	%esi, %r13d
	jl	.L234
	movl	%r12d, %edx
	leal	12(%rax), %esi
	sall	$12, %edx
	cmpl	%esi, %r13d
	jl	.L234
	movl	%r12d, %edx
	movl	%r12d, %r8d
	addl	$13, %eax
	sall	$13, %edx
	sall	$14, %r8d
	cmpl	%eax, %r13d
	cmovge	%r8d, %edx
	movl	%edx, %r12d
	jmp	.L180
.L232:
	movl	%esi, %r12d
.L180:
	leal	1(%r12), %eax
	movl	%eax, -116(%rbp)
	cmpl	$1, %r13d
	jle	.L284
	leal	-2(%r13), %eax
	cmpl	$13, %eax
	jbe	.L236
	movl	%ecx, %edx
	vmovdqa	.LC2(%rip), %ymm0
	shrl	$3, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L182:
	incl	%eax
	vpslld	$1, %ymm0, %ymm0
	cmpl	%eax, %edx
	jne	.L182
	vmovdqa	%xmm0, %xmm1
	vextracti128	$0x1, %ymm0, %xmm0
	vpmulld	%xmm0, %xmm1, %xmm0
	movl	%ecx, %edx
	andl	$-8, %edx
	leal	1(%rdx), %eax
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %ebx
	cmpl	%edx, %ecx
	je	.L183
.L181:
	leal	1(%rax), %edx
	leal	(%rbx,%rbx), %ecx
	cmpl	%edx, %r13d
	jle	.L246
	leal	2(%rax), %edx
	leal	0(,%rbx,4), %ecx
	cmpl	%edx, %r13d
	jle	.L246
	leal	3(%rax), %edx
	leal	0(,%rbx,8), %ecx
	cmpl	%edx, %r13d
	jle	.L246
	movl	%ebx, %ecx
	leal	4(%rax), %edx
	sall	$4, %ecx
	cmpl	%edx, %r13d
	jle	.L246
	movl	%ebx, %ecx
	leal	5(%rax), %edx
	sall	$5, %ecx
	cmpl	%edx, %r13d
	jle	.L246
	movl	%ebx, %ecx
	leal	6(%rax), %edx
	sall	$6, %ecx
	cmpl	%edx, %r13d
	jle	.L246
	movl	%ebx, %ecx
	leal	7(%rax), %edx
	sall	$7, %ecx
	cmpl	%edx, %r13d
	jle	.L246
	movl	%ebx, %ecx
	leal	8(%rax), %edx
	sall	$8, %ecx
	cmpl	%edx, %r13d
	jle	.L246
	movl	%ebx, %ecx
	leal	9(%rax), %edx
	sall	$9, %ecx
	cmpl	%edx, %r13d
	jle	.L246
	movl	%ebx, %ecx
	leal	10(%rax), %edx
	sall	$10, %ecx
	cmpl	%edx, %r13d
	jle	.L246
	movl	%ebx, %edx
	leal	11(%rax), %ecx
	sall	$11, %edx
	cmpl	%ecx, %r13d
	jle	.L248
	movl	%ebx, %edx
	leal	12(%rax), %ecx
	sall	$12, %edx
	cmpl	%ecx, %r13d
	jle	.L248
	movl	%ebx, %edx
	addl	$13, %eax
	sall	$13, %edx
	sall	$14, %ebx
	cmpl	%eax, %r13d
	cmovle	%edx, %ebx
	jmp	.L183
.L246:
	movl	%ecx, %ebx
.L183:
	incl	%ebx
	vzeroupper
.L184:
	movslq	-116(%rbp), %r15
	leaq	0(,%r15,8), %rax
	movq	%rax, %rdi
	movq	%rax, -72(%rbp)
	call	malloc@PLT
	movslq	%r12d, %r9
	leaq	1(%r9), %rdi
	movq	%rdi, -208(%rbp)
	salq	$3, %rdi
	movq	%rdi, -88(%rbp)
	addq	%rax, %rdi
	movq	%rax, -152(%rbp)
	movq	%rax, -336(%rbp)
	movq	%rdi, -264(%rbp)
	movl	%ebx, -56(%rbp)
	movq	%rdi, %r14
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L186:
	movl	$8, %esi
	movq	%r15, %rdi
	call	calloc@PLT
	movq	%rax, (%rbx)
	addq	$8, %rbx
	cmpq	%r14, %rbx
	jne	.L186
	movslq	-56(%rbp), %r14
	leaq	0(,%r14,8), %rax
	movq	%rax, %rdi
	movq	%rax, -56(%rbp)
	call	malloc@PLT
	leal	-1(%r14), %edi
	movl	%edi, -60(%rbp)
	movq	%rdi, -312(%rbp)
	incq	%rdi
	movq	%rdi, -200(%rbp)
	salq	$3, %rdi
	movq	%rdi, -80(%rbp)
	addq	%rax, %rdi
	movq	%rax, -192(%rbp)
	movq	%rax, -352(%rbp)
	movq	%rdi, -384(%rbp)
	movl	%r14d, -96(%rbp)
	movl	%r12d, -64(%rbp)
	movq	%rdi, %rbx
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L187:
	movl	$8, %esi
	movq	%r14, %rdi
	call	calloc@PLT
	movq	%rax, (%r12)
	addq	$8, %r12
	cmpq	%rbx, %r12
	jne	.L187
	movq	-72(%rbp), %rdi
	movl	-96(%rbp), %ebx
	movl	-64(%rbp), %r12d
	call	malloc@PLT
	movq	-88(%rbp), %rdi
	movq	%rax, -184(%rbp)
	addq	%rax, %rdi
	movq	%rax, -344(%rbp)
	movq	%rdi, -376(%rbp)
	movl	%ebx, -72(%rbp)
	movl	%r12d, -88(%rbp)
	movq	%rdi, %rbx
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L188:
	movl	$8, %esi
	movq	%r15, %rdi
	call	calloc@PLT
	movq	%rax, (%r12)
	addq	$8, %r12
	cmpq	%rbx, %r12
	jne	.L188
	movq	-56(%rbp), %rdi
	movl	-72(%rbp), %ebx
	movl	-88(%rbp), %r12d
	call	malloc@PLT
	movq	-80(%rbp), %rdi
	movq	%rax, -176(%rbp)
	addq	%rax, %rdi
	movq	%rax, -360(%rbp)
	movq	%rdi, -368(%rbp)
	movl	%ebx, -56(%rbp)
	movq	%rdi, %r15
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L189:
	movl	$8, %esi
	movq	%r14, %rdi
	call	calloc@PLT
	movq	%rax, (%rbx)
	addq	$8, %rbx
	cmpq	%r15, %rbx
	jne	.L189
	vmovsd	-160(%rbp), %xmm5
	movl	-56(%rbp), %ebx
	vdivsd	%xmm5, %xmm5, %xmm0
	vcomisd	.LC16(%rip), %xmm0
	jbe	.L281
	leal	-1(%r13), %eax
	movl	%eax, -232(%rbp)
	movq	%r14, %rax
	salq	$4, %rax
	subq	$8, %rax
	movq	%rax, -304(%rbp)
	leaq	0(,%r14,8), %rax
	movq	%rax, -288(%rbp)
	movl	-60(%rbp), %eax
	leal	1(%r12), %r10d
	movl	%eax, %r14d
	andl	$-4, %eax
	movl	%eax, %edx
	leal	(%rax,%rax), %eax
	movslq	%eax, %rcx
	leaq	0(,%rcx,8), %rdi
	movl	%edx, %ecx
	movq	%rdi, -296(%rbp)
	leaq	0(,%rcx,8), %rdi
	leal	2(%rax), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	movq	%rdi, -272(%rbp)
	leal	1(%rdx), %edi
	movq	%rcx, -88(%rbp)
	movl	%edi, %ecx
	movl	%edi, -72(%rbp)
	leaq	0(,%rcx,8), %rdi
	leal	4(%rax), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	movq	%rdi, -96(%rbp)
	leal	2(%rdx), %edi
	movq	%rcx, -104(%rbp)
	addl	$6, %eax
	movl	%edi, %ecx
	movl	%edi, -80(%rbp)
	cltq
	leaq	0(,%rcx,8), %rdi
	salq	$3, %rax
	movq	%rdi, -112(%rbp)
	leal	3(%rdx), %edi
	movq	%rax, -144(%rbp)
	movl	%r10d, %r15d
	movl	%edi, %eax
	andl	$-4, %r15d
	salq	$3, %rax
	movq	%rax, -136(%rbp)
	movslq	%r15d, %rax
	leaq	0(,%rax,8), %r11
	movq	%rax, -320(%rbp)
	leal	1(%r15), %eax
	movl	%eax, -56(%rbp)
	cltq
	leaq	0(,%rax,8), %r8
	leal	2(%r15), %eax
	cltq
	salq	$3, %rax
	movq	%rax, -280(%rbp)
	movq	-200(%rbp), %rax
	movq	-208(%rbp), %r9
	salq	$4, %rax
	movl	%r10d, %r13d
	movl	%edi, -64(%rbp)
	movq	%rax, -256(%rbp)
	movq	%r11, -208(%rbp)
	movl	%r10d, -120(%rbp)
	movq	%r8, -328(%rbp)
	shrl	$2, %r14d
	salq	$3, %r9
	shrl	$2, %r13d
	movl	%ebx, -200(%rbp)
	salq	$5, %r14
	salq	$5, %r13
	movq	%r9, %rbx
.L215:
	movq	-168(%rbp), %rsi
	movl	-116(%rbp), %edx
	movq	-128(%rbp), %rdi
	call	GS_update
	movq	%rsi, %rdx
	movl	-116(%rbp), %ecx
	movq	-152(%rbp), %rsi
	call	L_def
	movq	.LC11(%rip), %rax
	movl	%r15d, -224(%rbp)
	movl	%r12d, -228(%rbp)
	movq	%r13, -240(%rbp)
	movq	%rbx, -248(%rbp)
	movl	-200(%rbp), %r8d
	movq	-272(%rbp), %r9
	movq	-192(%rbp), %r10
	movq	-152(%rbp), %r11
	movq	-304(%rbp), %r15
	movq	-288(%rbp), %r12
	movq	-296(%rbp), %r13
	movq	-312(%rbp), %rbx
	vmovapd	.LC10(%rip), %ymm4
	xorl	%ecx, %ecx
	vmovq	%rax, %xmm5
	.p2align 4,,10
	.p2align 3
.L192:
	movq	%rcx, %rax
	movq	(%r10,%rcx,8), %rdx
	salq	$4, %rax
	movq	(%r11,%rax), %rax
	leaq	(%rdx,%r12), %rsi
	cmpq	%rsi, %rax
	leaq	(%rax,%r15), %rsi
	setnb	%dil
	cmpq	%rsi, %rdx
	setnb	%sil
	orb	%sil, %dil
	je	.L199
	xorl	%esi, %esi
	cmpl	$3, -60(%rbp)
	jbe	.L199
	.p2align 4,,10
	.p2align 3
.L195:
	vmovupd	(%rax,%rsi,2), %ymm6
	vunpcklpd	32(%rax,%rsi,2), %ymm6, %ymm0
	vpermpd	$216, %ymm0, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm0
	vmovupd	%ymm0, (%rdx,%rsi)
	addq	$32, %rsi
	cmpq	%r14, %rsi
	jne	.L195
	vmulsd	(%rax,%r13), %xmm5, %xmm0
	vmovsd	%xmm0, (%rdx,%r9)
	cmpl	-72(%rbp), %r8d
	jle	.L193
	movq	-88(%rbp), %rdi
	vmulsd	(%rax,%rdi), %xmm5, %xmm0
	movq	-96(%rbp), %rdi
	vmovsd	%xmm0, (%rdx,%rdi)
	cmpl	-80(%rbp), %r8d
	jle	.L193
	movq	-104(%rbp), %rdi
	vmulsd	(%rax,%rdi), %xmm5, %xmm0
	movq	-112(%rbp), %rdi
	vmovsd	%xmm0, (%rdx,%rdi)
	cmpl	-64(%rbp), %r8d
	jle	.L193
	movq	-144(%rbp), %rdi
	vmulsd	(%rax,%rdi), %xmm5, %xmm0
	movq	-136(%rbp), %rax
	vmovsd	%xmm0, (%rdx,%rax)
.L193:
	leaq	1(%rcx), %rax
	cmpq	%rbx, %rcx
	je	.L197
.L288:
	movq	%rax, %rcx
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L199:
	movq	-256(%rbp), %rdi
	leaq	(%rax,%rdi), %rsi
	.p2align 4,,10
	.p2align 3
.L194:
	vmulsd	(%rax), %xmm5, %xmm0
	addq	$16, %rax
	addq	$8, %rdx
	vmovsd	%xmm0, -8(%rdx)
	cmpq	%rsi, %rax
	jne	.L194
	leaq	1(%rcx), %rax
	cmpq	%rbx, %rcx
	jne	.L288
	.p2align 4,,10
	.p2align 3
.L197:
	movl	-224(%rbp), %r15d
	movl	-228(%rbp), %r12d
	movq	-240(%rbp), %r13
	movq	-248(%rbp), %rbx
	vmovsd	-160(%rbp), %xmm1
	vmovsd	-216(%rbp), %xmm0
	movq	-192(%rbp), %rdx
	movq	-176(%rbp), %rsi
	movl	-232(%rbp), %edi
	vzeroupper
	call	multigrid_vcycle
	movq	-176(%rbp), %rsi
	movq	-184(%rbp), %rdi
	movl	-200(%rbp), %ecx
	movl	-116(%rbp), %edx
	call	prol_P
	movq	%r14, -224(%rbp)
	movq	-184(%rbp), %r8
	movq	-208(%rbp), %r11
	movl	-120(%rbp), %r10d
	movq	-328(%rbp), %rdi
	movq	-280(%rbp), %r14
	movq	-128(%rbp), %r9
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L200:
	movq	(%r9,%rsi), %rdx
	movq	(%r8,%rsi), %rcx
	leaq	31(%rdx), %rax
	subq	%rcx, %rax
	cmpq	$62, %rax
	jbe	.L253
	xorl	%eax, %eax
	cmpl	$2, %r12d
	jbe	.L253
	.p2align 4,,10
	.p2align 3
.L204:
	vmovupd	(%rdx,%rax), %ymm7
	vsubpd	(%rcx,%rax), %ymm7, %ymm0
	vmovupd	%ymm0, (%rdx,%rax)
	addq	$32, %rax
	cmpq	%r13, %rax
	jne	.L204
	cmpl	%r10d, %r15d
	je	.L203
	leaq	(%rdx,%r11), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rcx,%r11), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	cmpl	%r12d, %r15d
	jge	.L203
	leaq	(%rdx,%rdi), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rcx,%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	cmpl	%r12d, -56(%rbp)
	jge	.L203
	addq	%r14, %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rcx,%r14), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
.L203:
	addq	$8, %rsi
	cmpq	%rbx, %rsi
	jne	.L200
	movq	-224(%rbp), %r14
	movl	-116(%rbp), %edx
	movq	-168(%rbp), %rsi
	movq	-128(%rbp), %rdi
	vzeroupper
	call	GS_update
	movq	-320(%rbp), %rax
	movq	-152(%rbp), %rsi
	movl	-120(%rbp), %r10d
	movq	-264(%rbp), %r8
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	0(,%rax,8), %rdi
	.p2align 4,,10
	.p2align 3
.L208:
	movq	(%rsi), %rcx
	cmpl	$2, %r12d
	jle	.L213
	movq	%rcx, %rax
	leaq	(%rcx,%r13), %rdx
	.p2align 4,,10
	.p2align 3
.L210:
	vmovupd	(%rax), %ymm0
	addq	$32, %rax
	vmulpd	%ymm0, %ymm0, %ymm0
	vaddsd	%xmm1, %xmm0, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm3
	vextractf128	$0x1, %ymm0, %xmm0
	vaddsd	%xmm1, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm0, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	cmpq	%rdx, %rax
	jne	.L210
	cmpl	%r10d, %r15d
	je	.L209
	vmovsd	(%rcx,%rdi), %xmm0
	movl	-56(%rbp), %edx
	vmulsd	%xmm0, %xmm0, %xmm0
	movq	%rdi, %rax
	vaddsd	%xmm0, %xmm1, %xmm1
	cmpl	%r12d, %r15d
	jge	.L209
.L220:
	vmovsd	8(%rcx,%rax), %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	cmpl	%r12d, %edx
	jge	.L209
	vmovsd	16(%rcx,%rax), %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
.L209:
	addq	$8, %rsi
	cmpq	%r8, %rsi
	jne	.L208
	vxorpd	%xmm6, %xmm6, %xmm6
	vucomisd	%xmm1, %xmm6
	vsqrtsd	%xmm1, %xmm1, %xmm2
	ja	.L289
	vzeroupper
.L214:
	vdivsd	-160(%rbp), %xmm2, %xmm2
	vcomisd	.LC16(%rip), %xmm2
	ja	.L215
.L281:
	movq	-336(%rbp), %rbx
	movq	-264(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L191:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L191
	movq	-152(%rbp), %rdi
	call	free@PLT
	movq	-352(%rbp), %rbx
	movq	-384(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L217:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L217
	movq	-192(%rbp), %rdi
	call	free@PLT
	movq	-344(%rbp), %rbx
	movq	-376(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L218:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L218
	movq	-184(%rbp), %rdi
	call	free@PLT
	movq	-360(%rbp), %rbx
	movq	-368(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L219:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L219
	movq	-176(%rbp), %rdi
	addq	$360, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L253:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L202:
	vmovsd	(%rdx,%rax), %xmm0
	vsubsd	(%rcx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L202
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L213:
	vmovsd	(%rcx), %xmm0
	xorl	%eax, %eax
	vmulsd	%xmm0, %xmm0, %xmm0
	movl	$1, %edx
	vaddsd	%xmm0, %xmm1, %xmm1
	jmp	.L220
.L234:
	movl	%edx, %r12d
	jmp	.L180
.L248:
	movl	%edx, %ebx
	jmp	.L183
.L221:
	movl	$2, -116(%rbp)
	movl	$1, %r12d
.L177:
	cmpl	$1, %r13d
	jne	.L250
	vmovsd	-216(%rbp), %xmm5
	movq	-168(%rbp), %rbx
	vmulsd	%xmm5, %xmm5, %xmm0
	movq	8(%rbx), %rdx
	movq	-128(%rbp), %rax
	movq	8(%rax), %rax
	vmulsd	8(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
	addq	$360, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L236:
	.cfi_restore_state
	movl	$1, %eax
	movl	$1, %ebx
	jmp	.L181
.L222:
	movl	$1, %eax
	movl	$1, %r12d
	jmp	.L178
.L250:
	movl	$2, %ebx
	jmp	.L184
.L289:
	vmovapd	%xmm1, %xmm0
	vmovsd	%xmm2, -224(%rbp)
	vzeroupper
	call	sqrt@PLT
	vmovsd	-224(%rbp), %xmm2
	jmp	.L214
.L284:
	vzeroupper
	jmp	.L177
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
	jle	.L312
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edx, %r9d
	shrl	$2, %r9d
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movl	%edx, %r15d
	andl	$-4, %r15d
	pushq	%r14
	.cfi_offset 14, -32
	leal	2(%r15), %r14d
	salq	$5, %r9
	pushq	%r13
	.cfi_offset 13, -40
	movq	%rsi, %r13
	leal	-1(%rdx), %esi
	pushq	%r12
	.cfi_offset 12, -48
	movq	%rdi, %r12
	movl	%r15d, %edi
	pushq	%rbx
	.cfi_offset 3, -56
	leal	1(%r15), %ebx
	salq	$3, %rdi
	andq	$-32, %rsp
	movl	%esi, -4(%rsp)
	movl	%ebx, -8(%rsp)
	movl	%r14d, -12(%rsp)
	salq	$3, %rbx
	salq	$3, %r14
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L292:
	movq	(%r12,%r10,8), %rax
	movq	0(%r13,%r10,8), %rcx
	leaq	31(%rax), %r8
	subq	%rcx, %r8
	cmpq	$62, %r8
	jbe	.L300
	xorl	%r8d, %r8d
	cmpl	$2, -4(%rsp)
	jbe	.L300
	.p2align 4,,10
	.p2align 3
.L296:
	vmovupd	(%rax,%r8), %ymm1
	vsubpd	(%rcx,%r8), %ymm1, %ymm0
	vmovupd	%ymm0, (%rax,%r8)
	addq	$32, %r8
	cmpq	%r9, %r8
	jne	.L296
	cmpl	%edx, %r15d
	je	.L295
	leaq	(%rax,%rdi), %r8
	vmovsd	(%r8), %xmm0
	vsubsd	(%rcx,%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	cmpl	-8(%rsp), %edx
	jle	.L295
	leaq	(%rax,%rbx), %r8
	vmovsd	(%r8), %xmm0
	vsubsd	(%rcx,%rbx), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	cmpl	-12(%rsp), %edx
	jle	.L295
	addq	%r14, %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rcx,%r14), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
.L295:
	leaq	1(%r10), %rax
	cmpq	%rsi, %r10
	je	.L309
.L315:
	movq	%rax, %r10
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L300:
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L294:
	vmovsd	(%rax,%r8,8), %xmm0
	movq	%r8, %r11
	vsubsd	(%rcx,%r8,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax,%r8,8)
	incq	%r8
	cmpq	%rsi, %r11
	jne	.L294
	leaq	1(%r10), %rax
	cmpq	%rsi, %r10
	jne	.L315
.L309:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
.L312:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
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
	jle	.L322
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leal	-1(%rsi), %eax
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
.L318:
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	xorl	%esi, %esi
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r12, %rbx
	jne	.L318
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L322:
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
	jle	.L329
	vmovq	.LC8(%rip), %xmm2
	vmovsd	.LC16(%rip), %xmm1
	leal	-1(%rdx), %r9d
	xorl	%r10d, %r10d
.L327:
	movq	(%rdi,%r10,8), %r8
	movq	(%rsi,%r10,8), %rcx
	xorl	%eax, %eax
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L335:
	leaq	1(%rax), %rdx
	cmpq	%rax, %r9
	je	.L334
	movq	%rdx, %rax
.L328:
	vmovsd	(%r8,%rax,8), %xmm0
	vsubsd	(%rcx,%rax,8), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L335
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L334:
	leaq	1(%r10), %rax
	cmpq	%r10, %r9
	je	.L332
	movq	%rax, %r10
	jmp	.L327
.L329:
	movl	$1, %eax
	ret
.L332:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE56:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC18:
	.string	"\nResult OK!"
.LC19:
	.string	"\nResult not OK!"
.LC21:
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
	vmovsd	.LC17(%rip), %xmm2
	movl	$513, %esi
	vmovapd	%xmm2, %xmm0
	movq	%rbp, %rdi
	call	fill_f
	movl	$513, %esi
	movq	%rbp, %rdi
	call	L2_norm
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	vmovsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	movq	.LC17(%rip), %rax
	vmovsd	8(%rsp), %xmm1
	movq	%rbp, %rdx
	vmovq	%rax, %xmm0
	movq	%r12, %rsi
	movl	$9, %edi
	call	multigrid_vcycle
	xorl	%esi, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday@PLT
	movl	$513, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	verify
	testl	%eax, %eax
	je	.L337
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
.L338:
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	40(%rsp), %xmm2, %xmm0
	vmovsd	.LC20(%rip), %xmm3
	leaq	.LC21(%rip), %rsi
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
	jne	.L341
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L337:
	.cfi_restore_state
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	jmp	.L338
.L341:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.str1.1
.LC22:
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
	jle	.L349
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
	leaq	.LC22(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.p2align 4,,10
	.p2align 3
.L344:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L345:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L345
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L344
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
.L349:
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
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC2:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	1413754136
	.long	1074340347
	.align 8
.LC5:
	.long	3700601565
	.long	1075168253
	.align 8
.LC6:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC8:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst32
	.align 32
.LC9:
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.align 32
.LC10:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8
	.align 8
.LC11:
	.long	0
	.long	1074790400
	.align 8
.LC12:
	.long	0
	.long	1070596096
	.section	.rodata.cst32
	.align 32
.LC13:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 32
.LC14:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.section	.rodata.cst8
	.align 8
.LC15:
	.long	0
	.long	1071644672
	.align 8
.LC16:
	.long	2296604913
	.long	1055193269
	.align 8
.LC17:
	.long	0
	.long	1063256064
	.align 8
.LC20:
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
