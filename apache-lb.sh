#!/bin/bash

# httpd.conf file can be located here: /etc/httpd/conf/
# modules are located at /usr/lib64/httpd/modules

sudo yum update httpd

# On centos mod_headers is installed with this command
# Currently it is set to Apache/2.4.6 as of this build date
#
sudo yum install -y httpd

# Install the necessary libs to do SSL based connections
# 
sudo yum install mod_ssl openssl -y

# Create directories and copy certs/keys to the correct location
#
sudo mkdir -p /apps/apache/certs/tst-httpd
sudo cp /vagrant/certs/private.key /apps/apache/certs/tst-httpd/private.key
sudo cp /vagrant/certs/public.crt /apps/apache/certs/tst-httpd/public.crt

# Make sure that the firewall allows HTTP service
# this is not running on this Vagrant box but 
# something to keep in mind when we move to the 
# real system
#
# sudo firewall-cmd --permanent --add-service=http
# sudo firewall-cmd --permanent --add-service=https
# sudo firewall-cmd --reload

# Setting the Apache policy universally 
# will tell SELinux to treat all 
# Apache processes identically by using 
# the httpd_unified boolean. While this approach
# is more convenient, it will not give you the same 
# level of control as an approach that focuses on
# a file or directory policy.
#
# The setsebool command changes SELinux boolean values. 
# The -P flag will update the boot-time value, 
# making this change persist across reboots. 
# httpd_unified is the boolean that will tell 
# SELinux to treat all Apache processes as the same type, 
# so you enabled it with a value of 1. 
#
sudo setsebool -P httpd_unified 1

# Overwrite the conf file in the /etc/httpd/conf folder
#
sudo cp /vagrant/httpd/httpd.conf /etc/httpd/conf

# Use systemctl to start the server
#
sudo systemctl start httpd

# Enable the httpd service to start at boot
# To view the services that are listed at boot time run this command
# systemctl list-unit-files | grep enabled
# There you will see httpd.service
#
sudo systemctl enable httpd

# Use systemctl to check the servers status
#
sudo systemctl status httpd