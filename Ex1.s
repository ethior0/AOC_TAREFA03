.data
	msg1:.asciiz"\nInsira o valor em dólar: "
	res:.asciiz"\nValor convertido: R$ "
.text

main:
	# Leitura do valor no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Cálculo e print no t1
	mul $t1, $t0, 5
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	
	# Finaliza o programa com exit
	li $v0, 10
	syscall