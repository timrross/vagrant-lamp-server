# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/precise64"

  config.vm.hostname = "sandbox.dev"
  
  config.vm.network "private_network", ip: "192.168.56.101"

  config.vm.synced_folder "../", "/mnt/workspace"
  
  config.vm.provider "virtualbox" do |vb|
	#vb.gui = true
  	vb.name = "sandbox"
    vb.memory = "512"
  end
  
  config.vm.provision :shell, path: "scripts/update-package-manager.sh"
  config.vm.provision :shell, path: "scripts/install-essential.sh"
  config.vm.provision :shell, path: "scripts/install-lamp.sh"
  config.vm.provision :shell, path: "scripts/install-phpmyadmin.sh"
  config.vm.provision :shell, path: "scripts/cleanup.sh"

end
