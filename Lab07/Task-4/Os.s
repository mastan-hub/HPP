	.file	"Multigrid0.c"
	.text
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movslq	%edi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	0(,%r13,8), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%r13, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	pushq	%rcx
	.cfi_def_cfa_offset 48
	call	malloc@PLT
	movq	%rax, %r12
.L2:
	cmpl	%ebx, %ebp
	jle	.L6
	movl	$8, %esi
	movq	%r13, %rdi
	call	calloc@PLT
	movq	%rax, (%r12,%rbx,8)
	incq	%rbx
	jmp	.L2
.L6:
	popq	%rdx
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.LFE26:
	.size	alloc_matrix, .-alloc_matrix
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
.L8:
	cmpl	%ebx, %r12d
	jle	.L11
	movq	0(%rbp,%rbx,8), %rdi
	incq	%rbx
	call	free@PLT
	jmp	.L8
.L11:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE27:
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
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC1(%rip), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	movq	%rsi, %rdi
	leaq	.LC0(%rip), %rsi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	pushq	%rcx
	.cfi_def_cfa_offset 64
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L21
.L14:
	cmpl	%ebx, %ebp
	jle	.L22
	xorl	%r13d, %r13d
.L15:
	movq	(%r14,%rbx,8), %rax
	movq	%r15, %rsi
	movq	%r12, %rdi
	leaq	(%rax,%r13,8), %rdx
	xorl	%eax, %eax
	incq	%r13
	call	__isoc99_fscanf@PLT
	cmpl	%r13d, %ebp
	jg	.L15
	incq	%rbx
	jmp	.L14
.L22:
	movl	$1, %eax
	jmp	.L12
.L21:
	orl	$-1, %eax
.L12:
	popq	%rdx
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
.LFE28:
	.size	read_data, .-read_data
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB29:
	.cfi_startproc
	endbr64
	movl	$1, %eax
	movl	$1, %edx
.L24:
	cmpl	%edi, %edx
	jg	.L26
	addl	%eax, %eax
	incl	%edx
	jmp	.L24
.L26:
	ret
	.cfi_endproc
.LFE29:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC2:
	.string	"\n"
	.text
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	leaq	.LC2(%rip), %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movsd	%xmm0, (%rsp)
	call	puts@PLT
