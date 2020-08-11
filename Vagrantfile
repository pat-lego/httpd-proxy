# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  config.vm.define "apache_lb" do |apache_lb|
    apache_lb.vm.box = "bento/centos-7.7"

    apache_lb.vm.network "public_network", ip: "192.168.0.151", bridge: "en0: Wi-Fi (Wireless)"
    
    apache_lb.vm.provision :shell, path: "apache-lb.sh"
  end

  config.vm.define "apache_web", primary: true do |apache_web|
    apache_web.vm.box = "bento/centos-7.7"

    apache_web.vm.network "public_network", ip: "192.168.0.152", bridge: "en0: Wi-Fi (Wireless)"

    apache_web.vm.provision :shell, path: "apache-web.sh"
  end
end
