.data
	vetor: 1,2,3

.text

main:
	la a1,vetor
	addi a2,zero,1
	addi a3, zero, 2
	jal swap
	nop
	ebreak

swap:
	slli a2,a2,2
	add a2,a2,a0
	lw t0, (a2)
	slli a3,a3,2
	add a3,a3,a0
	lw t1,(a3)
	sw t0, (a3)
	sw t1, (a2)
	ret