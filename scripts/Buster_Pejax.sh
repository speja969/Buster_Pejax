#!/bin/bash

sudo apt update && sudo apt upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.config

mkdir ~/.config/openbox

mkdir ~/.config/tint2

mkdir ~/.scripts

sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free && sudo apt-add-repository 'deb http://deb.debian.org/debian buster-backports main contrib non-free'

sudo apt-get update

sudo apt-get -t buster-backports install -y micro

sudo apt-get install -y openbox obconf rxvt-unicode mousepad firefox-esr pcmanfm nitrogen tint2 menu pulseaudio pavucontrol gnome-backgrounds mate-backgrounds mlocate lxappearance vlc arandr apt-file synaptic firmware-linux firmware-linux-nonfree doublecmd-common xutils mesa-utils xarchiver htop disk-manager sysstat acpi hardinfo hddtemp wicd k3b i3lock aptitude gnome-disk-utility python3-pip python-pip materia-gtk-theme deepin-icon-theme ttf-mscorefonts-installer fonts-ubuntu fonts-ubuntu-console suckless-tools simplescreenrecorder font-manager ranger geany gdebi lightdm fbxkb mpv curl gmrun xscreensaver xterm pnmixer sxiv scrot xsettingsd ffmpeg git qbittorrent wmctrl

cp ~/Buster_Pejax/dotfiles/tint2rc ~/.config/tint2

cp ~/Buster_Pejax/dotfiles/autostart.sh ~/.config/openbox

cp ~/Buster_Pejax/dotfiles/.Xresources ~/

cp ~/Buster_Pejax/dotfiles/rc.xml ~/.config/openbox

cp ~/Buster_Pejax/dotfiles/menu.xml ~/.config/openbox

cp ~/Buster_Pejax/dotfiles/keyboard.sh ~/

sudo cp ~/Buster_Pejax/dotfiles/rs.png /usr/share/fbxkb/images/rs.png

mkdir ~/.config/mpv

cp ~/Buster_Pejax/dotfiles/mpv.conf ~/.config/mpv



# korekcija autorizacije za gdebi
sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy


sudo chmod --recursive 777 ~/.config/openbox
sudo chmod 777 ~/keyboard.sh

mkdir -p ~/Documents/DEB

## WPS Office
wget --no-check-certificate http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9615/wps-office_11.1.0.9615.XA_amd64.deb -O ~/Documents/DEB/wps-office_11.1.0.9615.XA_amd64.deb

## DeadBeef muzički plejer
wget --no-check-certificate https://sourceforge.net/projects/deadbeef/files/travis/linux/1.8.4/deadbeef-static_1.8.4-1_amd64.deb/download -O ~/Documents/DEB/deadbeef-static_1.8.4-1_amd64.deb

## XnView MP pregledač slika
wget --no-check-certificate https://download.xnview.com/XnViewMP-linux-x64.deb -O ~/Documents/DEB/XnViewMP-linux-x64.deb


## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp ~/Buster_Pejax/scripts/debinfo /usr/bin
sudo chmod 777 /usr/bin/debinfo
echo debinfo >> ~/.bashrc

## instalacija comptona
cp ~/Buster_Pejax/scripts/install_compton.sh ~/.scripts
mkdir ~/bin
cp ~/Buster_Pejax/dotfiles/start-compton.sh ~/bin

## instalacija ncmpcpp
cp ~/Buster_Pejax/scripts/install_ncmpcpp.sh ~/.scripts

## screeny
cp ~/Buster_Pejax/scripts/screeny ~/.scripts

## reinstall youtube-dl
cp ~/Buster_Pejax/scripts/reinstall_youtube-dl.sh ~/.scripts

mkdir ~/projects
cd ~/projects
git clone https://github.com/speja969/debian-openbox.git

sudo chmod --recursive 777 ~/projects
sudo chmod --recursive 777 ~/.scripts

cd ~/projects/debian-openbox/10_openbox_terminator
sudo ./install.sh

cd ~/projects/debian-openbox/10_openbox_arc-theme-gtk
sudo ./install.sh

cd ~/projects/debian-openbox/10_openbox_numix-paper-icons
sudo ./install.sh

cd ~/projects/debian-openbox/install_wpsoffice
sudo ./install.sh

cd ~/projects/debian-openbox/script_install_dt-dark-theme
sudo ./install.sh

sudo cp ~/Buster_Pejax/WALLPAPERS/wallpapers-pixabay/kuala-lumpur-1820944_1920.jpg /usr/share/images/desktop-base
sudo chmod 777 /usr/share/images/desktop-base/kuala-lumpur-1820944_1920.jpg
sudo sed -i 's!#background=!background=/usr/share/images/desktop-base/kuala-lumpur-1820944_1920.jpg!' /etc/lightdm/lightdm-gtk-greeter.conf



