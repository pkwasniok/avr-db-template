# AVR DB Template

## Resources

### Datasheets
 - [AVR DB Product Family](https://www.microchip.com/en-us/products/microcontrollers-and-microprocessors/8-bit-mcus/avr-mcus/avr-db)
 - [AVR Instruction Set Manual](https://ww1.microchip.com/downloads/en/DeviceDoc/AVR-InstructionSet-Manual-DS40002198.pdf)

### Tools
 - [avr-gcc](https://gcc.gnu.org/wiki/avr-gcc)
 - [avrdude](https://github.com/avrdudes/avrdude)
 - [minicom](https://man.archlinux.org/man/minicom.1.en)
 - [doxygen](https://doxygen.nl/)

### Atpacks
 - [Microchip Packs Repository](https://packs.download.microchip.com/)

## Usage

### Building
 - `make build` - Build project
 - `make build-upload` - Build and upload project to target device
 - `make build-clean` - Clean build artifacts

### Debugging
 - `make debug-memusage` - Print binary's memory usage

### Serial
 - `make serial-monitor` - Open serial monitor (config: SERIAL_PORT, SERIAL_BAUDARATE)

### Docs
- `make docs-build` - Build docs
- `make docs-clean` - Clean docs building artifacts
