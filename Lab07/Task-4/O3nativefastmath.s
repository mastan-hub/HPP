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
.LC5:
	.string	"\n"
	.text
	.p2align 4
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB45:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movl	%esi, %r13d
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$320, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -272(%rbp)
	leaq	.LC5(%rip), %rdi
	vmovsd	%xmm0, -248(%rbp)
	call	puts@PLT
	testl	%r13d, %r13d
	jle	.L59
	leal	-1(%r13), %eax
	movq	%rax, %rsi
	vmovsd	-248(%rbp), %xmm5
	movl	%eax, -364(%rbp)
	addq	$2, %rax
	movq	%rax, -344(%rbp)
	leal	-2(%r13), %eax
	vmulsd	%xmm5, %xmm5, %xmm7
	movl	%eax, -348(%rbp)
	movl	%esi, %eax
	shrl	$3, %eax
	salq	$6, %rax
	andl	$-8, %esi
	movq	%rax, -360(%rbp)
	leal	1(%rsi), %eax
	movl	%esi, -352(%rbp)
	movl	%eax, -368(%rbp)
	vmovsd	%xmm7, -264(%rbp)
	vxorpd	%xmm0, %xmm0, %xmm0
	vbroadcastsd	%xmm5, %ymm5
	vbroadcastsd	%xmm7, %ymm7
	movl	$1, %r14d
	vmovapd	%xmm0, %xmm2
	vmovapd	%ymm5, -304(%rbp)
	vmovapd	%ymm7, -336(%rbp)
	.p2align 4,,10
	.p2align 3
.L50:
	vmulsd	%xmm0, %xmm2, %xmm5
	movq	-272(%rbp), %rax
	movq	-8(%rax,%r14,8), %r12
	vmovsd	%xmm5, -256(%rbp)
	movq	$0x000000000, (%r12)
	cmpl	$1, %r13d
	je	.L58
	cmpl	$6, -348(%rbp)
	jbe	.L56
	vbroadcastsd	%xmm2, %ymm2
	vbroadcastsd	%xmm0, %ymm0
	vmulpd	%ymm0, %ymm2, %ymm5
	movq	-360(%rbp), %rax
	vmovdqa	.LC3(%rip), %ymm2
	movq	%r12, %r15
	leaq	(%r12,%rax), %rbx
	vmovapd	%ymm5, -112(%rbp)
	.p2align 4,,10
	.p2align 3
.L52:
	vmovapd	-304(%rbp), %ymm3
	vmovdqa	%ymm2, %ymm0
	vcvtdq2pd	%xmm0, %ymm1
	vmulpd	%ymm3, %ymm1, %ymm1
	vextracti128	$0x1, %ymm0, %xmm0
	vcvtdq2pd	%xmm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm4
	vpaddd	.LC6(%rip), %ymm2, %ymm2
	vmulpd	.LC7(%rip), %ymm1, %ymm0
	vmovdqa	%ymm2, -240(%rbp)
	vmovapd	%ymm1, -208(%rbp)
	vmovapd	%ymm4, -80(%rbp)
	addq	$64, %r15
	call	_ZGVdN4v_sin@PLT
	vmovapd	-80(%rbp), %ymm4
	vmovapd	%ymm0, -176(%rbp)
	vmulpd	.LC7(%rip), %ymm4, %ymm0
	call	_ZGVdN4v_sin@PLT
	vmovapd	-208(%rbp), %ymm1
	vmovapd	%ymm0, -144(%rbp)
	vmulpd	.LC8(%rip), %ymm1, %ymm0
	call	_ZGVdN4v_sin@PLT
	vmulpd	-176(%rbp), %ymm0, %ymm0
	vmovapd	-80(%rbp), %ymm4
	vmulpd	-112(%rbp), %ymm0, %ymm7
	vmulpd	.LC8(%rip), %ymm4, %ymm0
	vmovapd	%ymm7, -176(%rbp)
	call	_ZGVdN4v_sin@PLT
	vmulpd	-144(%rbp), %ymm0, %ymm0
	vmovapd	-336(%rbp), %ymm6
	vmovapd	-176(%rbp), %ymm7
	vmovdqa	-240(%rbp), %ymm2
	vmulpd	%ymm6, %ymm7, %ymm1
	vmulpd	-112(%rbp), %ymm0, %ymm0
	vmovupd	%ymm1, -56(%r15)
	vmulpd	%ymm6, %ymm0, %ymm0
	vmovupd	%ymm0, -24(%r15)
	cmpq	%r15, %rbx
	jne	.L52
	movl	-364(%rbp), %ecx
	cmpl	%ecx, -352(%rbp)
	je	.L58
	movl	-368(%rbp), %ebx
