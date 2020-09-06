## **Buster Pejax** (instructions in Serbian)
### *Debian Buster sa OpenBox WM*

1. Potrebno je prvo skinuti sa Debianovog sajta ISO instalacioni fajl:
    * https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.5.0-amd64-netinst.iso
    * ili non-free verziju https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/10.5.0+nonfree/amd64/iso-cd/firmware-10.5.0-amd64-netinst.iso
1. Pomoću Rufusa ili Etchera napraviti butabilni instalacioni USB Flash 
1. Instalirati na odabranu particiju metodom INSTALL ili GRAPHICAL INSTALL (zavisno od RAM-a i procesora)
1. Izostaviti _ROOT_ password tako da _USER_ ima automatski _SUDO_ ovlašćenja
1. Na pitanje koje Grafičko okruženje da se instalira (_Tasksel_), od više ponuđenih (_KDE_,_LXDE_,..._Debian default_),  
 ne izabrati ni jedno i čak odčekirati sve osim _SSH_ i _default utillity_
1. Posle instalacije i restarta, butuje se u konzolu (_TTY_), gde unosimo username i password  
1. ažuriranje softvera  
_` sudo apt update && sudo apt full-upgrade`_
1. instaliranje git-a  
_`sudo apt install git`_
1. kloniranje git repozitorijuma Buster_Pejax  
_`git clone https://github.com/speja969/Buster_Pejax.git`_
1. promena aktivnog direktorijuma  
_`cd Buster_Pejax`_
1. maksimalno podizanje ovlašćenja pristupa repozitorijumu Buster_Pejax rekurzivno  
_`sudo chmod --recursive 777 .`_
1. promena aktivnog direktorijuma  
_`cd scripts`_
1. Startovanje skripte _Buster_Pejax.sh_  
_`sudo ./Buster_Pejax.sh`_
1. Restart  
_`sudo reboot`_
1. Po želji možete instalirati obmenu-generator:
    _`cd ~/.scripts`_  
    _`sudo ./obmenu-generator.sh`_
## AKO SE INSTALIRA U VIRTUALBOX-u
* potrebno je u tački 6. pre restarta instalirati GuestAdditions iz konzole (TTY):  
https://youtu.be/CwQ8XzP-h4Q?list=PL7ygF5ucclBQgWy6VruCjggBEXZxOcnxz
* Dodati user-a grupi vboxsf (za šerovanje fajlova sa HOST-om)  
_`sudo adduser $USER vboxsf`_
* dalje je isto od tačke 7. do kraja

![Cheese_20 09 2_11 54 55](https://user-images.githubusercontent.com/62497469/91967654-cb592500-ed13-11ea-9b6b-18d53566a27d.png)
