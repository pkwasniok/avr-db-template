# Config
MCU = avr128db28
PROGRAMMER = snap

# Tools
GCC = avr-gcc
OBJCOPY = avr-objcopy
AVRDUDE = avrdude

# Flags
CFLAGS = -B ./lib/atpack/gcc/dev/$(MCU)
CFLAGS += -isystem ./lib/atpack/include
CFLAGS += -mmcu=$(MCU)
CFLAGS += -Os



build: firmware.bin

upload: build
	avrdude -c $(PROGRAMMER) -p $(MCU) -U flash:w:./build/firmware.bin:r

clean:
	rm -r build/*

firmware.bin: firmware.elf
	$(OBJCOPY) -O binary build/firmware.elf build/firmware.bin

firmware.elf: main.o
	$(GCC) $(CFLAGS) build/main.o -o build/firmware.elf

main.o:
	$(GCC) $(CFLAGS) -c src/main.c -o build/main.o
