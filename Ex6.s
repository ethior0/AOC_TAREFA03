.data
	msg1:.asciiz"\nInsira o 1o número: "
	msg2:.asciiz"\nInsira o 2o número: "
	igual:.asciiz"\nNúmeros iguais!"
	maior:.asciiz"\nNúmero maior: "
	menor:.asciiz"\nNúmero menor: "
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
	
	beq $t0, $t1, mostra_igual
	
	# Condição pro menor no t2 e maior no t3
	bgt $t0, $t1, se	
	j senao

se:
	add $t3, $t0, $zero
	add $t2, $t1, $zero
	j mostra_maior_menor

senao:
	add $t3, $t1, $zero
	add $t2, $t0, $zero

mostra_maior_menor:
	li $v0, 4
	la $a0, maior
	syscall
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall

	li $v0, 4
	la $a0, menor
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	j fim

mostra_igual:
	li $v0, 4
	la $a0, igual
	syscall

fim:
	li $v0, 10
	syscall