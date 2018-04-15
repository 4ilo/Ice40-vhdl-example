#!/bin/bash
echo 24 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio24/direction

dd if=/dev/zero of=/home/pi/ice40/image bs=2M count=1

dd if=/home/pi/ice40/data.bin conv=notrunc of=/home/pi/ice40/image

/usr/local/sbin/flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=20000 -w /home/pi/ice40/image

echo in > /sys/class/gpio/gpio24/direction
