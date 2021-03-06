; Создаем 2 макроса PORTB и DDRB, значения 0x04 и 0x05 являются адресами соответствующих регистров 
; их можно посмотреть на стр. 92 Atmega48P/88P/168P/328P datasheet
.equ	PORTB, 0x05							
.equ	DDRB, 0x04

.text										; Начало секции кода
.org 0x0000									; Начало вектора прерываний
jmp main									; Переходим в функцию main (reset вектор)

main:
	sbi	DDRB, 5								; Устанавливаем в бит 5 в DDRB (Data Direction Register B) 1 это говорит Arduino, что pin 13 на порту B будет выходным сигналом.
_main_loop:									; Метка main цикла 
	rcall wait								; Вызываем функцию wait
	sbi PORTB, 5							; Устанавливаем 1 в бит 5 PORTB регистра (загорается встроенный Arduino светодиод)  
	rcall wait								; Вызываем функцию wait
	cbi PORTB, 5							; Устанавливаем 0 в бит 5 PORTB регистра (встроенный Arduino светодиод гаснет) 
	rjmp _main_loop							; Переходим в начало цикла
	ret
	
wait:
    ldi  r18, 41							; Загружаем число 41 в регистр r18
    ldi  r19, 150							; Загружаем число 150 в регистр r19
    ldi  r20, 128							; Загружаем число 128 в регистр r20
_wait_loop: 								; Метка wait цикла
	dec  r20								; Уменьшаем значение в регистре r20 на 1
    brne _wait_loop							; Переходим в начало цикла, если регистр r20 не равен 0
    dec  r19								; Уменьшаем значение в регистре r19 на 1
    brne _wait_loop							; Переходим в начало цикла, если регистр r19 не равен 0
    dec  r18								; Уменьшаем значение в регистре r18 на 1
    brne _wait_loop							; Переходим в начало цикла, если регистр r18 не равен 0
	ret										; Выход из функции
	
.end										; Конец программы
