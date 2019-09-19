.data
	vetor: 1,2,3

.text

main:
	la a0,vetor
	addi a1,zero,1
	addi a2, zero, 2
	jal swap
	nop
	ebreak

swap:
	slli a1,a1,2
	add a1,a1,a0
	lw t0, (a1)
	slli a2,a2,2
	add a2,a2,a0
	lw t1,(a2)
	sw t0, (a2)
	sw t1, (a1)
	ret