.L51:
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%ebx, %xmm5, %xmm1
	vmulsd	-248(%rbp), %xmm1, %xmm1
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -112(%rbp)
	vzeroupper
	call	sin@PLT
	vmovsd	-112(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmulsd	-80(%rbp), %xmm0, %xmm0
	movslq	%ebx, %rax
	leaq	0(,%rax,8), %r15
	vmulsd	-256(%rbp), %xmm0, %xmm0
	vmulsd	-264(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rax,8)
	leal	1(%rbx), %eax
	cmpl	%eax, %r13d
	jle	.L55
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%eax, %xmm5, %xmm1
	vmulsd	-248(%rbp), %xmm1, %xmm1
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -112(%rbp)
	call	sin@PLT
	vmovsd	-112(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmulsd	-80(%rbp), %xmm0, %xmm0
	leal	2(%rbx), %eax
	vmulsd	-256(%rbp), %xmm0, %xmm0
	vmulsd	-264(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r12,%r15)
	cmpl	%eax, %r13d
	jle	.L55
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%eax, %xmm5, %xmm1
	vmulsd	-248(%rbp), %xmm1, %xmm1
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -112(%rbp)
	call	sin@PLT
	vmovsd	-112(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmulsd	-80(%rbp), %xmm0, %xmm0
	leal	3(%rbx), %eax
	vmulsd	-256(%rbp), %xmm0, %xmm0
	vmulsd	-264(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r12,%r15)
	cmpl	%eax, %r13d
	jle	.L55
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%eax, %xmm5, %xmm1
	vmulsd	-248(%rbp), %xmm1, %xmm1
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -112(%rbp)
	call	sin@PLT
	vmovsd	-112(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmulsd	-80(%rbp), %xmm0, %xmm0
	leal	4(%rbx), %eax
	vmulsd	-256(%rbp), %xmm0, %xmm0
	vmulsd	-264(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r12,%r15)
	cmpl	%eax, %r13d
	jle	.L55
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%eax, %xmm5, %xmm1
	vmulsd	-248(%rbp), %xmm1, %xmm1
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -112(%rbp)
	call	sin@PLT
	vmovsd	-112(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmulsd	-80(%rbp), %xmm0, %xmm0
	leal	5(%rbx), %eax
	vmulsd	-256(%rbp), %xmm0, %xmm0
	vmulsd	-264(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%r12,%r15)
	cmpl	%eax, %r13d
	jle	.L55
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%eax, %xmm5, %xmm1
	addl	$6, %ebx
	vmulsd	-248(%rbp), %xmm1, %xmm1
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -112(%rbp)
	call	sin@PLT
	vmovsd	-112(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmulsd	-80(%rbp), %xmm0, %xmm0
	vmulsd	-256(%rbp), %xmm0, %xmm0
	vmulsd	-264(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 40(%r12,%r15)
	cmpl	%ebx, %r13d
	jle	.L55
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%ebx, %xmm5, %xmm1
	vmulsd	-248(%rbp), %xmm1, %xmm1
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -112(%rbp)
	call	sin@PLT
	vmovsd	-112(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmulsd	-80(%rbp), %xmm0, %xmm0
	vmulsd	-256(%rbp), %xmm0, %xmm0
	vmulsd	-264(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 48(%r12,%r15)
.L55:
	movl	%r14d, %eax
	incq	%r14
	cmpq	-344(%rbp), %r14
	je	.L59
.L61:
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%eax, %xmm5, %xmm1
	vmulsd	-248(%rbp), %xmm1, %xmm1
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -112(%rbp)
	call	sin@PLT
	vmovsd	-112(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC11(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmovsd	-80(%rbp), %xmm2
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L58:
	vzeroupper
	movl	%r14d, %eax
	incq	%r14
	cmpq	-344(%rbp), %r14
	jne	.L61
.L59:
	addq	$320, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L56:
	.cfi_restore_state
	movl	$1, %ebx
	jmp	.L51
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
	jle	.L69
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %r10d
	leal	-1(%rsi), %eax
	shrl	$2, %r10d
	movl	%esi, %r9d
	vmovapd	.LC13(%rip), %ymm3
	vmovq	.LC12(%rip), %xmm4
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rax, %r11
	pushq	%rbx
	.cfi_offset 3, -24
	salq	$5, %r10
	leaq	8(%rdi,%rax,8), %rbx
	andl	$-4, %r9d
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L64:
	movq	(%rdi), %rcx
	cmpl	$2, %r11d
	jbe	.L70
	movq	%rcx, %rax
	leaq	(%rcx,%r10), %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L66:
	vandpd	(%rax), %ymm3, %ymm1
	addq	$32, %rax
	vaddpd	%ymm1, %ymm0, %ymm0
	cmpq	%rdx, %rax
	jne	.L66
	vextractf128	$0x1, %ymm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm1
	movl	%r9d, %eax
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%esi, %r9d
	je	.L65
.L68:
	movslq	%eax, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm0
	leaq	0(,%rdx,8), %r8
	vandpd	%xmm4, %xmm0, %xmm0
	leal	1(%rax), %edx
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%edx, %esi
	jle	.L65
	vmovsd	8(%rcx,%r8), %xmm0
	addl	$2, %eax
	vandpd	%xmm4, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%eax, %esi
	jle	.L65
	vmovsd	16(%rcx,%r8), %xmm0
	vandpd	%xmm4, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
.L65:
	addq	$8, %rdi
	cmpq	%rbx, %rdi
	jne	.L64
	vzeroupper
	popq	%rbx
	vmovapd	%xmm2, %xmm0
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L68
.L69:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovapd	%xmm2, %xmm0
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
	jle	.L94
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %r10d
	leal	-1(%rsi), %eax
	shrl	$2, %r10d
	movl	%esi, %r9d
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rax, %r11
	pushq	%rbx
	.cfi_offset 3, -24
	salq	$5, %r10
	leaq	8(%rdi,%rax,8), %rbx
	andl	$-4, %r9d
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L84:
	movq	(%rdi), %rcx
	cmpl	$2, %r11d
	jbe	.L86
	movq	%rcx, %rax
	leaq	(%rcx,%r10), %rdx
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align 4,,10
	.p2align 3
.L82:
	vmovupd	(%rax), %ymm0
	addq	$32, %rax
	vmulpd	%ymm0, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm1, %ymm1
	cmpq	%rdx, %rax
	jne	.L82
	vextractf128	$0x1, %ymm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	movl	%r9d, %eax
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpl	%esi, %r9d
	je	.L81
.L85:
	movslq	%eax, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm0
	leaq	0(,%rdx,8), %r8
	vmulsd	%xmm0, %xmm0, %xmm0
	leal	1(%rax), %edx
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%edx, %esi
	jle	.L81
	vmovsd	8(%rcx,%r8), %xmm0
	addl	$2, %eax
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%eax, %esi
	jle	.L81
	vmovsd	16(%rcx,%r8), %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
.L81:
	addq	$8, %rdi
	cmpq	%rbx, %rdi
	jne	.L84
	vsqrtsd	%xmm2, %xmm2, %xmm0
	vzeroupper
	popq	%rbx
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L86:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L85
.L94:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	vxorpd	%xmm0, %xmm0, %xmm0
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
	vmovsd	(%rax), %xmm0
	testl	%esi, %esi
	jle	.L108
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %r10d
	leal	-1(%rsi), %eax
	shrl	$2, %r10d
	movl	%esi, %r9d
	vmovapd	.LC13(%rip), %ymm2
	vmovq	.LC12(%rip), %xmm3
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rax, %r11
	pushq	%rbx
	.cfi_offset 3, -24
	salq	$5, %r10
	leaq	8(%rdi,%rax,8), %rbx
	andl	$-4, %r9d
	.p2align 4,,10
	.p2align 3
.L97:
	movq	(%rdi), %rcx
	cmpl	$2, %r11d
	jbe	.L102
	vbroadcastsd	%xmm0, %ymm0
	movq	%rcx, %rax
	leaq	(%rcx,%r10), %rdx
	.p2align 4,,10
	.p2align 3
.L99:
	vandpd	(%rax), %ymm2, %ymm1
	addq	$32, %rax
	vmaxpd	%ymm1, %ymm0, %ymm0
	cmpq	%rdx, %rax
	jne	.L99
	vextractf128	$0x1, %ymm0, %xmm1
	vmaxpd	%xmm0, %xmm1, %xmm1
	movl	%r9d, %eax
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vmaxpd	%xmm1, %xmm0, %xmm0
	cmpl	%esi, %r9d
	je	.L98
.L101:
	movslq	%eax, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leaq	0(,%rdx,8), %r8
	vandpd	%xmm3, %xmm1, %xmm1
	leal	1(%rax), %edx
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L98
	vmovsd	8(%rcx,%r8), %xmm1
	addl	$2, %eax
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L98
	vmovsd	16(%rcx,%r8), %xmm1
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
.L98:
	addq	$8, %rdi
	cmpq	%rbx, %rdi
	jne	.L97
	vzeroupper
	popq	%rbx
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L102:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L101
.L108:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
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
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	%rdx, -24(%rsp)
	movl	%eax, -40(%rsp)
	cmpl	$1, %eax
	jle	.L128
	leal	-3(%rcx), %eax
	movl	%eax, -28(%rsp)
	addq	$2, %rax
	movq	%rax, (%rsp)
	leal	-2(%rcx), %eax
	movl	%eax, %r11d
	movl	%eax, -32(%rsp)
	andl	$-4, %eax
	leal	1(%rax), %r13d
	movslq	%r13d, %r13
	leal	2(%rax), %edx
	salq	$3, %r13
	leaq	-8(%r13), %rcx
	movl	%eax, -36(%rsp)
	movslq	%edx, %r14
	addl	$3, %eax
	salq	$3, %r14
	movq	%rcx, -48(%rsp)
	movl	%eax, -64(%rsp)
	leaq	8(%r13), %rcx
	cltq
	salq	$3, %rax
	movq	%rcx, -56(%rsp)
	leaq	-8(%r14), %rcx
	leaq	-8(%rax), %rdi
	movq	%rcx, -72(%rsp)
	movq	%rax, -104(%rsp)
	leaq	8(%r14), %rcx
	addq	$8, %rax
	vmovsd	.LC15(%rip), %xmm3
	shrl	$2, %r11d
	movl	%edx, -60(%rsp)
	movq	%rcx, -80(%rsp)
	movq	%rdi, -96(%rsp)
	movq	%rax, -88(%rsp)
	salq	$5, %r11
	vmovapd	.LC14(%rip), %ymm2
	addq	$8, %r11
	movl	$1, %r8d
	vmovapd	%xmm3, %xmm4
	.p2align 4,,10
	.p2align 3
.L117:
	movq	-24(%rsp), %rsi
	movq	-8(%rsp), %rbx
	movq	(%rsi,%r8,8), %rdi
	movq	-16(%rsp), %rsi
	movq	-8(%rbx,%r8,8), %rdx
	movq	(%rsi,%r8,8), %rsi
	leaq	8(%rdx), %r9
	leaq	40(%rsi), %r12
	movq	(%rbx,%r8,8), %rax
	movq	8(%rbx,%r8,8), %rcx
	cmpq	%r9, %r12
	leaq	8(%rsi), %rbx
	leaq	40(%rdx), %r9
	setbe	%r15b
	cmpq	%r9, %rbx
	setnb	%r9b
	orl	%r9d, %r15d
	leaq	48(%rax), %r9
	cmpq	%r9, %rbx
	setnb	%r10b
	cmpq	%r12, %rax
	setnb	%r9b
	orl	%r10d, %r9d
	andl	%r15d, %r9d
	cmpl	$2, -28(%rsp)
	seta	%r10b
	andl	%r10d, %r9d
	leaq	8(%rcx), %r10
	cmpq	%r10, %r12
	leaq	40(%rcx), %r15
	setbe	%r10b
	cmpq	%r15, %rbx
	setnb	%r15b
	orl	%r15d, %r10d
	testb	%r10b, %r9b
	je	.L118
	leaq	8(%rdi), %r9
	cmpq	%r9, %r12
	leaq	40(%rdi), %r10
	setbe	%r9b
	cmpq	%r10, %rbx
	setnb	%r10b
	orb	%r10b, %r9b
	je	.L118
	movl	$8, %r9d
	.p2align 4,,10
	.p2align 3
.L114:
	vmulpd	(%rax,%r9), %ymm2, %ymm0
	vmovupd	(%rcx,%r9), %ymm5
	vmovupd	-8(%rax,%r9), %ymm6
	vaddpd	(%rdi,%r9), %ymm5, %ymm1
	vsubpd	(%rdx,%r9), %ymm0, %ymm0
	vsubpd	%ymm1, %ymm0, %ymm0
	vaddpd	8(%rax,%r9), %ymm6, %ymm1
	vsubpd	%ymm1, %ymm0, %ymm0
	vmovupd	%ymm0, (%rsi,%r9)
	addq	$32, %r9
	cmpq	%r11, %r9
	jne	.L114
	movl	-36(%rsp), %r15d
	cmpl	%r15d, -32(%rsp)
	je	.L116
	vmulsd	(%rax,%r13), %xmm4, %xmm0
	vmovsd	(%rdi,%r13), %xmm1
	movq	-48(%rsp), %rbx
	vaddsd	(%rcx,%r13), %xmm1, %xmm1
	movl	-60(%rsp), %r15d
	vsubsd	(%rdx,%r13), %xmm0, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	(%rax,%rbx), %xmm1
	movq	-56(%rsp), %rbx
	vaddsd	(%rax,%rbx), %xmm1, %xmm1
	movl	-40(%rsp), %ebx
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%r13)
	cmpl	%r15d, %ebx
	jle	.L116
	vmulsd	(%rax,%r14), %xmm4, %xmm0
	vmovsd	(%rcx,%r14), %xmm1
	movq	-72(%rsp), %r15
	vaddsd	(%rdi,%r14), %xmm1, %xmm1
	vsubsd	(%rdx,%r14), %xmm0, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	(%rax,%r15), %xmm1
	movq	-80(%rsp), %r15
	vaddsd	(%rax,%r15), %xmm1, %xmm1
	movl	-64(%rsp), %r15d
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%r14)
	cmpl	%r15d, %ebx
	jle	.L116
	movq	-104(%rsp), %rbx
	vmulsd	(%rax,%rbx), %xmm4, %xmm0
	vmovsd	(%rdi,%rbx), %xmm1
	vaddsd	(%rcx,%rbx), %xmm1, %xmm1
	movq	-88(%rsp), %rcx
	vsubsd	(%rdx,%rbx), %xmm0, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	(%rax,%rcx), %xmm1
	movq	-96(%rsp), %rcx
	vaddsd	(%rax,%rcx), %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%rbx)
.L116:
	incq	%r8
	cmpq	(%rsp), %r8
	jne	.L117
	vzeroupper
.L128:
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
.L118:
	.cfi_restore_state
	movq	(%rsp), %r10
	movl	$1, %r9d
	.p2align 4,,10
	.p2align 3
.L113:
	vmulsd	(%rax,%r9,8), %xmm3, %xmm0
	vmovsd	(%rdi,%r9,8), %xmm1
	vaddsd	(%rcx,%r9,8), %xmm1, %xmm1
	vsubsd	(%rdx,%r9,8), %xmm0, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	8(%rax,%r9,8), %xmm1
	vaddsd	-8(%rax,%r9,8), %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%r9,8)
	incq	%r9
	cmpq	%r10, %r9
	jne	.L113
	jmp	.L116
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
	jle	.L136
	leal	-3(%rdx), %ecx
	vmovsd	.LC16(%rip), %xmm3
	addq	$2, %rcx
	movl	$1, %r11d
	.p2align 4,,10
	.p2align 3
.L133:
	movq	(%rdi,%r11,8), %rdx
	movq	-8(%rdi,%r11,8), %r10
	movq	8(%rdi,%r11,8), %r9
	movq	(%rsi,%r11,8), %r8
	vmovsd	(%rdx), %xmm1
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L132:
	vmovsd	(%r10,%rax,8), %xmm0
	vmovsd	8(%rdx,%rax,8), %xmm2
	vaddsd	(%r9,%rax,8), %xmm0, %xmm0
	vaddsd	(%r8,%rax,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm1
	vmulsd	%xmm3, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rax,8)
	incq	%rax
	cmpq	%rax, %rcx
	jne	.L132
	incq	%r11
	cmpq	%r11, %rcx
	jne	.L133
.L136:
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
	jle	.L141
	movslq	%esi, %rax
	salq	$3, %rax
	movq	(%rdi), %r10
	movq	-8(%rdi,%rax), %r8
	leaq	-8(%rax), %r9
	leal	-1(%rsi), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L139:
	movq	(%rdi,%rax,8), %rdx
	movq	$0x000000000, (%r10,%rax,8)
	movq	$0x000000000, (%r8,%rax,8)
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	movq	%rax, %rdx
	incq	%rax
	cmpq	%rdx, %rcx
	jne	.L139
.L141:
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
	jle	.L162
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
	vmovsd	.LC15(%rip), %xmm2
	vmovapd	.LC14(%rip), %ymm1
	movq	%r9, -56(%rsp)
	movq	%r13, %r12
	salq	$3, %rsi
	salq	$5, %r8
	salq	$3, %r14
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L144:
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
	je	.L150
	xorl	%r10d, %r10d
	cmpl	$3, %r12d
	jbe	.L150
	.p2align 4,,10
	.p2align 3
.L147:
	vmovupd	(%rax,%r10,2), %ymm3
	vunpcklpd	32(%rax,%r10,2), %ymm3, %ymm0
	vpermpd	$216, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vmovupd	%ymm0, (%rcx,%r10)
	addq	$32, %r10
	cmpq	%r8, %r10
	jne	.L147
	vmulsd	(%rax,%r14), %xmm2, %xmm0
	movq	-8(%rsp), %r11
	vmovsd	%xmm0, (%rcx,%r11)
	cmpl	-12(%rsp), %edx
	jle	.L145
	movq	-24(%rsp), %r11
	vmulsd	(%rax,%r11), %xmm2, %xmm0
	movq	-32(%rsp), %r11
	vmovsd	%xmm0, (%rcx,%r11)
	cmpl	-16(%rsp), %edx
	jle	.L145
	movq	-48(%rsp), %r11
	vmulsd	(%rax,%r11), %xmm2, %xmm0
	movq	-56(%rsp), %r11
	vmovsd	%xmm0, (%rcx,%r11)
	cmpl	-36(%rsp), %edx
	jle	.L145
	movq	-64(%rsp), %r11
	vmulsd	(%rax,%r11), %xmm2, %xmm0
	movq	-72(%rsp), %rax
	vmovsd	%xmm0, (%rcx,%rax)
.L145:
	leaq	1(%r9), %rax
	cmpq	%r13, %r9
	je	.L159
.L165:
	movq	%rax, %r9
	jmp	.L144
	.p2align 4,,10
	.p2align 3
.L150:
	movq	-80(%rsp), %r11
	leaq	(%rax,%r11), %r10
	.p2align 4,,10
	.p2align 3
.L146:
	vmulsd	(%rax), %xmm2, %xmm0
	addq	$16, %rax
	addq	$8, %rcx
	vmovsd	%xmm0, -8(%rcx)
	cmpq	%r10, %rax
	jne	.L146
	leaq	1(%r9), %rax
	cmpq	%r13, %r9
	jne	.L165
.L159:
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
.L162:
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
	jle	.L167
	leal	-1(%rdx), %eax
	movq	%rdi, %r14
	leaq	8(%rdi,%rax,8), %r15
	leaq	8(,%rax,8), %r13
	.p2align 4,,10
	.p2align 3
.L168:
	movq	(%r14), %rdi
	movq	%r13, %rdx
	xorl	%esi, %esi
	addq	$8, %r14
	call	memset@PLT
	cmpq	%r15, %r14
	jne	.L168
.L167:
	movl	152(%rsp), %eax
	leal	-1(%rax), %esi
	movl	%esi, 144(%rsp)
	testl	%esi, %esi
	jle	.L186
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
	vmovsd	.LC19(%rip), %xmm5
	vmovsd	.LC16(%rip), %xmm7
	movq	%rcx, 40(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rax, 16(%rsp)
	shrl	$2, %r9d
	vmovapd	.LC17(%rip), %ymm3
	vmovapd	.LC18(%rip), %ymm4
	salq	$5, %r9
	xorl	%r8d, %r8d
	vmovapd	%xmm5, %xmm6
	vmovapd	%xmm7, %xmm8
	.p2align 4,,10
	.p2align 3
.L174:
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
	je	.L175
	leaq	63(%rdx), %rdi
	subq	%rcx, %rdi
	cmpq	$126, %rdi
	jbe	.L175
	movq	%rsi, %r10
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L171:
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
	vmovupd	(%rax,%rdi), %ymm2
	vaddpd	8(%rax,%rdi), %ymm2, %ymm0
	vmovupd	-32(%r10), %ymm2
	vaddpd	-24(%r10), %ymm2, %ymm2
	vaddpd	%ymm2, %ymm0, %ymm0
	vpermpd	$68, %ymm1, %ymm2
	vpermpd	$238, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm0, %ymm0
	vpermpd	$68, %ymm0, %ymm9
	vpermpd	$238, %ymm0, %ymm0
	vshufpd	$12, %ymm9, %ymm2, %ymm2
	vshufpd	$12, %ymm0, %ymm1, %ymm0
	vmovupd	%ymm2, (%rcx,%rdi,2)
	vmovupd	%ymm0, 32(%rcx,%rdi,2)
	addq	$32, %rdi
	cmpq	%rdi, %r9
	jne	.L171
	movl	144(%rsp), %r15d
	movl	124(%rsp), %edi
	cmpl	%edi, %r15d
	je	.L173
	movq	112(%rsp), %r14
	movq	104(%rsp), %r10
	leaq	(%rsi,%r14), %rdi
	vmovsd	(%rdi), %xmm0
	leaq	(%rax,%r14), %r11
	vmovsd	%xmm0, (%rdx,%r10)
	vaddsd	(%r11), %xmm0, %xmm0
	movq	96(%rsp), %r14
	movq	88(%rsp), %r13
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r10)
	vmovsd	(%rdi), %xmm0
	leaq	(%rsi,%r14), %r10
	vaddsd	(%r10), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r13)
	vmovsd	(%rdi), %xmm1
	vmovsd	(%rax,%r14), %xmm0
	vaddsd	(%r10), %xmm1, %xmm1
	vaddsd	(%r11), %xmm0, %xmm0
	movl	120(%rsp), %edi
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r13)
	cmpl	%edi, %r15d
	jle	.L173
	movq	80(%rsp), %r11
	movq	72(%rsp), %r14
	leaq	(%rsi,%r11), %rdi
	vmovsd	(%rdi), %xmm0
	addq	%rax, %r11
	vmovsd	%xmm0, (%rdx,%r14)
	vaddsd	(%r11), %xmm0, %xmm0
	movq	56(%rsp), %r13
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r14)
	movq	64(%rsp), %r14
	vmovsd	(%rdi), %xmm0
	leaq	(%rsi,%r14), %r10
	vaddsd	(%r10), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r13)
	vmovsd	(%rdi), %xmm1
	vmovsd	(%rax,%r14), %xmm0
	vaddsd	(%r10), %xmm1, %xmm1
	vaddsd	(%r11), %xmm0, %xmm0
	movl	52(%rsp), %edi
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r13)
	cmpl	%edi, %r15d
	jle	.L173
	movq	40(%rsp), %r15
	movq	32(%rsp), %r11
	leaq	(%rsi,%r15), %rdi
	vmovsd	(%rdi), %xmm0
	leaq	(%rax,%r15), %r10
	vmovsd	%xmm0, (%rdx,%r11)
	vaddsd	(%r10), %xmm0, %xmm0
	movq	24(%rsp), %r15
	vmulsd	%xmm6, %xmm0, %xmm0
	addq	%r15, %rsi
	vmovsd	%xmm0, (%rcx,%r11)
	vmovsd	(%rdi), %xmm0
	movq	16(%rsp), %r11
	vaddsd	(%rsi), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r11)
	vmovsd	(%rax,%r15), %xmm0
	vmovsd	(%rdi), %xmm1
	vaddsd	(%r10), %xmm0, %xmm0
	vaddsd	(%rsi), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r11)
