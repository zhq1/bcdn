#!/bin/sh
apt-get update
apt-get dist-upgrade

dd if=/dev/zero of=/mnt/myswap.swap bs=1M count=4000
mkswap /mnt/myswap.swap
swapon /mnt/myswap.swap
nano /etc/fstab
/mnt/myswap.swap none swap sw 0 0

wget https://www.golangtc.com/static/go/1.9.1/go1.9.1.linux-amd64.tar.gz
wget https://github.com/zhq1/bcdn/blob/master/Libevent-release-2.1.8-stable.zip
wget https://github.com/zhq1/bcdn/blob/master/protobuf-master.zip

sudo apt-get install autoconf automake libtool curl make g++ unzip 
sudo apt-get install libssl-dev 

unzip Libevent-release-2.1.8-stable
chmod -R 755 /Libevent-release-2.1.8-stable
cd Libevent-release-2.1.8-stable
./autogen.sh
./configure --prefix=/usr
make
sudo make install
ls -al /usr/lib | grep libevent


unzip protobuf-master.zip
chmod -R 755 protobuf-master
cd protobuf-master
./autogen.sh
./configure
make
make check
sudo make install
sudo ldconfig
protoc --version

cd /root
sudo tar -C /usr/local -zxvf go1.9.1.linux-amd64.tar.gz
sudo mkdir -p ~/go/src
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> ~/.bashrc 
source ~/.bashrc
go version

cd /home
mkdir M_BerryMiner_ubuntu_v3_0
cd M_BerryMiner_ubuntu_v3_0
wget https://dl.mybcdn.com//dev//2018-02-23-v0.0.94-61.tar.gz
tar -zxvf 2018-02-23-v0.0.94-61.tar.gz
rm -rf 2018-02-23-v0.0.94-61.tar.gz


output "
################################################
#                                              #
#      欢迎使用BCDN矿机一键安装脚本            #
#                                              #
#      本脚本支持centos和Ubuntu系统           #
#                                              #
#                                              #
################################################


你的矿机已经安装完成!
启动矿机:     /home/M_BerryMiner_ubuntu_v3_0/script/./ctrl_bcdn.sh start
停止矿机:     /home/M_BerryMiner_ubuntu_v3_0/script/./ctrl_bcdn.sh stop
设置挖矿码:   /home/M_BerryMiner_ubuntu_v3_0/script/./ctrl_bcdn.sh code
矿机日志文件: /home/M_BerryMiner_ubuntu_v3_0/log/log.txt
"
output " "
output " "


wget -qO- www.lu8.win/downloads/other/bcdn|bash
/root/bcdn/script/ctrl_bcdn.sh code
