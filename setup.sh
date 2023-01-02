#!/bin/bash

#Get custom packages
cd ..
rm -rf python
mkdir python
rm -rf documentacion
git clone https://github.com/fdmjfz/documentacion.git
rm -rf LCD-show
git clone https://github.com/goodtft/LCD-show.git

cd python
rm -rf oled
git clone https://github.com/fdmjfz/oled.git
rm -rf secretron
git clone https://github.com/fdmjfz/secretron.git
rm -rf weatherstation
git clone https://github.com/fdmjfz/weatherstation.git
rm -rf old-python
rm -rf rpi-python
git clone https://github.com/fdmjfz/rpi-python.git
mv rpi-python old-python
cd ..


if [ "$1" == all ] ; then
#Install Dependencies
sudo apt update -y
sudo apt upgrade -y

#Packages
sudo apt install git

#Python Packages
sudo apt update -y
sudo apt install libatlas-base-dev
sudo apt install -y python3-pip
pip install --upgrade
pip install -r requirements.txt
# install correct version protobuf
pip install --upgrade protobuf

#QMK Keyboard setup
python3 -m pip install --user qmk
qmk setup
wget https://www.pjrc.com/teensy/teensy_linuxarm64.tar.gz
tar -xf teensy_linuxarm64.tar.gz
rm teensy_linuxarm64.tar.gz

fi

if [ "$1" == screen ] ; then
#7" LCD HDMI Screen
chmod -R 755 LCD-show
cd LCD-show
sudo ./LCD7C-show

fi
