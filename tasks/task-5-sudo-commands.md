x#### Task 5 – Sudo Commands

##### Objetivo da Task

verificar quais comandos um usuário pode executar como root.

##### Comando principal - Lista todos os comandos que o usuário atual pode executar com o sudo.

```bash
sudo -l

##### Na máquina do DEBIAN do TryHackMe:

user@debian:~$ sudo -l

# Saída:

User user may run the following commands on debian:
    (root) NOPASSWD: /usr/bin/find
    (root) NOPASSWD: /usr/bin/less
    (root) NOPASSWD: /usr/bin/nano
```
 - root = executa como root
 - NOPASSWD = não precisa de senha
 - /usr/bin/find = caminho completo do programa

##### O que aprendi 

 - sudo -l é praticamente o primeiro comando que devo rodar ao entrar num sistema
 - NOPASSWD é uma configuração perigosa - permite execução sem autenticação
 - Programas listados podem ser explorados se tiverem "shell escapes"

##### Prevenção:

 - Evitar NOPASSWD em configurações de sudo
 - Restringir comandos específicos com parâmetros
 - Usar caminhos absolutos no sudoers


