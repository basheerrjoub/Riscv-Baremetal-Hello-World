# RISC-V bare metal Hello World

<p align="center">
<img src="./img/hello.jpg" width="500">
</p>

## QEMU
This code uses Qemu emulator to emulate a virtual hardware to run our program, to install Qemu which could be found here:
🔗 https://github.com/qemu/qemu

## TOOLCHAIN
Also it uses RISCV toolchain to compile the code and link the script files:
🔗 https://github.com/riscv-collab/riscv-gnu-toolchain

## 🏅 Features
- Custom Implementation for UART serial communication
- Custom Linker Script not the default one
- Neither bios nor kernel is needed

## 🛠 How to Run?

- Using the toolchain to compile the assembly into an object file
```bash
riscv64-unknown-elf-as hello.s -o hello.o
```

- Using GNU linker (ld) to generate the executable binary file / -T Because we have our own linker script aka hello.ld
```bash
riscv64-unknown-elf-ld -T hello.ld hello.o -o kernel.elf
```
- Emulating the object file linked with elf kernel, no bios is needed, using virt machine to reduce hardware practical limitaions, rv64 cpu, memory needed is 128m, no Qemu display is needed, our serial port is the standard I/O
```bash
qemu-system-riscv64 -bios none -machine virt -cpu rv64 -smp 4 -m 128m -kernel kernel.elf -display none -serial mon:stdio hello.o
```


## TODO
- [x] Adding UART
- [x] Adding Multiple Harts
- [ ] Fixing the racing conditions between harts
- [ ] Adding A dedicated and seperated UART functionality
- [ ] Linking Assembly functions with C (Less Assembly :broken_heart:)


## Authors

- [@basheerrjoub](https://www.github.com/basheerrjoub)