.L173:
	addq	$8, %r8
	cmpq	152(%rsp), %r8
	jne	.L174
	vzeroupper
.L186:
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
.L175:
	.cfi_restore_state
	movq	152(%rsp), %r10
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L170:
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
	vmovsd	(%rax,%rdi), %xmm1
	vaddsd	8(%rsi,%rdi), %xmm0, %xmm0
	vaddsd	8(%rax,%rdi), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rcx,%rdi,2)
	addq	$8, %rdi
	cmpq	%rdi, %r10
	jne	.L170
	jmp	.L173
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
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rsi, %r12
	pushq	%rbx
	subq	$360, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%rdx, -160(%rbp)
	vmovsd	%xmm0, -216(%rbp)
	vmovsd	%xmm1, -264(%rbp)
	testl	%edi, %edi
	jle	.L230
	leal	-1(%rdi), %eax
	movl	%eax, -168(%rbp)
	cmpl	$13, %eax
	jbe	.L231
	movl	%edi, %edx
	vmovdqa	.LC2(%rip), %ymm0
	shrl	$3, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L191:
	incl	%eax
	vpslld	$1, %ymm0, %ymm0
	cmpl	%eax, %edx
	jne	.L191
	vmovdqa	%xmm0, %xmm1
	vextracti128	$0x1, %ymm0, %xmm0
	vpmulld	%xmm0, %xmm1, %xmm0
	movl	%edi, %edx
	andl	$-8, %edx
	leal	1(%rdx), %eax
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %r13d
	cmpl	%edx, %edi
	je	.L192
