#!/bin/sh
# Author: Kenny
# Website: http://zhsunlight.cn, http://zhflash.com
#

odoo_url=https://github.com/buggy778/odoo-cn/archive/8.0.zip
odoo_runtime_url=https://github.com/buke/GreenOdoo-Runtime/archive/linux64.zip
ssd_url=http://zhflash.com/wp-content/download/start-stop-daemon.zip

sudo rm -rf /etc/init.d/od8
sudo rm -rf /etc/init.d/pg8
sudo cp od8 /etc/init.d
sudo cp pg8 /etc/init.d
sudo chmod 755 /etc/init.d/od8
sudo chmod 755 /etc/init.d/pg8
sudo chown root: /etc/init.d/od8
sudo chown root: /etc/init.d/pg8
sudo update-rc.d od8 defaults
sudo update-rc.d pg8 defaults

sudo useradd openerp
sudo apt-get install wget unzip gcc
cd /tmp
rm -fr *
sudo rm -fr /home/od8/*
wget $odoo_url -O odoo.zip
wget $odoo_runtime_url -O runtime.zip
unzip odoo.zip
mv odoo-cn-8.0 odoo
sudo mv odoo /home/od8
rm -fr odoo.zip
unzip runtime.zip
mv GreenOdoo-Runtime runtime
sudo mv runtime /home/od8
rm -fr runtime.zip
sudo mkdir /home/od8/log
sudo chown -R openerp:openerp /home/od8

wget $ssd_url
unzip start-stop-daemon.zip
cd start-stop-daemon
sudo gcc start-stop-daemon.c -o start-stop-daemon
sudo cp start-stop-daemon /usr/sbin/
cd ..
rm -rf start-stop-daemon
rm -rf start-stop-daemon.zip

service pg8 start
service od8 start
