#!/bin/bash

# SCRIPT SHELL POUR LE PROJET LINUX 3AAL ESGI 2015-2016
# SIGER Preston , NIEL Dorine, ELBAZ Amram

echo "Welcome to $0"

#Lister les périphériques de la machine (usb, disque, processeur, carte graphique, etc ..) via
#l'utilisation des commandes systèmes dédiées à cette tâche (lsusb, lscpu, etc ..)
if [ "$1" = "--sc" ]
  then
  echo "Listing your system components : "
  echo "Processor: "
  echo " "
  lscpu
  echo " "
  echo "RAM :"
  echo " "
  echo "Total Memory :"
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
  echo "Disk(s) and partitions:"
  echo " "
  df
  
  

#- Via la commande dmesg , afficher les informations relatives à la carte réseau ainsi que les
#potentiels messages de type 'err' ou 'warn'.



#- Afficher le niveau d'execution actuel du systeme et lister les services liés à ce niveau
# d'execution


#- Afficher une version commentée et expliquée de la partie du fichier de configuration de grub
#relative au système en cours de fonctionnement.


#- Afficher les partitions du système.


#- Avec DD , créer un périphérique bloc de 100Mo, transformer le en un filesystem de type ext3 et
# monter le dans /mnt


#- Afficher les paquets actuellement installés sur la machine.


#- Tester la présence du serveur openssh et installer le paquet si celui-ci est manquant.


#- Ajouter un nouvel utilisateur (l'ensemble des informations devra être passé en argument)


#- Lancer un netcat en écoute en local sur le port de votre choix. La connexion à ce netcat devra
# afficher le contenu de ce script.


fi
