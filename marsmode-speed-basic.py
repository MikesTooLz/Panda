#marsmode-speed-basic by @spleck

import binascii
import time
import random
from panda import Panda

p = Panda()

p.set_can_speed_kbps(0,500)
p.set_safety_mode(Panda.SAFETY_ALLOUTPUT)

while True:
        try:
                p.can_send(0x3c2,b"\x29\x55\x00\x3F\x00\x00\x00\x00",0) # speed Down
                print("Speed -1")
                time.sleep(0.3)
                print("Speed +1")
                p.can_send(0x3c2,b"\x29\x55\x00\x01\x00\x00\x00\x00",0) # speed up
                time.sleep(4+random.uniform(0,4))
        except Exception as e:
                print("Exception caught ",e)
                time.sleep(3.2)
