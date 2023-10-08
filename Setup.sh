#!/bin/bash
apt-get update
apt-get install dfu-util gcc-arm-none-eabi python3-pip libffi-dev git scons screen
git clone https://github.com/commaai/panda.git
cd panda
pip install -r requirements.txt
python setup.py install
grep SUBSYS README.md | sudo tee /etc/udev/rules.d/11-panda.rules
udevadm control --reload-rules && sudo udevadm trigger
lsusb
cd board
sudo scons -u
sudo ./recover.py
sudo ln -s ~/panda/board/ /usr/local/lib/python3.9/dist-packages/pandacan-0.0.10-py3.9.egg/board
sudo ./recover.py
sudo ./flash.py
cd ..
cd ..
wget -O MarsMode.py https://github.com/MikesTooLz/Panda/raw/main/marsmode-mediavolume-basic.py
cd /etc/
wget -O rc.local https://github.com/MikesTooLz/Panda/raw/main/rc.local
cd ~
