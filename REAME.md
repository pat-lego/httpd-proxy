# BTS Apache HTTPD System

Server used to proxy AEM and provide mod_proxy functionality.

## Required Software

1. Vagrant 2.2.x
2. VirtualBox 6.1

## How to setup

From the root of the project open a terminal and run `vagrant up` this will setup the following systems

1. Apache HTTPD project as the primary (apache_web)
2. Apache HTTPD project as the load balancer (apache_lb)

### Ports

443 -> apache_web
80 -> apache_lb

### Default URL

Default Page: https://192.168.0.151

This should load the following [webpage](html/apache-web.html)

## Recommendations

Install the following plugin to facilitate development: https://github.com/mpty-ltd/vscode-pack-apache/

## SSL

Currently the PWD is set to `password` for the private.key file

## Notes

There is a possibility that the bridged network name is not `en0: Wi-Fi (Wireless)` if this is the case in your environment you will need to locate the name and replace it as the option. 

Second issue is that the static ip I gave these machines may be inaccessible in your environment and for that reason you will need to locate an address that your home router can provide. 

## Contributors

[Patrique Legault](https://github.com/pat-lego)
[Guillaume Clement](https://github.com/guillaumecleme)