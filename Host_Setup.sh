#Basic Setup
sudo apt -y update
sudo apt -y upgrade

#Tools for Host (Host is a Debian 10 VMware VM)
sudo apt install -y open-vm-tools-desktop

#Curl
sudo apt install -y curl

#Visual Studio Code
curl https://az764295.vo.msecnd.net/stable/ff915844119ce9485abfe8aa9076ec76b5300ddd/code_1.44.2-1587059832_amd64.deb --output /home/$USER/Downloads/code.deb
sudo dpkg -i /home/$USER/Downloads/code.deb

#Vagrant Virtualbox
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install -y virtualbox-6.0

#Vagrant 2.2.7
curl https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.deb --output /home/$USER/Downloads/vagrant-2.2.7.deb
sudo dpkg -i /home/$USER/Downloads/vagrant-2.2.7.deb

#Vagrant Bootstrap Setup : Visual Studio Code : See bootstrap.sh
#Vagrant Bootstrap Setup : Ansible - Latest : See bootstrap.sh
#Vagrant Bootstrap Setup : Docker CE - Latest : See bootstrap.sh