.L190:
	leal	1(%rax), %edx
	leal	(%r13,%r13), %ecx
	cmpl	%edx, %edi
	jl	.L241
	leal	2(%rax), %edx
	leal	0(,%r13,4), %ecx
	cmpl	%edx, %edi
	jl	.L241
	leal	3(%rax), %edx
	leal	0(,%r13,8), %ecx
	cmpl	%edx, %edi
	jl	.L241
	movl	%r13d, %ecx
	leal	4(%rax), %edx
	sall	$4, %ecx
	cmpl	%edx, %edi
	jl	.L241
	movl	%r13d, %ecx
	leal	5(%rax), %edx
	sall	$5, %ecx
	cmpl	%edx, %edi
	jl	.L241
	movl	%r13d, %ecx
	leal	6(%rax), %edx
	sall	$6, %ecx
	cmpl	%edx, %edi
	jl	.L241
	movl	%r13d, %ecx
	leal	7(%rax), %edx
	sall	$7, %ecx
	cmpl	%edx, %edi
	jl	.L241
	movl	%r13d, %ecx
	leal	8(%rax), %edx
	sall	$8, %ecx
	cmpl	%edx, %edi
	jl	.L241
	movl	%r13d, %ecx
	leal	9(%rax), %edx
	sall	$9, %ecx
	cmpl	%edx, %edi
	jl	.L241
	movl	%r13d, %ecx
	leal	10(%rax), %edx
	sall	$10, %ecx
	cmpl	%edx, %edi
	jl	.L241
	movl	%r13d, %edx
	leal	11(%rax), %ecx
	sall	$11, %edx
	cmpl	%ecx, %edi
	jl	.L243
	movl	%r13d, %edx
	leal	12(%rax), %ecx
	sall	$12, %edx
	cmpl	%ecx, %edi
	jl	.L243
	movl	%r13d, %edx
	movl	%r13d, %r8d
	addl	$13, %eax
	sall	$13, %edx
	sall	$14, %r8d
	cmpl	%eax, %edi
	cmovge	%r8d, %edx
	movl	%edx, %r13d
	jmp	.L192
