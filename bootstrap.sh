#Vagrant Bootstrap Repository Setup: Ansible - Latest

echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

#Vagrant Bootstrap Repository Setup: Docker CE - Latest

sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

#Vagrant Bootstrap Setup: ne + Ansible + Docker CE

sudo apt update -y
sudo apt install -y ne
sudo apt install -y ansible
sudo apt install -y docker docker-ce docker-ce-cli containerd.io

#Vagrant Bootstrap Docker CE: Run

sudo usermod -aG docker vagrant
docker pull debian
curl https://raw.githubusercontent.com/adrien13330/Projet_03_Adrien_Docker/master/Dockerfile -so Dockerfile
docker build -t oc_projet_03 .
docker run -dit -p 2222:22 -p 80:80 oc_projet_03