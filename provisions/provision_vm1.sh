#!/bin/bash

# 1. Atualização do Sistema
sudo apt-get update -y && sudo apt-get upgrade -y

# 2. Desativação de Serviços Desnecessários
sudo systemctl disable xinetd 2>/dev/null
sudo systemctl stop xinetd 2>/dev/null

# 3. Configuração do Firewall (UFW)
sudo apt-get install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Permitir SSH e HTTP
sudo ufw allow ssh
sudo ufw allow 80/tcp

# Ativar UFW
sudo ufw --force enable # --force para não precisar confirmar (não tava ativando sem isso)
sudo ufw status

# 4. Instalação e Configuração de um Servidor Web (Nginx)
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx

# 5. Configuração do TCPWrapper
# Permitindo acesso ao nginx apenas da faixa de IP "192.168.50."
echo "nginx: 192.168.56." | sudo tee -a /etc/hosts.allow
echo "nginx: ALL" | sudo tee -a /etc/hosts.deny

# 6. Desabilitar Acesso Root por SSH
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# 7. Instalação do Fail2ban
sudo apt-get install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
