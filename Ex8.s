.data
	msg1:.asciiz"\nInsira o valor da compra: (entre R$ 1000 e R$ 9999) "
	msg2:.asciiz"\nInsira o valor da parcela: (entre R$ 100 e R$ 500) "
	msg1_invalido:.asciiz"\nValor inválido de compra!"
	msg2_invalido:.asciiz"\nValor inválido de parcela!"
	res:.asciiz"\nQuantidade de parcelas: "
.text

main:
	# Leitura do valor no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	bgt $t0, 9999, compra_invalida
	blt $t0, 1000, compra_invalida
		
	# Leitura da parcela no t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	bgt $t1, 500, parcela_invalida
	blt $t1, 100, parcela_invalida
	
	# Cálculo do resultado no t2
	div $t2, $t0, $t1
	mul $t3, $t2, $t1
	sub $t4, $t0, $t3
	
	bgtz $t4, adiciona_parcela
	j fim

compra_invalida:
	li $v0, 4
	la $a0, msg1_invalido
	syscall
	j fim

parcela_invalida:
	li $v0, 4
	la $a0, msg2_invalido
	syscall
	j fim

adiciona_parcela:
	add $t2, $t2, 1

fim:
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall

	li $v0, 10
	syscall
