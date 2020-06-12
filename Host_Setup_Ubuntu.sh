# 1. Mettre à jour la machine hôte (Debian 10)

sudo apt -y update
sudo apt -y upgrade

# 2. Un outil de téléchargement en ligne de commande : cURL

sudo apt install -y curl

# 3. Un éditeur de texte : VSCode

curl https://az764295.vo.msecnd.net/stable/ff915844119ce9485abfe8aa9076ec76b5300ddd/code_1.44.2-1587059832_amd64.deb --output $HOME/code.deb
sudo dpkg -i $HOME/code.deb

# 4. Un hyperviseur : Virtualbox

echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update -y
sudo apt install -y virtualbox-6.1

# 5. Un outil de création d'environnement pour machines virtuelles : Vagrant

curl https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb --output $HOME/vagrant-2.2.9.deb
sudo dpkg -i $HOME/vagrant-2.2.9.deb

# 5.1 Pour cet exercice : une box Debian 10

vagrant box add generic/debian10 --provider=virtualbox

# 5.2 Facultatif : Docker Engine - Latest

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 5.3 Facultatif : Docker Compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose