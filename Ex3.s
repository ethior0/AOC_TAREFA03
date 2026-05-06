.data
	msg1:.asciiz"\nInsira o mês de nascimento: "
	msg2:.asciiz"\nInsira o ano de nascimento: "
	msg3:.asciiz"\nInsira o mês atual: "
	msg4:.asciiz"\nInsira o ano atual: "
	res:.asciiz"\nIdade em meses: "
.text

main:
	# Leitura do mês Nasc no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura do ano Nasc no t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Leitura do mês Atual no t2
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
	# Leitura do ano Atual no t3
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	add $t3, $v0, $zero
	
	# Cálculos
	mul $t4, $t1, 12
	add $t4, $t4, $t0
	
	mul $t5, $t3, 12
	add $t5, $t5, $t2
	
	sub $t6, $t5, $t4
	
	# Saída
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t6, $zero
	syscall
	
	# Finalização do programa
	li $v0, 10
	syscall