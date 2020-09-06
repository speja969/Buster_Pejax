## **Buster Pejax** (instructions in Serbian)
### *Debian Buster sa OpenBox WM*
<!-- OL (Ordered List) -->
1. Potrebno je prvo skinuti sa Debianovog sajta ISO instalacioni fajl:
    * https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.5.0-amd64-netinst.iso
    * ili non-free verziju https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/10.5.0+nonfree/amd64/iso-cd/firmware-10.5.0-amd64-netinst.iso
1. Pomoću Rufusa ili Etchera napraviti butabilni instalacioni USB Flash 
1. Instalirati na odabranu particiju metodom INSTALL ili GRAPHICAL INSTALL (zavisno od RAM-a i procesora)
1. Izostaviti ROOT password tako da USER ima automatski SUDO ovlašćenja
1. Na pitanje koje Grafičko okruženje da se instalira (Tasksel), od više ponuđenih (KDE,LXDE,...Debian default), ne izabrati ni jedno i čak odčekirati sve osim SSH i default utillity
1. Posle instalacije i restarta, butuje se u konzolu (TTY), gde unosimo username i password  
1. sudo apt update && sudo apt full-upgrade
1. sudo apt install git
1. git clone https://github.com/speja969/Buster_Pejax.git
1. cd Buster_Pejax
1. sudo chmod --recursive 777 .
1. cd scripts
1. sudo ./Buster_Pejax.sh
1. sudo reboot
1. Po želji možete instalirati obmenu-generator:    
_cd ~/.scripts_ && _sudo ./obmenu-generator.sh_

<!-- Headings -->
## AKO SE INSTALIRA U VIRTUALBOX-u
* potrebno je u tački 6. pre restarta instalirati GuestAdditions iz konzole (TTY):  
https://youtu.be/CwQ8XzP-h4Q?list=PL7ygF5ucclBQgWy6VruCjggBEXZxOcnxz
* sudo adduser $USER vboxsf  
-- dodati user-a grupi vboxsf (za šerovanje fajlova sa HOST-om) --
* dalje je isto od tačke 7. do kraja

![Cheese_20 09 2_11 54 55](https://user-images.githubusercontent.com/62497469/91967654-cb592500-ed13-11ea-9b6b-18d53566a27d.png)
