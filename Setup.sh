#!/bin/bash
apt-get update
sudo apt-get update
sudo apt-get install dfu-util gcc-arm-none-eabi python3-pip libffi-dev git scons screen
git clone https://github.com/commaai/panda.git
cd panda
pip install -r requirements.txt
sudo python setup.py install
grep SUBSYS README.md | sudo tee /etc/udev/rules.d/11-panda.rules
sudo udevadm control --reload-rules && sudo udevadm trigger
lsusb
cd board
scons -u
./recover.py
sudo ln -s ~/panda/board/ /usr/local/lib/python3.9/dist-packages/pandacan-0.010-py3.9.egg/board
./recover.py
./flash.py
cd ..
cd ..
wget -O MarsMode.py https://github.com/MikesTooLz/Panda/raw/main/marsmode-mediavolume-basic.py
cd /etc/
sudo wget -O rc.local https://github.com/MikesTooLz/Panda/raw/main/rc.local
cd ~
