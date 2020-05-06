# 1. Mettre à jour la machine hôte (Debian 10)
sudo apt -y update
sudo apt -y upgrade

# 2. Installer les outils d'intégration VMware (si la machine hôte est une VM VMware neuve)
sudo apt install -y open-vm-tools-desktop

# 3. Un outil de téléchargement en ligne de commande : cURL
sudo apt install -y curl

# 4. Un éditeur de texte : VSCode
curl https://az764295.vo.msecnd.net/stable/ff915844119ce9485abfe8aa9076ec76b5300ddd/code_1.44.2-1587059832_amd64.deb --output /home/$USER/Downloads/code.deb
sudo dpkg -i /home/$USER/Downloads/code.deb

# 5. Un hyperviseur : Virtualbox
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install -y virtualbox-6.0

# 6. Un outil de création d'environnement pour machines virtuelles : Vagrant
curl https://releases.hashicorp.com/vagrant/2.2.8/vagrant_2.2.8_x86_64.deb --output /home/$USER/Downloads/vagrant-2.2.8.deb
sudo dpkg -i /home/$USER/Downloads/vagrant-2.2.8.deb
vagrant plugin install vagrant-vbguest
mkdir vagrant_projet_3
cd vagrant_projet_3
