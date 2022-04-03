#!/bin/bash

#Print colors
YEL="\033[1;33m"
GRE="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"


#sudo modprobe 8188eu
sudo ifconfig wlan0 down
sudo ifconfig wlan1 down && sleep 1
if [ $? -eq "255" ]
then
	echo "${YEL}INF${NC} :: Renaming wlxxx...${NC}"
	sudo ip link set wlx00c0ca9944b5 name wlan1
	echo "${GRE}SUCCESS${NC} :: Rename successful.${NC}"
else
	echo "${RED}ERR${NC} :: Something went horribly wrong:"$?
fi	

#lxterminal -e "sh 1wifite.sh"
sudo wifite -i wlan1 -mac --no-pmkid --daemon --skip-crack 

#sudo iwconfig wlan0 mode managed && sleep 1
sudo ifconfig wlan0 up && echo "wlan0 restored!"

zzz=10

echo "${GRE}Zzz for 10 before we exit...${NC}"
while [ $zzz -ne 0 ]
do
	echo $zzz
	zzz=$(($zzz-1))
	sleep 1
	#expr $zzz - 1
done

#sleep infinity

#sudo sh /home/pi/1wifite.sh

