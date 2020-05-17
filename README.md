<p align="center">
  <img src="https://i.imgur.com/V4ObU05.jpg">
</p>

### Les repositories suivants sont créés pour répondre au projet 3 de la formation d'Expert DevOps d'OpenClassrooms :
  - [Projet_03_Adrien_Vagrant](https://github.com/adrien13330/Projet_03_Adrien_Vagrant/)
  
  - [Projet_03_Adrien_Docker](https://github.com/adrien13330/Projet_03_Adrien_Docker/)
#### Ils contiennent les livrables attendus ([Vagrantfile](https://github.com/adrien13330/Projet_03_Adrien_Vagrant/blob/master/Vagrantfile), [Dockerfile](https://github.com/adrien13330/Projet_03_Adrien_Docker/blob/master/Dockerfile)) ainsi que les lignes de code nécessaires pour les exécuter.

### Etape 1 : Exécuter tout ou partie de [Host_Setup.sh](https://github.com/adrien13330/Projet_03_Adrien_Vagrant/blob/master/Host_Setup.sh) pour installer sur la machine hôte ces prérequis :

En fonction des besoins de l'Hôte :
  1. Mettre à jour la machine hôte (Debian 10)
  2. Un outil de téléchargement en ligne de commande : cURL
  3. Un éditeur de texte : VSCode
  4. Un hyperviseur : Virtualbox
  5. Un outil de création d'environnement pour machines virtuelles : Vagrant
     - Et pour cet exercice : une box Debian 10 pour Vagrant

### Etape 2 : Copier [oc_projet_03.sh](https://github.com/adrien13330/Projet_03_Adrien_Vagrant/blob/master/oc_projet_3.sh) dans l'environnement de travail :
  1. Si besoin, rendre ce script exécutable :
     > sudo chmod +x oc_projet_03.sh
  2. L'exécuter :
     > ./oc_projet03.sh
  2. Ce fichier va :
     - Générer un Vagrantfile, fichier d'instructions pour la VM
     - Générer un bootstrap.sh qui ajoutera :
          - Un éditeur de texte : VSCode
          - Un environnement de virtualisation : Ansible
          - Un gestionnaire de conteneurs : Docker CE
          - Un Dockerfile, fichier d'instructions pour le container, qui ajoutera le logiciel de serveur NGINX
  
### ![Alt Text](https://i.imgur.com/U0GPAaw.png) Reçettage :
  1. Depuis l'Hôte :
     > http://172.17.0.1:8080
  2. Depuis la VM Vagrant :
     > curl 172.17.0.2:80
  3. Depuis la VM Vagrant, le container serait accessible par le port 2222 en SSH si celui-ci était présent
