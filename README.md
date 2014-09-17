# Vagrant LAMP server 

This is a collection of shell scripts I am using setting up a LAMP vagrant box 
with ubuntu 14.04 (LTS)

The box is automatically downloaded from <https://vagrantcloud.com/ubuntu/boxes/trusty64>

## Shell files

### update-package-manager.sh 

Updates apt with the file within `etc/apt/sources.list`.

### install-essential.sh

Installs build-essential, vim, openssl, curl

### install-lamp.sh

Installs apache2, php5, mysql-server, mysql-client, openssl, mod_rewrite, ssl.

disables the default apache site and adds vagrant to the www-data group

### install-nfs.sh

Installs the nfs client. Required when using the vagrant NFS setting.

### install-phpmyadmin.sh 

Installs phpmyadmin with pre-answers questions.

### install-jenkins.sh

Installs Jenkins CI, php5-cli, git, composer and phing

### cleanup.sh

Cleans up downloaded packages.

## Example vagrantfile

    Vagrant::Config.run do |config|
      config.vm.box = "ubuntu/trusty64"

      config.vm.provision :shell, path: "scripts/update-package-manager.sh"
      config.vm.provision :shell, path: "scripts/install-essential.sh"
      config.vm.provision :shell, path: "scripts/install-lamp.sh"
      config.vm.provision :shell, path: "scripts/install-phpmyadmin.sh"
      config.vm.provision :shell, path: "scripts/cleanup.sh"
    end
