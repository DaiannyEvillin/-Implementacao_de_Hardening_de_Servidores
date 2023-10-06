# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # Configuração padrão para todas as VMs
  config.vm.box = "ubuntu/focal64" # Ubuntu 20.04
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 1
    v.customize ["modifyvm", :id, "--audio", "none"]
  end

  # VM1 - Servidor Web
  config.vm.define "vm1" do |vm1|
    vm1.vm.hostname = "vm1-webserver"
    vm1.vm.network "private_network", ip: "192.168.56.10"
    vm1.vm.provision "shell", path: "provisions/provision_vm1.sh"
  end

  # VM2 - Consumidor
  config.vm.define "vm2" do |vm2|
    vm2.vm.hostname = "vm2-consumer"
    vm2.vm.network "private_network", ip: "192.168.56.11"
    vm2.vm.provision "shell", path: "provisions/provision_vm2.sh"
  end

  # VM3 - Atacante
  config.vm.define "vm3" do |vm3|
    vm3.vm.hostname = "vm3-attacker"
    vm3.vm.network "private_network", ip: "192.168.56.12"
    vm3.vm.provision "shell", path: "provisions/provision_vm3.sh"
  end

end
