MCU=atmega328p
PROG=main.elf

all:
	avr-as -mmcu=${MCU} main.s -o main.o
	avr-ld main.o -o ${PROG}
	avr-size -A ${PROG}

flash: all
	avrdude -p ${MCU} -c usbtiny -U flash:w:${PROG}:e

.PHONY: clean
clean:
	-rm main.o ${PROG}