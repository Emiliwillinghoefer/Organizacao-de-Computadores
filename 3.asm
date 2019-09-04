.data

vetor: .word 2,5,1


.text
main:
	la a0, vetor
	la s9,vetor
	 #carrega o indice 0 no t0
	lw t0,0(a0)
	add  t1,zero,t0
	addi t6, zero,0
	addi a7, zero,3
	addi a1, zero,3 #posições do vetor
	addi t4, zero,1 #tem 1 nesse regis
	jal procura
	jal incrementa_indice
	nop 
	ebreak



procura:
	beq  a1,zero, fim_laco_menor
	lw t0,0(a0)
	addi a0,a0,4
	slt t2,t0,t1
	beq t2,t4, menor
	addi a1,a1,-1
	j procura

menor:
	add t1, zero, t0
	addi t5,zero,3
	sub s0, t5,a1
	bne a1,zero,procura
	addi a1,a1,-1
	j procura
	
fim_laco_menor:
	add a1,zero,t1
	add t3,zero,s0 #a0 salava o indicice se encontrar ou -1 se nao encontrar
	ret
	
swap: 
	slli a2,a2,2 #multiplica por 4 a posição
	add a2,a2,s9# soma mais o valor da posição atual
	lw t0, (a2)
	slli a3,a3,2
	add a3,a3,s9
	lw t1, (a3)
	sw t0,(a3)	
	sw t1,(a2)
	addi a0,a0,4
	addi t6,t6,1
	addi s9,s9,4	
	j incrementa_indice
	
incrementa_indice:
	beq t6, a7, fim
	add a2,zero,a0
	lw a3,0(s9)
	jal swap
	addi a0,a0,4
	addi t6,t6,1
	addi s9,s9,4
fim: ebreak