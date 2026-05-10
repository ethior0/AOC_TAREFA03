.data
	msg:.asciiz"\nInsira o salário atual: "
	res:.asciiz"\nNovo salário: R$ "
.text
main:
	# Leitura do salário atual no t0
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	#  Cálculo no t1
	mul $t1, $t0, 125
	div $t1, $t1, 100
	
	# Mostra o resultado e finaliza com exit
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	
	li $v0, 10
	syscall