cls
"D:\Arduino\arduino_1.8.3\hardware\tools\avr\bin\avr-as" -mmcu=atmega328p main.s -o main.o
"D:\Arduino\arduino_1.8.3\hardware\tools\avr\bin\avr-ld" main.o -o main.elf
"D:\Arduino\arduino_1.8.3\hardware\tools\avr\bin\avr-objcopy" -O ihex -R .eeprom  main.elf main.hex

