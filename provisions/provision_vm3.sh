#!/bin/bash

echo "Iniciando o hardening básico..."

# Hardening básico
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install ufw -y
sudo apt-get install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "Configurando firewall."

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw --force enable
sudo ufw status

echo "Instalando ferramentas de invasão..."

# Ferramenta de escaneamento
sudo apt-get install nmap -y

echo "Ferramentas de escaneamento instaladas."

# Escanear por vulnerabilidades na VM1
nmap -sV --script=default,vuln 192.168.56.10 > /tmp/nmap_vuln_scan.txt

echo "Escaneamento de vulnerabilidades concluído."
