.data

vetor: .word 2,5,1


.text
main:
	la a0, vetor
	lw t0,0(a0)
	add  a2,zero,t0
	addi a1,zero,3 # T0 GUARDA O TAMANHO DO VETOR
	addi t1, zero,0
	j procurar
	
procurar:
	beq t1,a1, fim
	lw t0, (a0)
	bge a2,t0,menor
	j incrementa

incrementa:
	addi t1,t1,1
	addi a0,a0,4
	j procurar
	
menor:
	add a2,zero, t0
	add s0,zero, t1,  #indice 
	j incrementa
	
fim:
	add a1, zero,a2
	add a0, zero,s0
	nop 
	ebreak
	
