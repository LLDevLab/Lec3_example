cls
"D:\Arduino\arduino_1.8.3\hardware\tools\avr\bin\avr-as" -mmcu=atmega328p "-ID:\Arduino\arduino_1.8.3\hardware\arduino\avr\cores\arduino" "-ID:\Arduino\arduino_1.8.3\hardware\arduino\avr\variants\standard" main.s -o main.o
"D:\Arduino\arduino_1.8.3\hardware\tools\avr\bin\avr-ld" main.o -o main.elf
"D:\Arduino\arduino_1.8.3\hardware\tools\avr\bin\avr-objcopy" -O ihex -R .eeprom  main.elf main.hex

