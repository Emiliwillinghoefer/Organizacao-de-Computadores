.data

vetor: .word 1,3,-2,-1,0

.text
main:
	la t5, vetor #vetor imutavel
	la a0, vetor
	lw s9,0(a0)
	add  a2,zero,s9
	addi a1,zero,5 # a1 GUARDA O TAMANHO DO VETOR
	addi t4,zero,5 # T4 GUARDA O TAMANHO DO VETOR
	addi t1, zero,0 #se altera na primeira função
	addi t6,zero,0
	addi s2,zero,0
	j ordena
	
procurar:
	beq t1,a1, fim
	lw s9, (a0)
	bge a2,s9,menor
	j incrementa

incrementa:
	addi t1,t1,1
	addi a0,a0,4
	j procurar
	
menor:
	add a2,zero, s9
	add s0,zero, t1,  #indice 
	j incrementa
	
fim:
	add t1,zero,zero
	ret
swap:
	slli a4,a4,2
	add a4,a4,t5
	lw s10, (a4)
	slli a5,a5,2
	add a5,a5,t5
	lw s11,(a5)
	sw s10, (a5)
	sw s11, (a4)
	j incrementa2

ordena:
	beq t4,t6, termina
	add a3,zero,a0
	jal procurar
	bne s0, zero,chamaSwap 
	j incrementa2
	
chamaSwap:
	add a4,zero,s2
	add a5, zero, s0
	j swap
	
incrementa2:
	
	addi t6,t6,1 #incrementa o for de ordena
	addi t5,t5,4
	add a0,zero,a3	
	addi a0,a0,4
	lw s9,(a0)
	add  a2,zero,s9
	addi a1,a1, -1
	j ordena
	
termina:
	nop
	ebreak	
