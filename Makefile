#******************************************************************************
#*
#*  Copyright (C) 2009-2012 Broadcom Corporation
#*
#*  Licensed under the Apache License, Version 2.0 (the "License");
#*  you may not use this file except in compliance with the License.
#*  You may obtain a copy of the License at
#*
#*      http://www.apache.org/licenses/LICENSE-2.0
#*
#*  Unless required by applicable law or agreed to in writing, software
#*  distributed under the License is distributed on an "AS IS" BASIS,
#*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#*  See the License for the specific language governing permissions and
#*  limitations under the License.
#*
#******************************************************************************

LDLIBS = -lbluetooth
CFLAGS=-g

all : brcm_patchram_plus brcm_patchram_plus_h5 brcm_patchram_plus_usb

brcm_patchram_plus_h5 : brcm_patchram_plus_h5.o

brcm_patchram_plus : brcm_patchram_plus.o

brcm_patchram_plus_usb : brcm_patchram_plus_usb.o

dependencies:
	apt-get update
	apt-get install bluez libbluetooth3 libbluetooth-dev -y

modprobe:
	for module in rfcomm bnep hci_uart bluetooth hidp; do modprobe $$module; done

load: modprobe
	echo -n "" > /dev/ttyS1
	sleep 1
	./brcm_patchram_plus -d --patchram /lib/firmware/ap6210/bcm20710a1.hcd --enable_hci --bd_addr 11:22:33:44:55:66 --no2bytes --tosleep 1000 /dev/ttyS1
	hciattach /dev/ttyS1 any

test:
	hciconfig -a
	hcitool dev
	hcitool scan

