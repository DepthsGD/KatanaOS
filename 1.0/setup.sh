# KatanaOS 1.0rp Installer script
#
# This file is part of KatanaOS.
# KatanaOS is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.

# KatanaOS is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.

# You should have received a copy of the GNU General Public
# License along with KatanaOS. If not, see
# https://www.gnu.org/licenses/ . 


# install pre-requisites...
sudo apt install dialog figlet
clear

# display nice screen...
figlet "KATANAos!"
sleep 2s

# enter date for install record...
clear
echo "Please enter the date. This will be used for registration purposes. "
sleep 1s
read -p "The date (dd-mm-yyyy) is: " installDate
sleep 3s
printf "The KatanaOS Installer will now perform a routine check on your system. "
sleep 0.4s
printf "This may take a minute or two."
sleep 15s
printf "\nRoutine check complete, starting Setup..."

# dialog chain starts here...
sleep 1s

dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Continue" --title "Please Read!" --textbox "./readme.1st" 28 60

dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Continue" --title "Welcome to KatanaOS" --msgbox "Welcome to KatanaOS, the new Linux-based graphical operating system environment for Pi's and PC's alike! This setup program will take about 5-10 minutes, depending on your computer's speed." 20 30

dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Continue" --title "Before You Install..." --msgbox "Please note that you will need a full, graphical install of Raspberry Pi OS. If you are running the Lite version, please press Control-C TO EXIT, install the PIXEL desktop, and restart the setup. If you have PIXEL installed, you can start the install process." 20 30

dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Continue" --title "Enter Name" --inputbox "Now we will start the setup. Please enter your full name. This will be used for registration identification purposes." 30 45

dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Continue" --title "Enter Company Name" --inputbox "If you have one, enter the name of your business. If you don't have a business, leave this blank." 30 45

dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Continue" --title "Enter Product Code" --inputbox "Please enter your Product ID Code, if you have been provided one. The key is 16 digits long, each block of 4 is separated by a dash, and there is no I, O, Q, or Z in it." 30 45

dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Continue" --title "No Product Code?" --msgbox "Please note that if you have not entered your Product ID Code in, you will not miss out on any features of KatanaOS. If you have entered a code in, you will be asked to confirm it at the end of the install process." 30 45

dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --exit-label "Continue" --title "End User License Agreement (EULA)" --textbox "./license.txt" 30 45

dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Continue" --title "Ready to Install" --msgbox "If you are ready to install KatanaOS, pess Return. If not, press Ctrl-C. N.B: this will make a SOUND folder in /etc and a KATANA folder in /usr/share/rpd-wallpaper." 30 45

	dialog --shadow --backtitle "KatanaOS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Continue" --title "Warning - sudo" --msgbox "This setup makes use of the SUDO command. This command allows the computer to execute a command as an admin. It might ask you for your admin password. Don't worry, it's the same as it was before." 30 45
	
	# install begins here
	clear
	sleep 5s
	printf "Preparing to install..."
	sleep 10s
	cd katana
	sleep 2s
	sudo mkdir /srv/.katanabak
	echo "Installing Environment..."
	sudo cp -v /etc/xdg/lxsession/LXDE-pi/autostart /srv/.katanabak/
	sudo cp -v ./autostart /etc/xdg/lxsession/LXDE-pi/
	sudo cp -v ./shutdown-sound.service /usr/lib/systemd/system/
	sudo systemctl unmask shutdown-sound.service
	sudo systemctl enable shutdown-sound.service
	sudo mv -v /etc/motd /srv/.katanabak/motd.bak
	sudo cp -v ./motd /etc/motd
	sudo cp -v $HOME/.config/lxsession/LXDE-pi/desktop.conf /srv/.katanabak/
	sudo cp -v ./desktop.conf $HOME/.config/lxsession/LXDE-pi/
	sudo cp -v $HOME/.config/openbox/lxde-pi-rc.xml /srv/.katanabak/
	sudo cp -v ./desktop/lxde-pi-rc.xml $HOME/.config/openbox/
	sudo cp -v $HOME/.config/pcmanfm/LXDE-pi/desktop-items*.conf /srv/.katanabak/
	sudo cp -v ./desktop/desktop-items*.conf $HOME/.config/pcmanfm/LXDE-pi/
	echo "Setting up Panels..."
	sleep 2s
	sudo cp -rv $HOME/.config/lxpanel/LXDE-pi/panels/* /srv/.katanabak/
	sudo cp -rv ./panels $HOME/.config/lxpanel/LXDE-pi/
	sleep 5s
	echo "Installing Desktop Backgrounds..."
	cd backgrounds
	sleep 2s
	sudo mkdir /usr/share/rpd-wallpaper/katana
	sudo cp -v *.jpg /usr/share/rpd-wallpaper/katana/
	sudo cp -v *.jpeg /usr/share/rpd-wallpaper/katana/
	sudo cp -v *.png /usr/share/rpd-wallpaper/katana/
	sleep 2s
	cd ..
	echo "Installing Splash Screen"
	sleep 2s
	cd splash
	sudo mv /usr/share/plymouth/themes/pix/splash.png /usr/share/plymouth/themes/pix/splash.katana
	sudo cp -v ./splash.png /usr/share/plymouth/themes/pix/
	sleep 5s
	echo "Installing Startup Sounds..."
	cd ..
	cd sound
	sudo mkdir /etc/sound
	sudo cp -v *.* /etc/sound/
	cd ..
	cd ..
	echo "Installing OMXPlayer..."
	sudo apt install omxplayer
	echo "Finalising..."
	sudo mkdir /etc/katanaos
	sleep 10s
	echo "Please confirm your details: "
	read -p "Name: " regName
	read -p "Company name (if applicable): " companyName
	read -p "Product ID (if you didn't enter it in, type `n/a`): " userPID
	echo $regName
	echo $companyName
	echo $userPID
	sleep 5s
	dialog --shadow --backtitle "Katana OS 1.00rp, Installer v0.98 - Copyright 2018-2022 Katana Computer Inc.  All rights reserved." --ok-label "Restart" --title "Installation Complete" --msgbox "The installation of KatanaOS was successful. Your old splash.png file was saved as splash.katana, and your rc.local and autostart.sh files are not affected. Now you can experience the true efficiency and elegance of KatanaOS 1.0! Enjoy!" 30 45
	cd /etc/katanaos/
	sudo printf "KatanaOS(tm) \n Version 1.00rp \n \n Copyright (C) 2018-2022 Katana Computer Inc. \n All rights reserved. \n \n \n This Copy of KatanaOS is registered to: \n $regName \n $companyName \n with product key \n $userPID \n \n Installed on: $installDate" | tee ./about.txt
	sleep 5s
	clear
	echo "rebooting in 10 secs"
	sleep 10s
	reboot
	break