.L241:
	movl	%ecx, %r13d
.L192:
	leal	1(%r13), %eax
	movl	%eax, -164(%rbp)
	movl	%eax, -64(%rbp)
	cmpl	$1, %edi
	jle	.L292
	leal	-2(%rdi), %eax
	cmpl	$13, %eax
	jbe	.L245
	movl	-168(%rbp), %edx
	vmovdqa	.LC2(%rip), %ymm0
	shrl	$3, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L194:
	incl	%eax
	vpslld	$1, %ymm0, %ymm0
	cmpl	%eax, %edx
	jne	.L194
	vmovdqa	%xmm0, %xmm1
	vextracti128	$0x1, %ymm0, %xmm0
	vpmulld	%xmm0, %xmm1, %xmm0
	movl	-168(%rbp), %ecx
	movl	%ecx, %edx
	andl	$-8, %edx
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	leal	1(%rdx), %eax
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %ebx
	cmpl	%ecx, %edx
	je	.L195
.L193:
	leal	1(%rax), %edx
	leal	(%rbx,%rbx), %ecx
	cmpl	%edx, %edi
	jle	.L255
	leal	2(%rax), %edx
	leal	0(,%rbx,4), %ecx
	cmpl	%edx, %edi
	jle	.L255
	leal	3(%rax), %edx
	leal	0(,%rbx,8), %ecx
	cmpl	%edx, %edi
	jle	.L255
	movl	%ebx, %ecx
	leal	4(%rax), %edx
	sall	$4, %ecx
	cmpl	%edx, %edi
	jle	.L255
	movl	%ebx, %ecx
	leal	5(%rax), %edx
	sall	$5, %ecx
	cmpl	%edx, %edi
	jle	.L255
	movl	%ebx, %ecx
	leal	6(%rax), %edx
	sall	$6, %ecx
	cmpl	%edx, %edi
	jle	.L255
	movl	%ebx, %ecx
	leal	7(%rax), %edx
	sall	$7, %ecx
	cmpl	%edx, %edi
	jle	.L255
	movl	%ebx, %ecx
	leal	8(%rax), %edx
	sall	$8, %ecx
	cmpl	%edx, %edi
	jle	.L255
	movl	%ebx, %ecx
	leal	9(%rax), %edx
	sall	$9, %ecx
	cmpl	%edx, %edi
	jle	.L255
	movl	%ebx, %ecx
	leal	10(%rax), %edx
	sall	$10, %ecx
	cmpl	%edx, %edi
	jle	.L255
	movl	%ebx, %edx
	leal	11(%rax), %ecx
	sall	$11, %edx
	cmpl	%ecx, %edi
	jle	.L257
	movl	%ebx, %edx
	leal	12(%rax), %ecx
	sall	$12, %edx
	cmpl	%ecx, %edi
	jle	.L257
	movl	%ebx, %edx
	addl	$13, %eax
	sall	$13, %edx
	sall	$14, %ebx
	cmpl	%eax, %edi
	cmovle	%edx, %ebx
	jmp	.L195
