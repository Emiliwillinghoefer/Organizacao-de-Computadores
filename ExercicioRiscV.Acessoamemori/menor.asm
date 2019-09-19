.data

vetor: .word 2,5,1


.text
main:
	la a0, vetor
	lw a1,0(a0)
	add  a2,zero,a1
	addi t0,zero,3 # T0 GUARDA O TAMANHO DO VETOR
	addi t1, zero,0
	addi t3, zero,1
	j procurar
	
procurar:
	beq t1,t0, fim
	lw a1, (a0)
	slt t2, a1,a2
	beq t2,t3,menor
	j incrementa

incrementa:
	addi t1,t1,1
	addi a0,a0,4
	j procurar
	
menor:
	add a2,zero, a1
	add s0,zero, t1,  #indice 
	j incrementa
	
fim:
	add a1, zero,a2
	add a3, zero, s0
	nop 
	ebreak
	