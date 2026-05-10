.data
	msg1:.asciiz"\nInsira o valor de A: "
	msg2:.asciiz"\nInsira o valor de B: "
	msg3:.asciiz"\nInsira o valor de C: "
	maior:.asciiz"\nDuas raízes reais!"
	igual:.asciiz"\nUma raíz real!"
	menor:.asciiz"\nNão existem raízes reais!"
.text

main:
	# Leitura do A no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura do B no t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Leitura do C no t2
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
	# Cálculo do delta no t3
	mul $t3, $t1, $t1
	mul $t4, $t0, $t2
	mul $t4, $t4, 4
	sub $t3, $t3, $t4
	
	bgtz, $t3, mostra_maior
	bltz, $t3, mostra_menor
	
	li $v0, 4
	la $a0, igual
	syscall
	j fim
	
mostra_maior:
	li $v0, 4
	la $a0, maior
	syscall
	j fim
	
mostra_menor:
	li $v0, 4
	la $a0, menor
	syscall

fim:
	li $v0, 10
	syscall