.L255:
	movl	%ecx, %ebx
.L195:
	incl	%ebx
	vzeroupper
.L196:
	movslq	-64(%rbp), %r15
	leaq	0(,%r15,8), %rax
	movq	%rax, %rdi
	movq	%rax, -72(%rbp)
	call	malloc@PLT
	movslq	%r13d, %r10
	leaq	1(%r10), %rdi
	movq	%rdi, -200(%rbp)
	salq	$3, %rdi
	movq	%rdi, -88(%rbp)
	addq	%rax, %rdi
	movq	%rax, -152(%rbp)
	movq	%rax, -376(%rbp)
	movq	%rdi, -272(%rbp)
	movl	%ebx, -56(%rbp)
	movq	%rdi, %r14
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L198:
	movl	$8, %esi
	movq	%r15, %rdi
	call	calloc@PLT
	movq	%rax, (%rbx)
	addq	$8, %rbx
	cmpq	%r14, %rbx
	jne	.L198
	movslq	-56(%rbp), %r14
	leaq	0(,%r14,8), %rax
	movq	%rax, %rdi
	movq	%rax, -56(%rbp)
	call	malloc@PLT
	leal	-1(%r14), %edi
	leaq	1(%rdi), %rcx
	movl	%edi, -60(%rbp)
	movq	%rdi, -328(%rbp)
	leaq	0(,%rcx,8), %rdi
	movq	%rdi, -80(%rbp)
	addq	%rax, %rdi
	movq	%rax, -192(%rbp)
	movq	%rax, -360(%rbp)
	movq	%rcx, -144(%rbp)
	movq	%rdi, -400(%rbp)
	movl	%r14d, -96(%rbp)
	movq	%r12, -104(%rbp)
	movq	%rdi, %rbx
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L199:
	movl	$8, %esi
	movq	%r14, %rdi
	call	calloc@PLT
	movq	%rax, (%r12)
	addq	$8, %r12
	cmpq	%rbx, %r12
	jne	.L199
	movq	-72(%rbp), %rdi
	movl	-96(%rbp), %ebx
	movq	-104(%rbp), %r12
	call	malloc@PLT
	movq	-88(%rbp), %rdi
	movq	%rax, -184(%rbp)
	addq	%rax, %rdi
	movq	%rax, -352(%rbp)
	movq	%rdi, -392(%rbp)
	movl	%ebx, -72(%rbp)
	movq	%r12, -88(%rbp)
	movq	%rdi, %rbx
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L200:
	movl	$8, %esi
	movq	%r15, %rdi
	call	calloc@PLT
	movq	%rax, (%r12)
	addq	$8, %r12
	cmpq	%rbx, %r12
	jne	.L200
	movq	-56(%rbp), %rdi
	movl	-72(%rbp), %ebx
	movq	-88(%rbp), %r12
	call	malloc@PLT
	movq	-80(%rbp), %rdi
	movq	%rax, -176(%rbp)
	addq	%rax, %rdi
	movq	%rax, -368(%rbp)
	movq	%rdi, -384(%rbp)
	movl	%ebx, -56(%rbp)
	movq	%rdi, %r15
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L201:
	movl	$8, %esi
	movq	%r14, %rdi
	call	calloc@PLT
	movq	%rax, (%rbx)
	addq	$8, %rbx
	cmpq	%r15, %rbx
	jne	.L201
	movq	%r14, %rax
	salq	$4, %rax
	subq	$8, %rax
	movq	%rax, -288(%rbp)
	leaq	0(,%r14,8), %rax
	movq	%rax, -320(%rbp)
	movl	-60(%rbp), %eax
	movl	-56(%rbp), %ebx
	movl	%eax, %r15d
	andl	$-4, %eax
	movl	%eax, %edx
	leal	(%rax,%rax), %eax
	movslq	%eax, %rcx
	leaq	0(,%rcx,8), %rdi
	movl	%edx, %ecx
	movq	%rdi, -312(%rbp)
	leaq	0(,%rcx,8), %rdi
	leal	2(%rax), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	movq	%rdi, -304(%rbp)
	leal	1(%rdx), %edi
	movq	%rcx, -80(%rbp)
	movl	%edi, %ecx
	movl	%edi, -72(%rbp)
	leaq	0(,%rcx,8), %rdi
	leal	4(%rax), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	movq	%rdi, -96(%rbp)
	addl	$6, %eax
	leal	2(%rdx), %edi
	movq	%rcx, -112(%rbp)
	cltq
	movl	%edi, %ecx
	salq	$3, %rax
	movl	%edi, -88(%rbp)
	leaq	0(,%rcx,8), %rdi
	leal	3(%rdx), %ecx
	movq	%rax, -136(%rbp)
	movl	%ecx, %eax
	salq	$3, %rax
	movq	%rax, -128(%rbp)
	movl	-164(%rbp), %eax
	movq	-200(%rbp), %r10
	movl	%eax, %r14d
	andl	$-4, %eax
	movl	%eax, %r9d
	cltq
	leaq	0(,%rax,8), %r11
	movq	%rax, -336(%rbp)
	leal	1(%r9), %eax
	movl	%eax, -56(%rbp)
	cltq
	leaq	0(,%rax,8), %r8
	leal	2(%r9), %eax
	cltq
	salq	$3, %rax
	movq	%rax, -296(%rbp)
	movq	-144(%rbp), %rax
	vmovsd	.LC20(%rip), %xmm0
	salq	$4, %rax
	movq	%rdi, -120(%rbp)
	movl	%ecx, -104(%rbp)
	movq	%rax, -256(%rbp)
	movq	%r11, -208(%rbp)
	movq	%r8, -344(%rbp)
	shrl	$2, %r15d
	salq	$3, %r10
	shrl	$2, %r14d
	movl	%ebx, -200(%rbp)
	movq	%r12, -144(%rbp)
	vdivsd	-264(%rbp), %xmm0, %xmm7
	salq	$5, %r15
	vmovsd	%xmm7, -280(%rbp)
	salq	$5, %r14
	movl	%r9d, %ebx
	movq	%r10, %r12
