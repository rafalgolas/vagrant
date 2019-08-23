Oracle Linux 76 i baza 19c non-CDB


Potrzebny Soft:
Vagrant -> https://www.vagrantup.com/downloads.html
git -> https://desktop.github.com/
VirtualBox -> https://www.virtualbox.org/

W miejsce katalogu software podlinkować sobie katalog (Windows: mklink /J)  z instalkami oracle:
LINUX.X64_193000_db_home.zip

Znane problemy:

Maszyna startuje z box/a image o nazwie 'ol76'
Można go pobrać wydając komendę "vagrant box add --name ol76 https://yum.oracle.com/boxes/oraclelinux/ol76/ol76.box"


Podstawowe komendy:
start

Maszynę uruchamiamy wydając w katalogu maszyny ol7-19 polecenie 'vagrant up'
Za pierwszym razem maszyna będzie inicjalizowana (potrzeby dostęp do Internetu)
Potem polecenie uruchamia maszynę

stop

Zatrzymanie maszyny 'vagrant halt'

Zalogowanie do maszyny:

'vagrant ssh' potem 'sudo su - oracle'

Katalog /vagrant na maszynie wirtualnej jest podlinkowany pod vagrant w katalogu lokalnym.
