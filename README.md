## Ce Repository ainsi que Projet_03_Adrien_Docker sont conçus pour répondre au projet 3 de la formation d'Expert DevOps d'OpenClassrooms.

## Ils contiennent les livrables attendus ainsi que les lignes de code nécessaires pour les exécuter.
Voici comment les prendre en main :

### <u>Etape 1 :</u> Exécuter Host_Setup.sh pour installer sur la machine hôte les prérequis suivants selon besoin :
  1. Mettre à jour la machine hôte (Debian 10)
  2. Installer les outils d'intégration VMware (si la machine hôte est une VM VMware neuve)
  3. Un outil de téléchargement en ligne de commande : cURL
  4. Un éditeur de texte : VSCode
  5. Un hyperviseur : Virtualbox
  6. Un outil de création d'environnement pour machines virtuelles : Vagrant
  7. Les outils Virtualbox permettant le partage de fichiers entre la machine hôte et la machine virtuelle Vagrant
  
### Etape 2 : Copier Vagrantfile dans l'environnement de travail 
  1. Ce fichier sera lu par Vagrant à l'installation de la VM qui va contenir Docker et son conteneur et permet de l'initialiser
 
### Etape 3 : Copier bootstrap.sh dans l'environnement de travail
  1. Ce fichier sera lu par Vagrant au démarrage de cette même VM et permet de la personnaliser en y ajoutant :
     - Un éditeur de texte : VSCode
     - Un environnement de virtualisation : Ansible
     - Un gestionnaire de conteneurs : Docker
    
### Etape 4 : Copier Dockerfile et Docker_Setup.sh dans l'environnement de travail
  1. Ces fichiers seront utilisés ultérieurement dans la VM Vagrant par Docker 
 
### Etape 5 : Exécuter Vagrant_Setup.sh pour lancer le déploiement de cette VM
 
### Etape 6 : Exécuter Docker_Setup.sh une fois dans la VM Vagrant
  1. Ce script utilise le fichier Dockerfile mentionné à l'étape 3 et permet de personnaliser le conteneur Docker en y ajoutant :
    - Un outil de connexion à distance par terminal : SSH
    - Un logiciel de serveur web : NGINX
  
### Reçettage :
  1. Depuis la VM VMware
    - Accéder à NGINX depuis http://172.17.0.1:8080
  2. Depuis la VM Vagrant
    - Accéder à NGINX par :
        - wget -O- localhost:80
        - wget -O- 172.17.0.2:80
    - Accéder en SSH au container Docker par :
        - ssh root@localhost -p 2222
