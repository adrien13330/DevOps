# 1. Mettre à jour la machine hôte (Debian 10)

sudo apt -y update
sudo apt -y upgrade

# 2. Un outil de téléchargement en ligne de commande : cURL

sudo apt install -y curl

# 3. Un éditeur de texte : VSCode

curl https://az764295.vo.msecnd.net/stable/ff915844119ce9485abfe8aa9076ec76b5300ddd/code_1.44.2-1587059832_amd64.deb --output $HOME/Downloads/code.deb
sudo dpkg -i $HOME/Downloads/code.deb

# 4. Un hyperviseur : Virtualbox

echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update -y
sudo apt install -y virtualbox-6.0

# 5. Un outil de création d'environnement pour machines virtuelles : Vagrant

curl https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb --output $HOME/Downloads/vagrant-2.2.9.deb
sudo dpkg -i $HOME/Downloads/vagrant-2.2.9.deb
vagrant plugin install vagrant-vbguest

# 5.1 Pour cet exercice : une box Debian 10

vagrant box add generic/debian10 --provider=virtualbox