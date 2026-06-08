##### Compilação para arquitetura 32 bits
```
nasm -f elf32 hello_world.asm -o hello_world.o 
ld -m elf_i386 hello_world.o -o hello_world
```

##### Agora é só executar o programa
```
./hello_world

#Saída:

hello world
```







