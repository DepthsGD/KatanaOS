# KatanaOS
Alternative desktop environment mod for the PIXEL desktop
---

KatanaOS is a transformation pack for Linux users running the PIXEL desktop environment. It does not intend to mimic anything, but rather, be something of its own.

---

## Requirements to use it:
- Raspberry Pi OS or other distro w/ PIXEL desktop
- about 10 MB of hard disk space
- an empty `/srv` folder (preferably)

---

## Installation instructions

1. Log on to your target system as the user you want to install KatanaOS for, **IN A TERMINAL, NOT ONTO A DESKTOP**.
2. Either clone the repo or extract the release .zip file to your home folder. `cd` into the folder once extracted, and run `chmod a+x ./setup.sh` to make the setup executable.
3. Run `./setup.sh` as superuser. Follow the on-screen instructions. **N.B. When asked for a Product ID Code, leave the field(s) blank!**
4. After a reboot, you should be able to login onto the desktop.

## Uninstallation

To uninstall, just go back to the folder where you ran the setup and instead, run `./uninstall.sh`. Afterwards, you can right-click on the desktop, select Desktop Preferences, go to the Defaults tab, and select the default for your screen size.
