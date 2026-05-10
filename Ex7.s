.data
	msg1:.asciiz"\nInsira o número inteiro: "
	cen:.asciiz"\nCentena = "
	dez:.asciiz"\nDezena = "
	uni:.asciiz"\nUnidade = "
	erro:.asciiz"\nFora do intervalo! (100-999)"
.text
main:
	# Leitura do valor no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	bgt $t0, 999, invalido
	blt $t0, 100, invalido
	
	# Cálculos no t1, t2 e t3
	div $t1, $t0, 100
	rem $t2, $t0, 100
	rem $t3, $t2, 10
	div $t2, $t2, 10
	
	# Mostra o resultado e finaliza com exit
	li $v0, 4
	la $a0, cen
	syscall
	
	li $v0, 1
	add $a0, $t1, $zero
	syscall

	li $v0, 4
	la $a0, dez
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	
	li $v0, 4
	la $a0, uni
	syscall
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	
	j fim
	
invalido:
	li $v0, 4
	la $a0, erro
	syscall
	
fim:
	li $v0, 10
	syscall