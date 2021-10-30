#!/bin/bash
# Installs Java https://github.com/rpardini/adoptium-deb-installer
clear
echo 'Would you like to install Java? (y/n)'
read -p "y/n:" bool
if [ $bool == "y" ]
then
apt-get install gnupg gnupg1 gnupg2
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A1EAC8B7
echo 'deb https://rpardini.github.io/adoptium-deb-installer stable main' > /etc/apt/sources.list.d/rpardini-adoptium.list
apt-get update
apt-get install adoptium-17-installer
fi
# Downloads PaperMC and creates a run script
clear
cd
mkdir PaperMC
cd PaperMC
echo 'Select a build from here: https://papermc.io/downloads'
read -p "Preferred Build URL:" URL
wget -O paperclip.jar $URL
echo 'java -Xms2G -Xmx2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paperclip.jar --nogui' > run.sh
chmod 777 run.sh