.L28:
	cmpl	%ebx, %r12d
	jle	.L33
	cvtsi2sdl	%ebx, %xmm1
	movsd	.LC3(%rip), %xmm0
	movsd	(%rsp), %xmm3
	xorl	%ebp, %ebp
	mulsd	%xmm3, %xmm3
	mulsd	%xmm1, %xmm0
	movsd	%xmm1, 24(%rsp)
	mulsd	(%rsp), %xmm0
	movsd	%xmm3, 8(%rsp)
	call	sin@PLT
	movsd	24(%rsp), %xmm1
	movsd	%xmm0, 16(%rsp)
	movsd	.LC4(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movq	0(%r13,%rbx,8), %r14
	movsd	%xmm0, 24(%rsp)
.L29:
	cvtsi2sdl	%ebp, %xmm2
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm2, 40(%rsp)
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	40(%rsp), %xmm2
	movsd	%xmm0, 32(%rsp)
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	32(%rsp), %xmm1
	mulsd	8(%rsp), %xmm1
	mulsd	%xmm0, %xmm1
	mulsd	16(%rsp), %xmm1
	mulsd	24(%rsp), %xmm1
	movsd	%xmm1, (%r14,%rbp,8)
	incq	%rbp
	cmpl	%ebp, %r12d
	jg	.L29
	incq	%rbx
	jmp	.L28
.L33:
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
.LFE30:
	.size	fill_f, .-fill_f
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB31:
	.cfi_startproc
	endbr64
	movq	.LC7(%rip), %xmm2
	xorl	%eax, %eax
	xorps	%xmm0, %xmm0
.L35:
	cmpl	%eax, %esi
	jle	.L39
	movq	(%rdi,%rax,8), %rcx
	xorl	%edx, %edx
.L36:
	movsd	(%rcx,%rdx,8), %xmm1
	incq	%rdx
	andps	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	cmpl	%edx, %esi
	jg	.L36
	incq	%rax
	jmp	.L35
.L39:
	ret
	.cfi_endproc
.LFE31:
	.size	L1_norm, .-L1_norm
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB32:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	xorps	%xmm1, %xmm1
.L41:
	cmpl	%eax, %esi
	jle	.L45
	movq	(%rdi,%rax,8), %rcx
	xorl	%edx, %edx
.L42:
	movsd	(%rcx,%rdx,8), %xmm0
	incq	%rdx
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cmpl	%edx, %esi
	jg	.L42
	incq	%rax
	jmp	.L41
.L45:
	movapd	%xmm1, %xmm0
	jmp	sqrt@PLT
	.cfi_endproc
.LFE32:
	.size	L2_norm, .-L2_norm
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB33:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	movq	.LC7(%rip), %xmm2
	movsd	(%rax), %xmm0
	xorl	%eax, %eax
.L47:
	cmpl	%eax, %esi
	jle	.L54
	movq	(%rdi,%rax,8), %rcx
	xorl	%edx, %edx
.L50:
	movsd	(%rcx,%rdx,8), %xmm1
	incq	%rdx
	andps	%xmm2, %xmm1
	maxsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cmpl	%edx, %esi
	jg	.L50
	incq	%rax
	jmp	.L47
.L54:
	ret
	.cfi_endproc
.LFE33:
	.size	Max_norm, .-Max_norm
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB34:
	.cfi_startproc
	endbr64
	movl	$1, %r8d
	decl	%ecx
	movsd	.LC8(%rip), %xmm1
	cmpl	%r8d, %ecx
	jg	.L62
	ret
.L62:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
.L58:
	movq	(%rdi,%r8,8), %r9
	movq	-8(%rdi,%r8,8), %rbp
	movl	$1, %eax
	movq	8(%rdi,%r8,8), %rbx
	movq	(%rdx,%r8,8), %r11
	movq	(%rsi,%r8,8), %r10
.L57:
	movsd	(%r9,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	subsd	0(%rbp,%rax,8), %xmm0
	subsd	(%rbx,%rax,8), %xmm0
	subsd	-8(%r9,%rax,8), %xmm0
	subsd	8(%r9,%rax,8), %xmm0
	subsd	(%r11,%rax,8), %xmm0
	movsd	%xmm0, (%r10,%rax,8)
	incq	%rax
	cmpl	%eax, %ecx
	jg	.L57
	incq	%r8
	cmpl	%r8d, %ecx
	jg	.L58
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE34:
	.size	L_def, .-L_def
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB35:
	.cfi_startproc
	endbr64
	movsd	.LC9(%rip), %xmm1
	movl	$1, %ecx
	decl	%edx
.L64:
	cmpl	%ecx, %edx
	jle	.L68
	movq	-8(%rdi,%rcx,8), %r11
	movq	8(%rdi,%rcx,8), %r10
	movl	$1, %eax
	movq	(%rdi,%rcx,8), %r8
	movq	(%rsi,%rcx,8), %r9
.L65:
	movsd	(%r11,%rax,8), %xmm0
	addsd	(%r10,%rax,8), %xmm0
	addsd	-8(%r8,%rax,8), %xmm0
	addsd	8(%r8,%rax,8), %xmm0
	addsd	(%r9,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%r8,%rax,8)
	incq	%rax
	cmpl	%eax, %edx
	jg	.L65
	incq	%rcx
	jmp	.L64
.L68:
	ret
	.cfi_endproc
.LFE35:
	.size	GS_update, .-GS_update
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB36:
	.cfi_startproc
	endbr64
	movslq	%esi, %rax
	leaq	-8(,%rax,8), %rdx
	xorl	%eax, %eax
	leaq	(%rdi,%rdx), %r8
.L70:
	cmpl	%eax, %esi
	jle	.L72
	movq	(%rdi), %rcx
	movq	$0x000000000, (%rcx,%rax,8)
	movq	(%r8), %rcx
	movq	$0x000000000, (%rcx,%rax,8)
	movq	(%rdi,%rax,8), %rcx
	incq	%rax
	movq	$0x000000000, (%rcx)
	movq	$0x000000000, (%rcx,%rdx)
	jmp	.L70
.L72:
	ret
	.cfi_endproc
.LFE36:
	.size	set_BC, .-set_BC
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB37:
	.cfi_startproc
	endbr64
	movsd	.LC8(%rip), %xmm0
	xorl	%eax, %eax
.L74:
	cmpl	%eax, %edx
	jle	.L78
	movq	%rax, %rcx
	movq	(%rsi,%rax,8), %r8
	salq	$4, %rcx
	movq	(%rdi,%rcx), %r10
	xorl	%ecx, %ecx
.L75:
	movq	%rcx, %r9
	salq	$4, %r9
	movsd	(%r10,%r9), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%r8,%rcx,8)
	incq	%rcx
	cmpl	%ecx, %edx
	jg	.L75
	incq	%rax
	jmp	.L74
.L78:
	ret
	.cfi_endproc
.LFE37:
	.size	res_R, .-res_R
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB38:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
.L80:
	cmpl	%eax, %edx
	jle	.L92
	movq	(%rdi,%rax,8), %r9
	xorl	%r8d, %r8d
.L81:
	movq	$0x000000000, (%r9,%r8,8)
	incq	%r8
	cmpl	%r8d, %edx
	jg	.L81
	incq	%rax
	jmp	.L80
.L92:
	xorl	%r8d, %r8d
	decl	%ecx
	movsd	.LC10(%rip), %xmm1
	movsd	.LC9(%rip), %xmm2
	cmpl	%r8d, %ecx
	jg	.L90
	ret
.L90:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.L85:
	movq	(%rsi,%r8,8), %rdx
	movq	(%rdi), %rbx
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	movq	8(%rsi,%r8,8), %r10
	movq	8(%rdi), %r11
.L84:
	movsd	(%rdx,%rax), %xmm0
	incl	%r9d
	movsd	%xmm0, (%rbx,%rax,2)
	movsd	(%rdx,%rax), %xmm0
	addsd	(%r10,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%r11,%rax,2)
	movsd	(%rdx,%rax), %xmm0
	addsd	8(%rdx,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rbx,%rax,2)
	movsd	(%rdx,%rax), %xmm0
	addsd	8(%rdx,%rax), %xmm0
	addsd	(%r10,%rax), %xmm0
	addsd	8(%r10,%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, 8(%r11,%rax,2)
	addq	$8, %rax
	cmpl	%r9d, %ecx
	jg	.L84
	incq	%r8
	addq	$16, %rdi
	cmpl	%r8d, %ecx
	jg	.L85
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	prol_P, .-prol_P
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB39:
	.cfi_startproc
	endbr64
	xorl	%ecx, %ecx
.L94:
	cmpl	%ecx, %edx
	jle	.L98
	movq	(%rdi,%rcx,8), %r8
	movq	(%rsi,%rcx,8), %r9
	xorl	%eax, %eax
.L95:
	movsd	(%r8,%rax,8), %xmm0
	subsd	(%r9,%rax,8), %xmm0
	movsd	%xmm0, (%r8,%rax,8)
	incq	%rax
	cmpl	%eax, %edx
	jg	.L95
	incq	%rcx
	jmp	.L94
.L98:
	ret
	.cfi_endproc
.LFE39:
	.size	u_update, .-u_update
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
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
	movq	%rsi, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movsd	%xmm0, 24(%rsp)
	movsd	%xmm1, 32(%rsp)
	cmpl	$1, %edi
	jne	.L100
	movq	8(%rdx), %rdx
	mulsd	%xmm0, %xmm0
	movq	8(%rsi), %rax
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
.L100:
	.cfi_restore_state
	call	get_m
	leal	1(%rax), %ebp
	leal	-1(%rdi), %eax
	movl	%eax, %edi
	movl	%eax, 44(%rsp)
	call	get_m
	movl	%ebp, %edi
	leal	1(%rax), %r12d
	call	alloc_matrix
	movl	%r12d, %edi
	movq	%rax, %r13
	call	alloc_matrix
	movl	%ebp, %edi
	movq	%rax, %r15
	call	alloc_matrix
	movl	%r12d, %edi
	movq	%rax, 8(%rsp)
	call	alloc_matrix
	movsd	32(%rsp), %xmm0
	movq	%rax, 16(%rsp)
.L102:
	divsd	32(%rsp), %xmm0
	comisd	.LC11(%rip), %xmm0
	jbe	.L106
	movq	%rbx, %rdi
	movl	%ebp, %edx
	movq	%r14, %rsi
	call	GS_update
	movl	%ebp, %ecx
	movq	%r14, %rdx
	movq	%r13, %rsi
	call	L_def
	movl	%r12d, %edx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	res_R
	movsd	32(%rsp), %xmm1
	movl	44(%rsp), %edi
	movq	%r15, %rdx
	movsd	24(%rsp), %xmm0
	movq	16(%rsp), %rsi
	call	multigrid_vcycle
	movq	16(%rsp), %rsi
	movl	%r12d, %ecx
	movl	%ebp, %edx
	movq	8(%rsp), %rdi
	call	prol_P
	movq	8(%rsp), %rsi
	movq	%rbx, %rdi
	movl	%ebp, %edx
	call	u_update
	movq	%r14, %rsi
	call	GS_update
	movl	%ebp, %esi
	movq	%r13, %rdi
	call	L2_norm
	jmp	.L102
.L106:
	movl	%ebp, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	dealloc_matrix
	movq	8(%rsp), %rdi
	movl	%ebp, %esi
	call	dealloc_matrix
	movq	16(%rsp), %rdi
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	movl	%r12d, %esi
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
	.cfi_endproc
.LFE25:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB40:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
.L108:
	cmpl	%eax, %esi
	jle	.L112
	movq	(%rdi,%rax,8), %rcx
	xorl	%edx, %edx
.L109:
	movq	$0x000000000, (%rcx,%rdx,8)
	incq	%rdx
	cmpl	%edx, %esi
	jg	.L109
	incq	%rax
	jmp	.L108
.L112:
	ret
	.cfi_endproc
.LFE40:
	.size	set_zeros, .-set_zeros
	.globl	verify
	.type	verify, @function
verify:
.LFB41:
	.cfi_startproc
	endbr64
	movq	.LC7(%rip), %xmm1
	movsd	.LC11(%rip), %xmm2
	xorl	%eax, %eax
.L114:
	cmpl	%eax, %edx
	jle	.L120
	movq	(%rdi,%rax,8), %r8
	movq	(%rsi,%rax,8), %r9
	xorl	%ecx, %ecx
.L116:
	movsd	(%r8,%rcx,8), %xmm0
	subsd	(%r9,%rcx,8), %xmm0
	andps	%xmm1, %xmm0
	comisd	%xmm2, %xmm0
	ja	.L118
	incq	%rcx
	cmpl	%ecx, %edx
	jg	.L116
	incq	%rax
	jmp	.L114
.L120:
	movl	$1, %eax
	ret
.L118:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE41:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC14:
	.string	"\nResult OK!"
.LC15:
	.string	"\nResult not OK!"
.LC17:
	.string	"time = %lf s\n"
.LC13:
	.string	"mg.dat"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$9, %edi
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
	call	get_m
	leaq	49(%rsp), %rdi
	movl	$7, %ecx
	movsd	.LC12(%rip), %xmm1
	cvtsi2sdl	%eax, %xmm0
	leaq	.LC13(%rip), %rsi
	rep movsb
	movapd	%xmm1, %xmm3
	divsd	%xmm0, %xmm3
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %ebp
	movl	%ebp, %edi
	movsd	%xmm3, (%rsp)
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
	movsd	(%rsp), %xmm0
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	fill_f
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	L2_norm
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	movsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	movsd	(%rsp), %xmm0
	movq	%r12, %rdx
	movq	%r13, %rsi
	movsd	8(%rsp), %xmm1
	movl	$9, %edi
	call	multigrid_vcycle
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	movq	%r13, %rdi
	movl	%ebp, %edx
	movq	%r14, %rsi
	call	verify
	leaq	.LC14(%rip), %rdi
	testl	%eax, %eax
	jne	.L126
	leaq	.LC15(%rip), %rdi
.L126:
	call	puts@PLT
	cvtsi2sdq	40(%rsp), %xmm0
	movb	$1, %al
	movsd	.LC16(%rip), %xmm2
	cvtsi2sdq	32(%rsp), %xmm1
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsi2sdq	24(%rsp), %xmm1
	divsd	%xmm2, %xmm1
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
	je	.L124
	call	__stack_chk_fail@PLT
.L124:
	addq	$72, %rsp
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
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.str1.1
.LC18:
	.string	"%lf "
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	.LC18(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
.L128:
	cmpl	%ebx, %ebp
	jle	.L133
	xorl	%r12d, %r12d
.L129:
	movq	0(%r13,%rbx,8), %rax
	movq	%r14, %rsi
	movl	$1, %edi
	movsd	(%rax,%r12,8), %xmm0
	movb	$1, %al
	incq	%r12
	call	__printf_chk@PLT
	cmpl	%r12d, %ebp
	jg	.L129
	movl	$10, %edi
	incq	%rbx
	call	putchar@PLT
	jmp	.L128
.L133:
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
.LFE42:
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
	.long	450716388
	.long	1074906499
	.align 8
.LC5:
	.long	3700601565
	.long	1075168253
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
.LC16:
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