.L224:
	movq	-160(%rbp), %rsi
	movl	-64(%rbp), %edx
	movq	-144(%rbp), %rdi
	call	GS_update
	movq	%rsi, %rdx
	movl	-64(%rbp), %ecx
	movq	-152(%rbp), %rsi
	call	L_def
	movq	.LC15(%rip), %rax
	movl	%ebx, -224(%rbp)
	movl	%r13d, -228(%rbp)
	movq	%r14, -240(%rbp)
	movq	%r12, -248(%rbp)
	movl	-200(%rbp), %r8d
	movq	-288(%rbp), %r11
	movq	-192(%rbp), %rbx
	movq	-312(%rbp), %r10
	movq	-152(%rbp), %r13
	movq	-320(%rbp), %r14
	movq	-304(%rbp), %r12
	movq	-328(%rbp), %r9
	vmovapd	.LC14(%rip), %ymm3
	xorl	%ecx, %ecx
	vmovq	%rax, %xmm4
	.p2align 4,,10
	.p2align 3
.L202:
	movq	%rcx, %rax
	salq	$4, %rax
	movq	0(%r13,%rax), %rax
	movq	(%rbx,%rcx,8), %rdx
	leaq	(%rax,%r11), %rsi
	cmpq	%rsi, %rdx
	leaq	(%rdx,%r14), %rsi
	setnb	%dil
	cmpq	%rsi, %rax
	setnb	%sil
	orb	%sil, %dil
	je	.L209
	xorl	%esi, %esi
	cmpl	$3, -60(%rbp)
	jbe	.L209
	.p2align 4,,10
	.p2align 3
.L205:
	vmovupd	(%rax,%rsi,2), %ymm5
	vunpcklpd	32(%rax,%rsi,2), %ymm5, %ymm0
	vpermpd	$216, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm0
	vmovupd	%ymm0, (%rdx,%rsi)
	addq	$32, %rsi
	cmpq	%r15, %rsi
	jne	.L205
	vmulsd	(%rax,%r10), %xmm4, %xmm0
	vmovsd	%xmm0, (%rdx,%r12)
	cmpl	-72(%rbp), %r8d
	jle	.L203
	movq	-80(%rbp), %rdi
	vmulsd	(%rax,%rdi), %xmm4, %xmm0
	movq	-96(%rbp), %rdi
	vmovsd	%xmm0, (%rdx,%rdi)
	cmpl	-88(%rbp), %r8d
	jle	.L203
	movq	-112(%rbp), %rdi
	vmulsd	(%rax,%rdi), %xmm4, %xmm0
	movq	-120(%rbp), %rdi
	vmovsd	%xmm0, (%rdx,%rdi)
	cmpl	-104(%rbp), %r8d
	jle	.L203
	movq	-136(%rbp), %rdi
	vmulsd	(%rax,%rdi), %xmm4, %xmm0
	movq	-128(%rbp), %rax
	vmovsd	%xmm0, (%rdx,%rax)
.L203:
	leaq	1(%rcx), %rax
	cmpq	%r9, %rcx
	je	.L207
.L296:
	movq	%rax, %rcx
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L209:
	movq	-256(%rbp), %rdi
	leaq	(%rax,%rdi), %rsi
	.p2align 4,,10
	.p2align 3
.L204:
	vmulsd	(%rax), %xmm4, %xmm0
	addq	$16, %rax
	addq	$8, %rdx
	vmovsd	%xmm0, -8(%rdx)
	cmpq	%rsi, %rax
	jne	.L204
	leaq	1(%rcx), %rax
	cmpq	%r9, %rcx
	jne	.L296
	.p2align 4,,10
	.p2align 3
.L207:
	movl	-224(%rbp), %ebx
	movl	-228(%rbp), %r13d
	movq	-240(%rbp), %r14
	movq	-248(%rbp), %r12
	vmovsd	-264(%rbp), %xmm1
	vmovsd	-216(%rbp), %xmm0
	movq	-192(%rbp), %rdx
	movq	-176(%rbp), %rsi
	movl	-168(%rbp), %edi
	vzeroupper
	call	multigrid_vcycle
	movq	-176(%rbp), %rsi
	movq	-184(%rbp), %rdi
	movl	-200(%rbp), %ecx
	movl	-64(%rbp), %edx
	call	prol_P
	movq	%r15, -224(%rbp)
	movq	-184(%rbp), %r8
	movq	-208(%rbp), %r11
	movq	-344(%rbp), %rdi
	movq	-296(%rbp), %r15
	movq	-144(%rbp), %r10
	movl	-164(%rbp), %r9d
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L210:
	movq	(%r10,%rsi), %rdx
	movq	(%r8,%rsi), %rcx
	leaq	31(%rdx), %rax
	subq	%rcx, %rax
	cmpq	$62, %rax
	jbe	.L262
	xorl	%eax, %eax
	cmpl	$2, %r13d
	jbe	.L262
	.p2align 4,,10
	.p2align 3
.L214:
	vmovupd	(%rdx,%rax), %ymm6
	vsubpd	(%rcx,%rax), %ymm6, %ymm0
	vmovupd	%ymm0, (%rdx,%rax)
	addq	$32, %rax
	cmpq	%r14, %rax
	jne	.L214
	cmpl	%r9d, %ebx
	je	.L213
	leaq	(%rdx,%r11), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rcx,%r11), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	cmpl	%r13d, %ebx
	jge	.L213
	leaq	(%rdx,%rdi), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rcx,%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	cmpl	%r13d, -56(%rbp)
	jge	.L213
	addq	%r15, %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rcx,%r15), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
.L213:
	addq	$8, %rsi
	cmpq	%r12, %rsi
	jne	.L210
	movq	-224(%rbp), %r15
	movl	-64(%rbp), %edx
	movq	-160(%rbp), %rsi
	movq	-144(%rbp), %rdi
	vzeroupper
	call	GS_update
	movq	-336(%rbp), %rax
	movq	-152(%rbp), %rsi
	movq	-272(%rbp), %r8
	movl	-164(%rbp), %r9d
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	0(,%rax,8), %rdi
	.p2align 4,,10
	.p2align 3
.L218:
	movq	(%rsi), %rcx
	cmpl	$2, %r13d
	jle	.L223
	movq	%rcx, %rax
	leaq	(%rcx,%r14), %rdx
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align 4,,10
	.p2align 3
.L220:
	vmovupd	(%rax), %ymm0
	addq	$32, %rax
	vmulpd	%ymm0, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm1, %ymm1
	cmpq	%rdx, %rax
	jne	.L220
	vextractf128	$0x1, %ymm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpl	%r9d, %ebx
	je	.L219
	vmovsd	(%rcx,%rdi), %xmm0
	movl	-56(%rbp), %edx
	vmulsd	%xmm0, %xmm0, %xmm0
	movq	%rdi, %rax
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r13d, %ebx
	jge	.L219
.L229:
	vmovsd	8(%rcx,%rax), %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r13d, %edx
	jge	.L219
	vmovsd	16(%rcx,%rax), %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
