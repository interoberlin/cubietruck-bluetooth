Getting your Broadcom USB device recognized by Linux

# Introduction #

When adding a new Broadcom USB device to Linux,
configuration steps are needed to get the device
recognized by the OS and useable.


# Details #

The command lsusb(1) will display the VID/PID
of all attached USB devices

```
mpm@mpm-Latitude-E6400:~$ lsusb
Bus 008 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 007 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 006 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 005 Device 002: ID 0a5c:5801 Broadcom Corp. BCM5880 Secure Applications Processor with fingerprint swipe sensor
Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 003 Device 005: ID 413c:8156 Dell Computer Corp. Wireless 370 Bluetooth Mini-card
Bus 003 Device 004: ID 413c:8158 Dell Computer Corp. Integrated Touchpad / Trackstick
Bus 003 Device 003: ID 413c:8157 Dell Computer Corp. Integrated Keyboard
Bus 003 Device 002: ID 0a5c:4500 Broadcom Corp. BCM2046B1 USB 2.0 Hub (part of BCM2046 Bluetooth)
Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 002 Device 002: ID 03f0:4607 Hewlett-Packard 
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

The BCM2046B1 device is on Bus 003 Device 002 and has a VID/PID
of 0a5c:4500

The new device can be added to the Bluetooth USB Linux Driver
by issuing the following command

```
# echo 0x0a5c 0x4500 > /sys/bus/usb/drivers/btusb/new_id
```



