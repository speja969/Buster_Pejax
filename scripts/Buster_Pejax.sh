#!/bin/bash

sudo apt update && sudo apt upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.config

sudo chmod 777 ~/.config

mkdir ~/.config/openbox

mkdir ~/.config/tint2

mkdir ~/.scripts

sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free && sudo apt-add-repository 'deb http://deb.debian.org/debian buster-backports main contrib non-free'

sudo apt-get update

sudo apt-get -t buster-backports install -y micro

sudo apt-get install -y openbox obmenu obconf rxvt-unicode mousepad firefox-esr pcmanfm tint2 menu pulseaudio pavucontrol mlocate lxappearance vlc arandr apt-file synaptic firmware-linux firmware-linux-nonfree doublecmd-common xutils mesa-utils xarchiver htop disk-manager sysstat acpi hardinfo hddtemp wicd k3b i3lock aptitude gnome-disk-utility python3-pip python-pip ttf-mscorefonts-installer fonts-ubuntu fonts-ubuntu-console suckless-tools simplescreenrecorder font-manager ranger geany gdebi lightdm fbxkb mpv curl gmrun xscreensaver galternatives pnmixer sxiv scrot xsettingsd ffmpeg git qbittorrent wmctrl

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

## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp ~/Buster_Pejax/scripts/debinfo /usr/bin
sudo chmod 777 /usr/bin/debinfo
echo debinfo >> ~/.bashrc

## instalacija comptona
cp ~/Buster_Pejax/scripts/install_compton.sh ~/.scripts
mkdir ~/bin
cp ~/Buster_Pejax/dotfiles/start-compton.sh ~/bin
sudo chmod --recursive 777 ~/bin

## instalacija ncmpcpp
cp ~/Buster_Pejax/scripts/install_ncmpcpp.sh ~/.scripts

## screeny
cp ~/Buster_Pejax/scripts/screeny ~/.scripts

## reinstall youtube-dl
cp ~/Buster_Pejax/scripts/reinstall_youtube-dl.sh ~/.scripts

## obmenu-generator
cp ~/Buster_Pejax/scripts/obmenu-generator.sh ~/.scripts

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

# Copy wallpapers folderes
sudo cp -r ~/Buster_Pejax/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -r ~/Buster_Pejax/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds

sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!kuala-lumpur-1820944_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/kuala-lumpur-1820944_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
cd ~/projects/debian-openbox/15_openbox_wallpaper-packs
sudo ./install.sh

sudo cp ~/Buster_Pejax/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
sudo chmod 777 /usr/share/images/desktop-base/lightdm_login.jpg
sudo sed -i 's!#background=!background=/usr/share/images/desktop-base/lightdm_login.jpg!' /etc/lightdm/lightdm-gtk-greeter.conf

sudo chown --recursive $USER:$USER .

## install obmenu-generator

#echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/home:Head_on_a_Stick:obmenu-generator.list

#sudo sed -i 's!deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /!deb [trusted=yes] http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /!' /etc/apt/sources.list.d/home:Head_on_a_Stick:obmenu-generator.list

#curl -fsSL https://download.opensuse.org/repositories/home:Head_on_a_Stick:obmenu-generator/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:Head_on_a_Stick:obmenu-generator.gpg > /dev/null

#sudo apt update

#sudo apt install -y obmenu-generator

#obmenu-generator -s -i

#obmenu-generator -p -i

#sed -i 's!xterm!terminator!' ~/.config/obmenu-generator/schema.pl

#sed -i 's!~/.config/openbox/autostart!~/.config/openbox/autostart.sh!' ~/.config/obmenu-generator/schema.pl

#sed -i 's!{exit!#{exit!' ~/.config/obmenu-generator/schema.pl

#sudo sed -i 's_# {item_{item_g;s/oblogout/obsession-logout/g' ~/.config/obmenu-generator/schema.pl

#sed -i 's!xterm!terminator!' ~/.config/obmenu-generator/config.pl

## setting default text editor
xdg-mime default pcmanfm.desktop inode/directory

## install obmenu-generator
cd ~/.scripts
sudo ./obmenu-generator.sh


