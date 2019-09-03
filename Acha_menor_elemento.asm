.data 

	vetor: .word -9, -1, -11
	
.text

main:
	la a0, vetor
	 #carrega o indice 0 no t0
	lw t0,0(a0)
	add  t1,zero,t0
	addi a1, zero,3 #posições do vetor
	addi t4, zero,1 #tem 1 nesse regis
	jal procura
	nop 
	ebreak

procura:
	beq  a1,zero, fim_laco
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
	ret
	
fim_laco:
	add a1,zero,t1
	add a0,zero,s0 #a0 salava o indicice se encontrar ou -1 se nao encontrar
	ret