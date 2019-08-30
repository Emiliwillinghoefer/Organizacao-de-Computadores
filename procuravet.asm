.data

vetor: .word 1,2,3,4,5
.text
main:
	addi a0, zero,6
	la a1,vetor
	addi a2,zero,5
	jal procura
	nop
	ebreak
	
procura: 
	beq a2,zero,fim_laco
	lw t0,0(a1)
	beq a0,t0, encontrei
	addi a2,a2,-1
	addi a1,a1,4
	j procura
	
encontrei: 
	addi t1, zero, 5
	sub a0,t1,a2 #t1 contém o indice do vetor que queremos retornar
	ret
	
fim_laco:
	addi a0,zero,-1 #a0 salava o indicice se encontrar ou -1 se nao encontrar
	ret