.L219:
	addq	$8, %rsi
	cmpq	%r8, %rsi
	jne	.L218
	vsqrtsd	%xmm2, %xmm2, %xmm0
	vmulsd	-280(%rbp), %xmm0, %xmm0
	vcomisd	.LC21(%rip), %xmm0
	jbe	.L297
	vzeroupper
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L262:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L212:
	vmovsd	(%rdx,%rax), %xmm0
	vsubsd	(%rcx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%r12, %rax
	jne	.L212
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L223:
	vmovsd	(%rcx), %xmm0
	xorl	%eax, %eax
	vmulsd	%xmm0, %xmm0, %xmm0
	movl	$1, %edx
	vaddsd	%xmm0, %xmm2, %xmm2
	jmp	.L229
.L297:
	movq	-376(%rbp), %rbx
	movq	-272(%rbp), %r12
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L225:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L225
	movq	-152(%rbp), %rdi
	call	free@PLT
	movq	-360(%rbp), %rbx
	movq	-400(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L226:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L226
	movq	-192(%rbp), %rdi
	call	free@PLT
	movq	-352(%rbp), %rbx
	movq	-392(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L227:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L227
	movq	-184(%rbp), %rdi
	call	free@PLT
	movq	-368(%rbp), %rbx
	movq	-384(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L228:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L228
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
.L243:
	.cfi_restore_state
	movl	%edx, %r13d
	jmp	.L192
.L257:
	movl	%edx, %ebx
	jmp	.L195
.L230:
	movl	$2, -64(%rbp)
	movl	$1, %r13d
.L189:
	cmpl	$1, %edi
	jne	.L259
	vmovsd	-216(%rbp), %xmm7
	movq	-160(%rbp), %rbx
	vmulsd	%xmm7, %xmm7, %xmm0
	movq	8(%rbx), %rdx
	movq	8(%r12), %rax
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
.L231:
	.cfi_restore_state
	movl	$1, %eax
	movl	$1, %r13d
	jmp	.L190
.L245:
	movl	$1, %ebx
	movl	$1, %eax
	jmp	.L193
.L259:
	leal	-1(%rdi), %eax
	movl	%eax, -168(%rbp)
	leal	1(%r13), %eax
	movl	%eax, -164(%rbp)
	movl	$2, %ebx
	jmp	.L196
.L292:
	vzeroupper
	jmp	.L189
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
	jle	.L320
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
.L300:
	movq	(%r12,%r10,8), %rax
	movq	0(%r13,%r10,8), %rcx
	leaq	31(%rax), %r8
	subq	%rcx, %r8
	cmpq	$62, %r8
	jbe	.L308
	xorl	%r8d, %r8d
	cmpl	$2, -4(%rsp)
	jbe	.L308
	.p2align 4,,10
	.p2align 3
.L304:
	vmovupd	(%rax,%r8), %ymm1
	vsubpd	(%rcx,%r8), %ymm1, %ymm0
	vmovupd	%ymm0, (%rax,%r8)
	addq	$32, %r8
	cmpq	%r9, %r8
	jne	.L304
	cmpl	%edx, %r15d
	je	.L303
	leaq	(%rax,%rdi), %r8
	vmovsd	(%r8), %xmm0
	vsubsd	(%rcx,%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	cmpl	-8(%rsp), %edx
	jle	.L303
	leaq	(%rax,%rbx), %r8
	vmovsd	(%r8), %xmm0
	vsubsd	(%rcx,%rbx), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	cmpl	-12(%rsp), %edx
	jle	.L303
	addq	%r14, %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rcx,%r14), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
.L303:
	leaq	1(%r10), %rax
	cmpq	%rsi, %r10
	je	.L317
.L323:
	movq	%rax, %r10
	jmp	.L300
	.p2align 4,,10
	.p2align 3
.L308:
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L302:
	vmovsd	(%rax,%r8,8), %xmm0
	movq	%r8, %r11
	vsubsd	(%rcx,%r8,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax,%r8,8)
	incq	%r8
	cmpq	%rsi, %r11
	jne	.L302
	leaq	1(%r10), %rax
	cmpq	%rsi, %r10
	jne	.L323
.L317:
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
.L320:
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
	jle	.L330
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
.L326:
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	xorl	%esi, %esi
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r12, %rbx
	jne	.L326
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L330:
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
	jle	.L337
	vmovq	.LC12(%rip), %xmm2
	vmovsd	.LC21(%rip), %xmm1
	leal	-1(%rdx), %r9d
	xorl	%r10d, %r10d
.L335:
	movq	(%rdi,%r10,8), %r8
	movq	(%rsi,%r10,8), %rcx
	xorl	%eax, %eax
	jmp	.L336
	.p2align 4,,10
	.p2align 3
.L343:
	leaq	1(%rax), %rdx
	cmpq	%rax, %r9
	je	.L342
	movq	%rdx, %rax
.L336:
	vmovsd	(%r8,%rax,8), %xmm0
	vsubsd	(%rcx,%rax,8), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L343
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L342:
	leaq	1(%r10), %rax
	cmpq	%r10, %r9
	je	.L340
	movq	%rax, %r10
	jmp	.L335
.L337:
	movl	$1, %eax
	ret
.L340:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE56:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC23:
	.string	"\nResult OK!"
.LC24:
	.string	"\nResult not OK!"
.LC26:
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
	vmovsd	.LC22(%rip), %xmm2
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
	movq	.LC22(%rip), %rax
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
	je	.L345
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
.L346:
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	40(%rsp), %xmm1, %xmm0
	vmovsd	.LC25(%rip), %xmm3
	leaq	.LC26(%rip), %rsi
	movl	$1, %edi
	vmulsd	%xmm3, %xmm0, %xmm2
	vcvtsi2sdq	16(%rsp), %xmm1, %xmm0
	movl	$1, %eax
	vsubsd	%xmm0, %xmm2, %xmm0
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm2
	vcvtsi2sdq	24(%rsp), %xmm1, %xmm1
	vmulsd	%xmm3, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
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
	jne	.L349
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
.L345:
	.cfi_restore_state
	leaq	.LC24(%rip), %rdi
	call	puts@PLT
	jmp	.L346
.L349:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.str1.1
.LC27:
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
	jle	.L357
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
	leaq	.LC27(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.p2align 4,,10
	.p2align 3
.L352:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L353:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L353
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L352
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
.L357:
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
	.align 32
.LC3:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.align 32
.LC6:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.align 32
.LC7:
	.long	1413754136
	.long	1074340347
	.long	1413754136
	.long	1074340347
	.long	1413754136
	.long	1074340347
	.long	1413754136
	.long	1074340347
	.align 32
.LC8:
	.long	3700601565
	.long	1075168253
	.long	3700601565
	.long	1075168253
	.long	3700601565
	.long	1075168253
	.long	3700601565
	.long	1075168253
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
	.long	1413754136
	.long	1074340347
	.align 8
.LC10:
	.long	3700601565
	.long	1075168253
	.align 8
.LC11:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC12:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst32
	.align 32
.LC13:
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.align 32
.LC14:
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
.LC15:
	.long	0
	.long	1074790400
	.align 8
.LC16:
	.long	0
	.long	1070596096
	.section	.rodata.cst32
	.align 32
.LC17:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 32
.LC18:
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
.LC19:
	.long	0
	.long	1071644672
	.align 8
.LC20:
	.long	0
	.long	1072693248
	.align 8
.LC21:
	.long	2296604913
	.long	1055193269
	.align 8
.LC22:
	.long	0
	.long	1063256064
	.align 8
.LC25:
	.long	2696277389
	.long	1051772663
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
