# Project configuration
MCU = avr128db28
PROGRAMMER = snap
TARGET = src/main

# Serial configuration
SERIAL_PORT = /dev/ttyACM1
SERIAL_BAUDRATE = 115200

# Tools
GCC = avr-gcc
OBJCOPY = avr-objcopy
AVRDUDE = avrdude

# Flags
CFLAGS = -B ./lib/atpack/gcc/dev/$(MCU)
CFLAGS += -isystem ./lib/atpack/include
CFLAGS += -mmcu=$(MCU)
CFLAGS += -Os

# Others
OUTDIR = .build



build: firmware.bin

build-upload: build
	avrdude -c $(PROGRAMMER) -p $(MCU) -U flash:w:$(OUTDIR)/firmware.bin:r

build-clean:
	rm -r $(OUTDIR)/*

debug-memusage:
	avr-objdump -Pmem-usage $(OUTDIR)/firmware.elf

serial-monitor:
	minicom --device $(SERIAL_PORT) --baudrate $(SERIAL_BAUDRATE) --ansi --statlinefmt "%D %b"

docs-build:
	doxygen

docs-clean:
	rm -r .docs/*



firmware.bin: firmware.elf
	$(OBJCOPY) -O binary $(OUTDIR)/firmware.elf $(OUTDIR)/firmware.bin

firmware.elf: src/main.o
	$(GCC) $(CFLAGS) $(addprefix $(OUTDIR)/, $(^)) -o $(OUTDIR)/$(@)

%.o: %.c
	mkdir -p $(OUTDIR)/$(@D)
	$(GCC) $(CFLAGS) -c $(^) -o $(OUTDIR)/$(@)
