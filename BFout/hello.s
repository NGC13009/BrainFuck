	.file	"BFhello.c"
	.text
	.p2align 4,,15
	.globl	strcpy
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.seh_proc	strcpy
strcpy:
	.seh_endprologue
	xorl	%r8d, %r8d
	movq	%rcx, %rax
	.p2align 4,,10
.L2:
	movzbl	(%rdx,%r8), %r9d
	movb	%r9b, (%rax,%r8)
	addq	$1, %r8
	testb	%r9b, %r9b
	jne	.L2
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	vm_Turing_run
	.def	vm_Turing_run;	.scl	2;	.type	32;	.endef
	.seh_proc	vm_Turing_run
vm_Turing_run:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzbl	program(%rip), %eax
	testb	%al, %al
	je	.L5
	leaq	program(%rip), %rbp
	xorl	%edx, %edx
	.p2align 4,,10
.L7:
	movl	%edx, %r12d
	addq	$1, %rdx
	cmpb	$0, 0(%rbp,%rdx)
	jne	.L7
	movl	sp(%rip), %edx
	leaq	.L11(%rip), %rdi
	xorl	%ebx, %ebx
	leaq	paper(%rip), %r13
	leaq	stack(%rip), %rsi
	.p2align 4,,10
.L21:
	testl	%edx, %edx
	jne	.L8
	cmpb	$93, %al
	je	.L5
.L8:
	subl	$43, %eax
	cmpb	$50, %al
	ja	.L32
	movzbl	%al, %eax
	movslq	(%rdi,%rax,4), %rax
	addq	%rdi, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L11:
	.long	.L18-.L11
	.long	.L17-.L11
	.long	.L16-.L11
	.long	.L15-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L14-.L11
	.long	.L32-.L11
	.long	.L13-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L32-.L11
	.long	.L12-.L11
	.long	.L32-.L11
	.long	.L10-.L11
	.text
	.p2align 4,,10
.L10:
	movslq	ptr(%rip), %rax
	movq	%rax, %rcx
	movzbl	0(%r13,%rax), %eax
	testb	%al, %al
	je	.L20
	leal	-1(%rdx), %r8d
	movslq	%r8d, %r8
	movl	(%rsi,%r8,4), %ebx
.L20:
	testb	%al, %al
	sete	%al
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%ebx, %eax
	movl	%edx, sp(%rip)
	.p2align 4,,10
.L19:
	cmpl	$127, %ecx
	ja	.L5
.L33:
	movl	sp(%rip), %edx
	cmpl	$15, %edx
	jg	.L5
	addl	$1, %ebx
	cmpl	%r12d, %eax
	jge	.L5
	movslq	%ebx, %rax
	movzbl	0(%rbp,%rax), %eax
	jmp	.L21
	.p2align 4,,10
.L12:
	movl	ptr(%rip), %ecx
	movslq	%edx, %rax
	addl	$1, %edx
	movl	%ebx, (%rsi,%rax,4)
	movl	%ebx, %eax
	movl	%edx, sp(%rip)
	cmpl	$127, %ecx
	jbe	.L33
.L5:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L13:
	movl	ptr(%rip), %eax
	leal	1(%rax), %ecx
	movl	%ebx, %eax
	movl	%ecx, ptr(%rip)
	jmp	.L19
	.p2align 4,,10
.L14:
	movl	ptr(%rip), %eax
	leal	-1(%rax), %ecx
	movl	%ebx, %eax
	movl	%ecx, ptr(%rip)
	jmp	.L19
	.p2align 4,,10
.L15:
	movslq	ptr(%rip), %rax
	movsbl	0(%r13,%rax), %ecx
	call	putchar
.L32:
	movl	ptr(%rip), %ecx
	movl	%ebx, %eax
	jmp	.L19
	.p2align 4,,10
.L17:
	call	getchar
	movslq	ptr(%rip), %rdx
	movb	%al, 0(%r13,%rdx)
	movq	%rdx, %rcx
	movl	%ebx, %eax
	jmp	.L19
	.p2align 4,,10
.L18:
	movslq	ptr(%rip), %rax
	addb	$1, 0(%r13,%rax)
	movq	%rax, %rcx
	movl	%ebx, %eax
	jmp	.L19
	.p2align 4,,10
.L16:
	movslq	ptr(%rip), %rax
	subb	$1, 0(%r13,%rax)
	movq	%rax, %rcx
	movl	%ebx, %eax
	jmp	.L19
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	__main
	movabsq	$3110627432037296939, %rax
	movabsq	$3110627432359209771, %rdx
	movabsq	$3110627432356064043, %rcx
	movq	%rax, program(%rip)
	movq	%rax, 72+program(%rip)
	movabsq	$3110630812226890539, %rax
	movq	%rdx, 8+program(%rip)
	movabsq	$3115975456594799403, %rdx
	movq	%rcx, 16+program(%rip)
	movabsq	$4340410369999514411, %rcx
	movq	%rax, 80+program(%rip)
	movabsq	$3255307777713450539, %rax
	movq	%rdx, 24+program(%rip)
	movabsq	$3115978755130940717, %rdx
	movq	%rcx, 32+program(%rip)
	movabsq	$3110627432037296942, %rcx
	movq	%rax, 88+program(%rip)
	subq	$253, %rax
	movq	%rdx, 40+program(%rip)
	subq	$1257215, %rdx
	movq	%rcx, 48+program(%rip)
	addq	$286327549, %rcx
	movq	%rax, 96+program(%rip)
	movabsq	$13016216943603245, %rax
	movq	%rdx, 56+program(%rip)
	movq	%rcx, 64+program(%rip)
	movq	%rax, 104+program(%rip)
	call	vm_Turing_run
	xorl	%eax, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.globl	sp
	.bss
	.align 4
sp:
	.space 4
	.globl	stack
	.align 32
stack:
	.space 64
	.globl	ptr
	.data
	.align 4
ptr:
	.long	64
	.globl	paper
	.bss
	.align 32
paper:
	.space 128
	.comm	program, 128, 5
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	getchar;	.scl	2;	.type	32;	.endef
