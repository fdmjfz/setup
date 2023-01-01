#!/bin/bash

#Install Dependencies
sudo apt update -y
sudo apt-get update -y
sudo apt upgrade -y
sudo apt-get upgrade -y

sudo apt install libatlas-base-dev
sudo apt-get install git

# install correct version protobuf
sudo -H pip install --upgrade protobuf==3.20.0

#Python Packages
sudo apt update -y
sudo apt install -y python3-pip
pip install --upgrade
pip install -r requirements.txt
#Tensorflow
git clone -b v0.23.1 --depth=1 --recursive https://github.com/tensorflow/io.git
cd io
python3 setup.py -q bdist_wheel --project tensorflow_io_gcs_filesystem
cd dist
sudo -H pip3 install tensorflow_io_gcs_filesystem-0.23.1-cp39-cp39-linux_aarch64.whl
cd ~
