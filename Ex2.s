.data
	msg1:.asciiz"\nInsira o 1o valor: "
	msg2:.asciiz"\nInsira o 2o valor: "
	res1:.asciiz"\n1o valor: "
	res2:.asciiz"\n2o valor: "
.text

main:
	# Leitura do 1o valor no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura do 2o valor no t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Troca e print dos valores
	add $t2, $t0, $zero
	add $t0, $t1, $zero
	add $t1, $t2, $zero
	
	li $v0, 4
	la $a0, res1
	syscall
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	
	li $v0, 4
	la $a0, res2
	syscall
	
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	
	# Finalização do programa
	li $v0, 10
	syscall