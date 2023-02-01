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


dialog --shadow --backtitle "KatanaOS 1.0 Uninstaller - (C) 2019-2022 Katana Computer Inc. All rights reserved." --ok-title "Uninstall" --title "Uninstall KatanaOS?"  --msgbox "Are you sure you want to uninstall KatanaOS? Press Return to uninstall, or Ctrl-C to cancel..." 35 40
clear
sleep 5s
echo "Uninstalling..."
sleep 5s
sudo rm -v -r /usr/share/rpd-wallpaper/katana
sleep 5s
sudo rm -v  /usr/share/plymouth/themes/pix/splash.png
sleep 5s
sudo mv -v /usr/share/plymouth/themes/pix/splash.katana /usr/share/plymouth/themes/pix/splash.png
sleep 5s
sudo rm -v /etc/xdg/lxsession/LXDE-pi/autostart
sleep 1s
sudo cp -v /srv/.katanabak/autostart /etc/xdg/lxsession/LXDE-pi/
sleep 1s
sudo systemctl mask shutdown-sound.service
sudo rm -v /usr/lib/systemd/system/shutdown-sound.service
sudo rm -v $HOME/.config/lxpanel/panels/left
sleep 10s
echo "Uninstall complete. To reset the desktop to original settings, right-click on the desktop, select Desktop Preferences, and go to the Defaults tab. Then you can reset the desktop. The system will reboot in 15 seconds. To restart later, hit CTRL-C now."
sleep 15s
sudo shutdown --reboot now
