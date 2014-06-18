#!/bin/bash

# if apache2 does no exist
if [ ! -f /etc/apache2/apache2.conf ];
then
	# Install MySQL
	echo 'mysql-server mysql-server/root_password password vagrant' | debconf-set-selections
	echo 'mysql-server mysql-server/root_password_again password vagrant' | debconf-set-selections
	apt-get -y install mysql-client mysql-server

	# Install Apache2
	apt-get -y install apache2
	
	# Install CURL dev package
	apt-get -y install libcurl4-openssl-dev

	# Install PHP5 support
	apt-get -y install php5 libapache2-mod-php5 php-apc php5-mysql php5-dev php5-curl

	# Enable mod_rewrite	
	a2enmod rewrite

	# Enable SSL
	a2enmod ssl
	
	a2dissite default

	# Add www-data to vagrant group
	usermod -a -G vagrant www-data

	# Restart services
	/etc/init.d/apache2 restart
fi
