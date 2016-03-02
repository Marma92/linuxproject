#!/bin/bash

# SCRIPT SHELL POUR LE PROJET LINUX 3AAL ESGI 2015-2016
# SIGER Preston , NIEL Dorine, ELBAZ Amram

echo "Welcome to $0"

#Lister les périphériques de la machine (usb, disque, processeur, carte graphique, etc ..) via
#l'utilisation des commandes systèmes dédiées à cette tâche (lsusb, lscpu, etc ..)
if [ "$1" = "--sc" ]
	then
	echo "Listing your system components :"
	echo "Processor :"
	echo " "
	lscpu
	echo " "
	echo "RAM :"
	echo " "
	echo "Total Memory :"
	free | grep Mem | awk '{print $2 " KB"}'
	echo "Used Memory :"
	free | grep Mem | awk '{print $3 " KB"}'
	echo "Free Memory :"
	free | grep Mem | awk '{print $4 " KB"}'
	echo "Shared Memory :"
	free | grep Mem | awk '{print $5 " KB"}'
	echo "Buffers :"
	free | grep Mem | awk '{print $6 " KB"}'
	echo "Cached Memory :"
	free | grep Mem | awk '{print $7 " KB"}'
	echo " "
	echo "Graphic Card :"
	echo " "
	lspci | grep "VGA compatible controller"
	echo " " 
	echo "Sound Card :"
	echo " "
	lspci | grep -i audio
	echo " "
	echo "Network Devices :"
	echo " " 
	lspci | grep -network
	lspci | grep -ethernet
	echo " "
	echo "Disk(s) and partitions :"
	echo " "
	lsblk
	echo " "
	echo "USB Devices :"
	echo " "
	lsusb
	echo " "
 
  
#- Via la commande dmesg , afficher les informations relatives à la carte réseau ainsi que les
#potentiels messages de type 'err' ou 'warn'.
elif [ "$1" = "--nw" ]
	then
	echo "Dmesg recap :"
	echo " "
	echo "Concerning Network Card :"
	dmesg |grep -i eth
	echo " "
	echo "Warning and Errors :"*
	
	dmesg --level=err,warn


#- Afficher le niveau d'execution actuel du systeme et lister les services liés à ce niveau
# d'execution
elif [ "$1" = "--pcs" ]
	then
	echo " "
	echo "Current level of execution"
	top
	#echo "Processus linked by this level of execution"
	#ps aux 


#- Afficher une version commentée et expliquée de la partie du fichier de configuration de grub
#relative au système en cours de fonctionnement.
elif [ "$1" = "--gr" ]
	then
	echo "Grub Configuration File:"
	echo " "
	cat /boot/grub/grub.cfg
	echo " " 

#- Afficher les partitions du système.
elif [ "$1" = "--pt" ]
	then
	echo " "
	echo "Disk(s) and partitions :"
	echo " "
	df


#- Avec DD , créer un périphérique bloc de 100Mo, transformer le en un filesystem de type ext3 et
# monter le dans /mnt
elif [ "$1" = "--dd" ]
	dd if=/dev/${2} of=~/${3} bs=100M
    mkfs.ext3 ~/${3}
    mount  ~/${3} /mnt
    df -h

#- Afficher les paquets actuellement installés sur la machine.
elif [ "$1" = "--pkg" ]	
	then
	echo " "
	echo "List of installed packages"
	echo " "
	dpkg-query -l

#- Tester la présence du serveur openssh et installer le paquet si celui-ci est manquant.
elif [ "$1" = "--ssh" ]	
	if!(dpkg -s openssh-server |egrep
		"Package:|Version:") ; 
		then #ICI on teste si la commande entre parenthese renvoi un resultat
        	apt-get install 
			-qq openssh-server -y >
			/dev/null
	fi

#- Ajouter un nouvel utilisateur (l'ensemble des informations devra être passé en argument)
elif [ "$1" = "--usr" & "$2" & "$3" ]
	then
	echo" "
	useradd $2
	passwd $3
	echo "User created"

#- Lancer un netcat en écoute en local sur le port de votre choix. La connexion à ce netcat devra
# afficher le contenu de ce script.
# Le port doit être dans le deuxième paramètre d'entrée sinon 
elif [ "$1' = "--nc"]
	if [ "$2" = nul ]
		read -r -p 'Quel port ? ' port # On demande au user de saisir un port
	nc -l -p $2 < script2.sh

fi
