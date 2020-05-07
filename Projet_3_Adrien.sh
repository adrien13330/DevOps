# 1. Host machine environment setup

mkdir /home/$USER/vagrant_projet_3
cd /home/$USER/vagrant_projet_3

# 2. Vagrantfile

echo 'Vagrant.configure("2") do |config|' >> Vagrantfile
echo '  config.vm.box = "generic/debian10"' >> Vagrantfile
echo '  config.vm.synced_folder "", "/vagrant"' >> Vagrantfile
echo '  config.vm.provision :shell, path: "bootstrap.sh"' >> Vagrantfile
echo '  config.vm.network "forwarded_port", guest: 80, host: 8080' >> Vagrantfile
echo '  config.vm.provider "virtualbox" do |v|' >> Vagrantfile
echo '  config.vm.provision "file", source: "Dockerfile", destination: "$HOME/*"' >> Vagrantfile
echo '    v.memory = 4096' >> Vagrantfile
echo '  end' >> Vagrantfile
echo 'end' >> Vagrantfile

# 3. Dockerfile

echo "FROM debian:latest" >> Dockerfile
echo "RUN apt update -y \\" >> Dockerfile
echo "&& apt install -y openssh-server \\" >> Dockerfile
echo "&& apt install -y nginx \\" >> Dockerfile
echo "&& mkdir /var/run/sshd \\" >> Dockerfile
echo "&& echo 'root:root' | chpasswd \\" >> Dockerfile
echo "&& echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config" >> Dockerfile
echo 'ENV NOTVISIBLE "in users profile"' >> Dockerfile
echo 'RUN echo "export VISIBLE=now" >> /etc/profile' >> Dockerfile
echo "EXPOSE 22 80" >> Dockerfile
echo 'CMD ["/usr/sbin/sshd", "-D"]' >> Dockerfile

# 4. bootstrap.sh

# 4.1 VSCode

echo 'sudo apt -y update' >> bootstrap.sh
echo 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg' >> bootstrap.sh
echo 'sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/' >> bootstrap.sh
echo $'sudo sh -c \'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list\'' >> bootstrap.sh
echo 'sudo apt-get install -y apt-transport-https' >> bootstrap.sh
echo 'sudo apt-get update -y' >> bootstrap.sh
echo 'sudo apt-get install -y code' >> bootstrap.sh
echo 'sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget' >> bootstrap.sh

# 4.2 Ansible - Latest

echo 'echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list' >> bootstrap.sh
echo 'sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367' >> bootstrap.sh
echo 'sudo apt update -y' >> bootstrap.sh
echo 'sudo apt install ansible -y' >> bootstrap.sh

# 4.3 Docker CE - Latest

echo 'sudo apt update -y' >> bootstrap.sh
echo 'sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common' >> bootstrap.sh
echo 'curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -' >> bootstrap.sh
echo 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"' >> bootstrap.sh
echo 'sudo apt update -y' >> bootstrap.sh
echo 'sudo apt install -y docker docker-ce docker-ce-cli containerd.io' >> bootstrap.sh
echo 'sudo usermod -aG docker vagrant' >> bootstrap.sh

# 4.4 Docker startup from bootstrap

#echo 'cp /vagrant/Dockerfile $HOME/.' >> bootstrap.sh
echo 'docker pull debian' >> bootstrap.sh
echo 'docker build -t test .' >> bootstrap.sh
echo 'docker run -d -p 2222:22 -p 80:80 test' >> bootstrap.sh

# 4.5 Vagrant startup

#vagrant init generic/debian10
vagrant box add generic/debian10 --provider=virtualbox
vagrant up
