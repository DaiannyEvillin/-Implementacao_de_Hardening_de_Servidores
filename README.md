# Implementação de Hardening de Servidores

**Tipo:** Grupo de até 3 pessoas  
**Valor:** 2 Pontos  
**Data de Entrega:** 29/09/2023  
**Plataforma de Entrega:** SUAP  
**Etapa:** 1  
**Data da Solicitação:** 15/09/2023  

## Descrição

Utilizando o Vagrant, cada integrante do grupo deve criar uma VM e implementar, através do módulo "provision", 10 ações de Hardening de Servidores. A base para estas VMs é o Sistema Operacional Ubuntu 20.04 (focal). O projeto completo deve ser entregue através de um repositório GIT, contendo todos os arquivos de instalação e configuração utilizados.

**Pontos Importantes:**
- Todos os membros do grupo devem, obrigatoriamente, enviar o projeto via SUAP.
- O grupo deve demonstrar um mecanismo de consumo dos serviços disponibilizados entre as VMs, mostrando, na prática, a aplicação do Hardening.

## Passos a Seguir

- [ ] Criar um repositório no GitHub com o nome "hardening-servidores".
- [X] Criar um arquivo README.md com as informações do trabalho.
- [X] Criar um arquivo Vagrantfile com as configurações para iniciar as 3 VMs.
- [X] Criar um arquivo de provisionamento para cada VM.

## Descrição do Projeto

Utilizamos o Vagrant para criar e provisionar três VMs simulando um ambiente real composto por um servidor web, um consumidor legítimo e um potencial atacante. O objetivo é demonstrar a eficácia das técnicas de hardening aplicadas no servidor web.

## Instruções para Configuração e Testes

### 1. Configuração

**Instalar o Vagrant e o VirtualBox**

**Clonar o Repositório e Iniciar as VMs**

    git clone [link-do-repositorio]
    cd nome-do-repositorio
    vagrant up
    
### 2. Testes

**Tentar Acessar via navegador o Servidor Web 1**

    Abrir o navegador e digitar o endereço: http://192.168.50.10
    Como o host é o criador das VMs, ele deve conseguir acessar o servidor web.

**Acessar o Servidor Web 1 e verificar se o nginx está disponível e o firewall ativo**

    vagrant ssh vm1
    sudo ufw status
    curl localhost

**Acessar o Servidor usando a VM 2**

    vagrant ssh vm2
    sudo ufw status
    curl 192.168.50.10

**Acessar o Servidor usando a VM 3 e ver o resultado do escaneamento**

    vagrant ssh vm3
    sudo ufw status
    curl 192.168.50.10
    cat /tmp/nmap_vuln_scan.txt
    
       

