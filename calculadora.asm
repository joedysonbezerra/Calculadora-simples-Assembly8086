include emu8086.inc 

org 100h
jmp main 

DEFINE_SCAN_NUM 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

num1 dw ?
num2 dw ?
opr db ?

main:
GOTOXY 1,0
print 'Bem vindo a calculadora em assembly 8086'  

GOTOXY 1,2
print 'Primeiro numero:'
CALL SCAN_NUM    ; lendo o teclado
mov num1, cx     ;pegando o valor lido e armazena na variavel
 
GOTOXY 1,3
print 'Segundo numero:'
CALL SCAN_NUM
mov num2, cx

GOTOXY 1,4
print 'Escolha a operacao (+), (-), (*) e (/):'
mov ah, 1
int 21h
mov opr, al

GOTOXY 1,5
print 'Resultado:' 

cmp opr, '+'
je adicao

cmp opr, '-'
je subtracao

cmp opr, '*'
je multiplicacao

cmp opr, '/'
je divisao 


adicao:
mov ax, num1
add ax, num2
CALL PRINT_NUM    ; print numero.
jmp sair



subtracao:
mov ax, num1
sub ax, num2
CALL PRINT_NUM   
jmp sair




multiplicacao:
mov ax, num1
imul num2 ; (dx ax) = ax * num2. 
CALL PRINT_NUM
jmp sair

divisao:
mov ax, num1
idiv num2  
CALL PRINT_NUM
jmp sair

 
sair:
end






