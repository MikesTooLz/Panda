# Initial Setup
Run the following command to setup your Raspbery Pi and Panda for "Mars Mode". This setup is from a public post by @spleck and being made public since the cat is now out of the bag.

```bash
rm Setup.sh
wget https://github.com/MikesTooLz/Panda/raw/main/Setup.sh
sudo sh Setup.sh

```

Set Raspbery Pi's action to move speed up/down (Optional)
```
sudo wget -O MarsMode.py https://github.com/MikesTooLz/Panda/raw/main/marsmode-speed-basic.py
```

Set Raspbery Pi's action to move Media Volum up/down (Optional)
```
sudo wget -O MarsMode.py https://github.com/MikesTooLz/Panda/raw/main/marsmode-mediavolume-basic.py
```
