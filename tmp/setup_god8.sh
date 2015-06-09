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
sudo chkconfig --levels 235 od8 on
sudo chkconfig --levels 235 pg8 on

sudo useradd openerp
sudo apt-get install wget unzip gcc
cd /tmp
sudo wget $odoo_url -O odoo.zip
wget $odoo_runtime_url -O runtime.zip
unzip odoo.zip
sudo mv odoo /home/od8
rm -fr odoo.zip
unzip runtime.zip
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
