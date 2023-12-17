# trabalho2-sb
Repositório que contém o segundo trabalho da matéria de Software Básico

## 1. Comandos

### 1.1 Compilar calculadora de 32 bits
nasm -f elf src/32bits/main-32bits.asm

### 1.2 Ligar calculadora de 32 bits
ld -m elf_i386 -o main-32bits src/32bits/main-32bits.o

### 1.3 Executar calculador de 32 bits
./main-32bits


### 1.4 Compilar calculadora de 16 bits
nasm -f elf src/16bits/main-16bits.asm

### 1.5 Ligar calculadora de 16 bits
ld -m elf_i386 -o main-16bits src/16bits/main-16bits.o

### 1.6 Executar calculador de 16 bits
./main-16bits