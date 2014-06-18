#!/bin/bash

# Add the jenkins repo to the sources list.
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
# Update apt and install
apt-get update
apt-get -y install jenkins

apt-get -y install php5-cli

apt-get -y install git

# Install composer and add it to the system path
curl -sS https://getcomposer.org/installer | php 
mv composer.phar /usr/local/bin/composer

# Install Phing globally with Composer
composer global require phing/phing:2.6.1