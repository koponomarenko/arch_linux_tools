# Arch Linux configs and scripts

A set of scripts and configs to help with installation and configuration of Arch Linux

---
## Installation details

- x86_64 CPU
- Intel CPU and Intel IGP (integrated graphics).
- UEFI boot mode
- Only one system disk.
- GPT for the system disk
- No shared OS on this hardware - only one OS.
- Only US English locale is used.
- init system: systemd
- boot loader: GRUB
- One user account

---
## Set up tips

Options are set using environment variables.

`set_environment.sh` - sets a minimum needed environment for those tools to work.

`prepare.sh` - generates high level scripts.

Use `sudo -E <script>` to run the script with root privileges and keep the environment.

To print all packages without installing them, set `export print_pkgs=yes`.

### HiDPI boot

The Arch Linux ISO uses systemd-boot, so you can hit “e” when the menu appears and append
parameters to the kernel line (or at the very end). Setting only this one should do the work:

    video=1280x720

### Set up WiFi

https://wiki.archlinux.org/index.php/WPA_supplicant#Connecting_with_wpa_passphrase

Connect to the network

    wpa_supplicant -i <interface> -c <(wpa_passphrase MYSSID passphrase)

Then start dhcpcd for the interface

    systemctl start dhcpcd@<interface>.service

### Getting those tools

    curl -L https://github.com/koponomarenko/arch_linux_setup_tools/archive/master.tar.gz | tar zx

### logitech mx anywhere 2s

Don't forget to start `bluetoothctl` with `sudo`.

### logitech k810

Use `0000` passkey if requested.

---
## Some useful tips for a day to day work

### Detect xwayland users (apps)

Tags: `xeyes` `xwayland`

Install `xorg-xeyes` and run it using `xeyes`.

Start moving a mouse over a window. If eyes are moving - then the app is using xWayland.


### NetworkManager

Tags: `nmcli` `nmtui` `wifi`

Check status

    nmcli radio
    nmcli device

Show available networks and connect

    nmcli device wifi rescan
    nmcli device wifi list
    nmcli -a device wifi connect <SSID-name>

An alternative is `nmtui` - Text User Interface for controlling NetworkManager.

### Sound/audio control

Tags: `sound` `audio` `volume` `pulseaudio`

`pavucontrol` is a GUI volume control tool ("mixer") for PulseAudio.

### Markdown Preview

Tags: `markdown`

**grip** is a nice tool to preview a markdown file in a browser - 
https://github.com/joeyespo/grip.

    cd <dir_with_file>
    grip

or 

    grip <file_name>

