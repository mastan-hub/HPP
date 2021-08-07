	.file	"Multigrid0.c"
	.text
	.globl	l
	.section	.rodata
	.align 4
	.type	l, @object
	.size	l, 4
l:
	.long	9
	.globl	pi
	.align 8
	.type	pi, @object
	.size	pi, 8
pi:
	.long	1413754136
	.long	1074340347
	.globl	epsilon
	.align 8
	.type	epsilon, @object
	.size	epsilon, 8
epsilon:
	.long	2296604913
	.long	1055193269
.LC1:
	.string	"\nResult OK!"
.LC2:
	.string	"\nResult not OK!"
.LC4:
	.string	"time = %lf s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$9, %eax
	movl	%eax, %edi
	call	get_m
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -96(%rbp)
	movsd	.LC0(%rip), %xmm0
	divsd	-96(%rbp), %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	-96(%rbp), %xmm1
	movsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -100(%rbp)
	movl	$1680762733, -15(%rbp)
	movw	$29793, -11(%rbp)
	movb	$0, -9(%rbp)
	movl	-100(%rbp), %eax
	movl	%eax, %edi
	call	alloc_matrix
	movq	%rax, -80(%rbp)
	movl	-100(%rbp), %eax
	movl	%eax, %edi
	call	alloc_matrix
	movq	%rax, -72(%rbp)
	movl	-100(%rbp), %eax
	movl	%eax, %edi
	call	alloc_matrix
	movq	%rax, -64(%rbp)
	movl	-100(%rbp), %edx
	leaq	-15(%rbp), %rcx
	movq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	read_data
	movq	-88(%rbp), %rcx
	movl	-100(%rbp), %edx
	movq	-64(%rbp), %rax
	movq	%rcx, %xmm0
	movl	%edx, %esi
	movq	%rax, %rdi
	call	fill_f
	movl	-100(%rbp), %edx
	movq	-64(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	L2_norm
	movq	%xmm0, %rax
	movq	%rax, -56(%rbp)
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movl	$9, %edi
	movsd	-56(%rbp), %xmm0
	movq	-88(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	-72(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rcx, %xmm0
	movq	%rax, %rsi
	call	multigrid_vcycle
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movl	-100(%rbp), %edx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	verify
	testl	%eax, %eax
	je	.L2
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L3
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L3:
	movq	-32(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-48(%rbp), %rax
	cvtsi2sdq	%rax, %xmm2
	movq	-40(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC3(%rip), %xmm3
	divsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-100(%rbp), %edx
	movq	-80(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	dealloc_matrix
	movl	-100(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	dealloc_matrix
	movl	-100(%rbp), %edx
	movq	-64(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	dealloc_matrix
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movsd	%xmm0, -80(%rbp)
	movsd	%xmm1, -88(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, %edi
	call	get_m
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	movl	-52(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	get_m
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	cmpl	$1, -52(%rbp)
	jne	.L7
	movsd	-80(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	movq	-72(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	addq	$8, %rax
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	jmp	.L11
.L7:
	movl	-48(%rbp), %eax
	movl	%eax, %edi
	call	alloc_matrix
	movq	%rax, -32(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %edi
	call	alloc_matrix
	movq	%rax, -24(%rbp)
	movl	-48(%rbp), %eax
	movl	%eax, %edi
	call	alloc_matrix
	movq	%rax, -16(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %edi
	call	alloc_matrix
	movq	%rax, -8(%rbp)
	movsd	-88(%rbp), %xmm0
	movsd	%xmm0, -40(%rbp)
	jmp	.L9
.L10:
	movl	-48(%rbp), %edx
	movq	-72(%rbp), %rcx
	movq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	GS_update
	movl	-48(%rbp), %ecx
	movq	-72(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	L_def
	movl	-44(%rbp), %edx
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	res_R
	movl	-52(%rbp), %eax
	leal	-1(%rax), %edi
	movsd	-88(%rbp), %xmm0
	movq	-80(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rcx, %xmm0
	movq	%rax, %rsi
	call	multigrid_vcycle
	movl	-44(%rbp), %ecx
	movl	-48(%rbp), %edx
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	prol_P
	movl	-48(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	u_update
	movl	-48(%rbp), %edx
	movq	-72(%rbp), %rcx
	movq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	GS_update
	movl	-48(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	L2_norm
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
.L9:
	movsd	-40(%rbp), %xmm0
	divsd	-88(%rbp), %xmm0
	movsd	.LC5(%rip), %xmm1
	comisd	%xmm1, %xmm0
	ja	.L10
	movl	-48(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	dealloc_matrix
	movl	-44(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	dealloc_matrix
	movl	-48(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	dealloc_matrix
	movl	-44(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	dealloc_matrix
.L11:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	-36(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L13
.L14:
	movl	-36(%rbp), %eax
	cltq
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movl	$8, %esi
	movq	%rax, %rdi
	call	calloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -28(%rbp)
.L13:
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L14
	movq	-24(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	alloc_matrix, .-alloc_matrix
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L17
.L18:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -4(%rbp)
.L17:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L18
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	dealloc_matrix, .-dealloc_matrix
	.section	.rodata
.LC6:
	.string	"r"
.LC7:
	.string	"%lf\n"
	.text
	.globl	read_data
	.type	read_data, @function
read_data:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	-48(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L20
	movl	$-1, %eax
	jmp	.L21
.L20:
	movl	$0, -12(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L22
.L25:
	movl	$0, -16(%rbp)
	jmp	.L23
.L24:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addl	%eax, -12(%rbp)
	addl	$1, -16(%rbp)
.L23:
	movl	-16(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L24
	addl	$1, -20(%rbp)
.L22:
	movl	-20(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L25
	movl	$1, %eax
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	read_data, .-read_data
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L27
.L28:
	sall	-4(%rbp)
	addl	$1, -8(%rbp)
.L27:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L28
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	get_m, .-get_m
	.section	.rodata
.LC8:
	.string	"\n"
	.text
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movsd	%xmm0, -40(%rbp)
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$0, -8(%rbp)
	jmp	.L31
.L34:
	movl	$0, -4(%rbp)
	jmp	.L32
.L33:
	movsd	-40(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	cvtsi2sdl	-4(%rbp), %xmm1
	movsd	.LC9(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	-40(%rbp), %xmm0
	call	sin@PLT
	movapd	%xmm0, %xmm3
	mulsd	-48(%rbp), %xmm3
	movsd	%xmm3, -48(%rbp)
	movsd	.LC9(%rip), %xmm1
	movsd	.LC10(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	cvtsi2sdl	-4(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	-40(%rbp), %xmm0
	call	sin@PLT
	mulsd	-48(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	cvtsi2sdl	-8(%rbp), %xmm1
	movsd	.LC9(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	-40(%rbp), %xmm0
	call	sin@PLT
	movapd	%xmm0, %xmm5
	mulsd	-48(%rbp), %xmm5
	movsd	%xmm5, -48(%rbp)
	movsd	.LC9(%rip), %xmm1
	movsd	.LC11(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	cvtsi2sdl	-8(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	-40(%rbp), %xmm0
	call	sin@PLT
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	mulsd	-48(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L32:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L33
	addl	$1, -8(%rbp)
.L31:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L34
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	fill_f, .-fill_f
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L36
.L39:
	movl	$0, -12(%rbp)
	jmp	.L37
.L38:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	.LC13(%rip), %xmm1
	andpd	%xmm1, %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -12(%rbp)
.L37:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L38
	addl	$1, -16(%rbp)
.L36:
	movl	-16(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L39
	movsd	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	L1_norm, .-L1_norm
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L42
.L45:
	movl	$0, -20(%rbp)
	jmp	.L43
.L44:
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-16(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	addl	$1, -20(%rbp)
.L43:
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L44
	addl	$1, -24(%rbp)
.L42:
	movl	-24(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L45
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	L2_norm, .-L2_norm
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L48
.L53:
	movl	$0, -12(%rbp)
	jmp	.L49
.L52:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	.LC13(%rip), %xmm1
	andpd	%xmm1, %xmm0
	comisd	-8(%rbp), %xmm0
	jbe	.L50
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	.LC13(%rip), %xmm1
	andpd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
.L50:
	addl	$1, -12(%rbp)
.L49:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L52
	addl	$1, -16(%rbp)
.L48:
	movl	-16(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L53
	movsd	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	Max_norm, .-Max_norm
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -44(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L57
.L60:
	movl	$1, -4(%rbp)
	jmp	.L58
.L59:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movsd	.LC14(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movl	-8(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L58:
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L59
	addl	$1, -8(%rbp)
.L57:
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jl	.L60
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	L_def, .-L_def
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L62
.L65:
	movl	$1, -4(%rbp)
	jmp	.L63
.L64:
	movl	-8(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	.LC15(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L63:
	movl	-36(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L64
	addl	$1, -8(%rbp)
.L62:
	movl	-36(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jl	.L65
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	GS_update, .-GS_update
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L67
.L68:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	movl	-28(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L67:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L68
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	set_BC, .-set_BC
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L70
.L73:
	movl	$0, -4(%rbp)
	jmp	.L71
.L72:
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	.LC14(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L71:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L72
	addl	$1, -8(%rbp)
.L70:
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L73
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	res_R, .-res_R
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L75
.L78:
	movl	$0, -4(%rbp)
	jmp	.L76
.L77:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L76:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L77
	addl	$1, -8(%rbp)
.L75:
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L78
	movl	$0, -8(%rbp)
	jmp	.L79
.L82:
	movl	$0, -4(%rbp)
	jmp	.L80
.L81:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %ecx
	addl	%ecx, %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	.LC16(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	.LC16(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	.LC15(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L80:
	movl	-40(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L81
	addl	$1, -8(%rbp)
.L79:
	movl	-40(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jl	.L82
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	prol_P, .-prol_P
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L84
.L87:
	movl	$0, -4(%rbp)
	jmp	.L85
.L86:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L85:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L86
	addl	$1, -8(%rbp)
.L84:
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L87
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	u_update, .-u_update
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L89
.L92:
	movl	$0, -4(%rbp)
	jmp	.L90
.L91:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L90:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L91
	addl	$1, -8(%rbp)
.L89:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L92
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	set_zeros, .-set_zeros
	.globl	verify
	.type	verify, @function
verify:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L94
.L100:
	movl	$0, -4(%rbp)
	jmp	.L95
.L99:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movq	.LC13(%rip), %xmm1
	andpd	%xmm1, %xmm0
	comisd	.LC5(%rip), %xmm0
	jbe	.L102
	movl	$0, %eax
	jmp	.L98
.L102:
	addl	$1, -4(%rbp)
.L95:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L99
	addl	$1, -8(%rbp)
.L94:
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L100
	movl	$1, %eax
.L98:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	verify, .-verify
	.section	.rodata
.LC17:
	.string	"%lf "
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L104
.L107:
	movl	$0, -4(%rbp)
	jmp	.L105
.L106:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %xmm0
	leaq	.LC17(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L105:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L106
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -8(%rbp)
.L104:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L107
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	print_matrix, .-print_matrix
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	1093567616
	.align 8
.LC5:
	.long	2296604913
	.long	1055193269
	.align 8
.LC9:
	.long	1413754136
	.long	1074340347
	.align 8
.LC10:
	.long	3898100906
	.long	1073460858
	.align 8
.LC11:
	.long	1719614413
	.long	1073127582
	.align 16
.LC13:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC14:
	.long	0
	.long	1074790400
	.align 8
.LC15:
	.long	0
	.long	1070596096
	.align 8
.LC16:
	.long	0
	.long	1071644672
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
