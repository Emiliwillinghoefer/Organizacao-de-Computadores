.data

vetor: .word 1,-2, 4, 5, -7

.text
main:
	la t5, vetor #vetor imutavel
	la a0, vetor
	lw a1,0(a0)
	add  a2,zero,a1
	addi t0,zero,5 # T0 GUARDA O TAMANHO DO VETOR
	addi t4,zero,5 # T4 GUARDA O TAMANHO DO VETOR
	addi t1, zero,0 #se altera na primeira função
	addi t6,zero,0
	addi t3, zero,1
	j ordena
	
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
	ret
swap:
	slli a4,a4,2
	add a4,a4,a0
	lw s10, (a4)
	slli a5,a5,2
	add a5,a5,a0
	lw s11,(a5)
	sw s10, (a5)
	sw s11, (a4)
	j incrementa2

ordena:
	beq t4,t6, termina
	jal procurar
	lw a4, (t5)
	add a5, zero, a3
	jal swap
	
incrementa2:
	
	addi t6,t6,1 #incrementa o for de ordena
	addi t5,t5,4
		
	j ordena
	
termina:
	nop
	ebreak	
