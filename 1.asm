.data

vetor: .space 400
msg_vetor: .string "digite a quantidade de valores do vetor: "
msg_inserir: .string "digite um valor inteiro: "
msg_space:	 .string " "

.text
main:
	la a0,vetor
	addi t1,zero,0 #contador
	j le_quantia_deValor

le_quantia_deValor:
	add t0,zero,a0 #guarda o endereço de memoria do inicio do vetor
	la a0, msg_vetor
	li a7,4
	ecall
	
	li a7,5
	ecall
	add a2,zero,a0
	j le_vetor
	
	
le_vetor:
	beq a2,t1, fim
	la a0, msg_inserir  #imprime minha mensagem
	li a7,4		    #imprime minha mensagem		
	ecall
	
	li a7,5
	ecall
	add s0, zero,a0
	sw s0,(t0)
	
	addi t0,t0,4
	addi t1,t1,1
	j le_vetor
fim:
	nop
	ebreak
	
	