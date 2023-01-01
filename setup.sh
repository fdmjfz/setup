#!/bin/bash

#Install Dependencies
sudo apt update -y
sudo apt upgrade -y

#Get custom packages
sudo apt install git
cd ..
mkdir python
git clone https://github.com/fdmjfz/documentacion.git
cd python
git clone https://github.com/fdmjfz/secretron.git
git clone https://github.com/fdmjfz/weatherstation.git
git clone https://github.com/fdmjfz/rpi-python.git
mv rpi-python old-python
cd ..

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
