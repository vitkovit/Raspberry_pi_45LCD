#!/bin/bash

mv /etc/X11/xorg.conf.d/99-v3d.conf /etc/X11/xorg.conf.d/99-v3d.conf.bak
cp -rf ./99-calibration.conf  /etc/X11/xorg.conf.d/99-calibration.conf
cp -rf ./99-fbturbo.conf  /etc/X11/xorg.conf.d/99-fbturbo.conf
cp /.mhs35.dtb /boot/firmware/overlays/mhs35.dtb


# load module on boot
echo "hdmi_force_hotplug=1" >> /boot/firmware/config.txt
echo "dtparam=i2c_arm=on" >> /boot/firmware/config.txt
echo "dtparam=spi=on" >> /boot/firmware/config.txt
echo "enable_uart=1" >> /boot/firmware/config.txt
echo "dtoverlay=mhs35:rotate=90" >> /boot/firmware/config.txt
cp ./cmdline.txt /boot/

# touch screen calibration
apt-get install xserver-xorg-input-evdev
cp -rf /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf

# done :)
echo "reboot now"
reboot