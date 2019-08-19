
Potrzebny Soft:

Vagrant -> https://www.vagrantup.com/downloads.html

git -> https://desktop.github.com/

VirtualBox -> to wiadomo



1. Klonowanie repozytorium do katalogu lokalnego -> git clone https://github.com/rafalgolas/vagrant.git

2. w pliku vagrant\ocms\config\vagrant.yml są wszystki ustawienia maszyn (IP, CPU, RAM, dyski)

3. w pliku vagrant\ocms\config\install.env są zmienne do instalacji.

4. Trzeba pobrać maszynę podstawowy image (link w mailu) 

5. Załadować maszynę do vagrant'a -> vagrant box add ol65 ol65.box

6. lista maszyn:

	dns - prosty serwer DNS na potrzeby maszyn (wszystkie IPki wefiniuje się w pliku /etc/hosts)
	
	oms - serwer OEM 12.1.0.4
	
	rac1 - node1 (wykonuje całą instalację)
	
	rac2 - node2 (kreuje wspólne dyski od niego zaczynać tworzenie maszyn)
	
	rac3 - node3 do zabawy
	
	rac4 - node4 do zabawy
	
	shared_scripts - wiadomo 
	
	srv1 - serwer do single instance i DataGuard
	
	srv2 - serwer do single instance i DataGuard

6. W miejsce katalogu software podlinkować sobie katalog (Windows: mklink)  z instalkami oracle:

	em12104_linux64_disk1.zip  (instalka OEM 12.1.0.4)
	
	em12104_linux64_disk2.zip  (instalka OEM 12.1.0.4)
	
	em12104_linux64_disk3.zip  (instalka OEM 12.1.0.4)
	
	p13390677_112040_Linux-x86-64_1of7.zip (baza 11.2.0.4, pod emrepo)
	
	p13390677_112040_Linux-x86-64_2of7.zip (baza 11.2.0.4, pod emrepo)
	
	p17694377_121020_Linux-x86-64_1of8.zip (baza 12.1.0.2)
	
	p17694377_121020_Linux-x86-64_2of8.zip (baza 12.1.0.2)
	
	p17694377_121020_Linux-x86-64_3of8.zip (Grid Infrastructure 12.1.0.2)
	
	p17694377_121020_Linux-x86-64_4of8.zip (Grid Infrastructure 12.1.0.2)

7. Uruchamiania RAC'a zaczynamy od noda2, node1 wykonuje instalację, node3 i node4 są do potrenowania dodawania i usuwania nodów

8. OEM się instaluje automatycznie (TODO: automatyczny start bazy przy kolejnych uruchomieniach), 

9. srv1 i srv2 są do treningu z pojedynczymi instancjami i Data Guard



pomocna linki:
 
Zmiana maszyny (box'a) vagranta. https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one

Tworząc środowisko wzorowałem się na blogu oracle-base.com, tutaj przykłady -> https://github.com/oraclebase/vagrant/tree/master/rac/ol7_183
