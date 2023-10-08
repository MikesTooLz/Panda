#!/bin/bash
apt-get update
apt-get install dfu-util gcc-arm-none-eabi python3-pip libffi-dev git scons screen
sleep 5
git clone https://github.com/commaai/panda.git
sleep 5
cd panda
pip install -r requirements.txt
sleep 5
python setup.py install
sleep 5
grep SUBSYS README.md | sudo tee /etc/udev/rules.d/11-panda.rules
udevadm control --reload-rules && sudo udevadm trigger
lsusb
cd board
sudo scons -u
sleep 5
sudo ln -s ~/panda/board/ /usr/local/lib/python3.9/dist-packages/pandacan-0.0.10-py3.9.egg/board
sudo ./recover.py
sleep 10
sudo ./flash.py
cd ..
cd ..
wget -O MarsMode.py https://github.com/MikesTooLz/Panda/raw/main/marsmode-mediavolume-basic.py
cd /etc/
wget -O rc.local https://github.com/MikesTooLz/Panda/raw/main/rc.local
cd ~
