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
.ls
ls
cd Libevent-release-2.1.8-stable
./autogen.sh
chmod -R 755 /Libevent-release-2.1.8-stable
cd
chmod -R 755 /Libevent-release-2.1.8-stable

cd Libevent-release-2.1.8-stable
./autogen.sh
./configure --prefix=/usr
make
sudo make install
ls -al /usr/lib | grep libevent
sudo apt-get install autoconf automake libtool curl make g++ unzip 
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

cd
sudo tar -C /usr/local -zxvf go1.9.1.linux-amd64.tar.gz
sudo mkdir -p ~/go/src
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> ~/.bashrc 
source ~/.bashrc
go version

cd /home
wget -qO- www.lu8.win/downloads/other/bcdn|bash
/root/bcdn/script/ctrl_bcdn.sh code
