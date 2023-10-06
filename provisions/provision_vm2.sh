#!/bin/bash

echo "Iniciando o hardening básico..."

# Hardening básico
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install ufw -y
sudo apt-get install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "Ativando ufw\n\n."

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw --force enable
sudo ufw status

echo "Instalando ferramentas de análise..."

# Ferramentas de análise
sudo apt-get install curl nmap -y

echo "Ferramentas de análise instaladas."

echo "Tentando acessar o servidor web da VM1..."

# Tentativa de acesso ao servidor web da VM1
curl http://192.168.56.10 > /tmp/vm1_response.html

echo "Acesso ao servidor web da VM1 concluído."

echo "Escanear portas abertas na VM1..."

# Escanear portas abertas na VM1
nmap 192.168.56.10 > /tmp/nmap_scan.txt

echo "Escanemento de portas concluído."
