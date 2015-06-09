#!/bin/sh
# Author: Kenny
# Website: http://zhsunlight.cn, http://zhflash.com
#

odoo_url = https://github.com/buggy778/odoo-cn/archive/8.0.zip
odoo_runtime = https://github.com/buke/GreenOdoo-Runtime/archive/linux64.zip

rm -rf /etc/init.d/od8
rm -rf /etc/init.d/pg8
cp od8 /etc/init.d
cp pg8 /etc/init.d
chmod 755 /etc/init.d/od8
chmod 755 /etc/init.d/pg8
chown root: /etc/init.d/od8
chown root: /etc/init.d/pg8
chkconfig --levels 235 od8 on
chkconfig --levels 235 pg8 on

useradd openerp
sudo apt-get install wget unzip gcc
cd /tmp
wget $odoo_url -O odoo.zip
wget $odoo_runtime -O runtime.zip
unzip odoo.zip
mv odoo /home/od8
rm -fr odoo.zip
unzip runtime.zip
mv runtime /home/od8
rm -fr runtime.zip
mkdir /home/od8/log
chown -R openerp:openerp /home/od8

wget http://zhflash.com/wp-content/download/start-stop-daemon.zip
unzip start-stop-daemon.zip
cd start-stop-daemon
gcc start-stop-daemon.c -o start-stop-daemon
cp start-stop-daemon /usr/sbin/
cd ..
rm -rf start-stop-daemon
rm -rf start-stop-daemon.zip

service pg8 start
service od8 start
