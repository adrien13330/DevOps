# 1. Host machine environment setup

timer=`date +%Y-%m-%d_%H:%M:%S`
prod_env=$HOME/oc_projet_03_$timer/

mkdir $prod_env
cd $prod_env

# 2. Vagrant

curl https://raw.githubusercontent.com/adrien13330/Projet_03_Adrien_Vagrant/master/Vagrantfile -so Vagrantfile
curl https://raw.githubusercontent.com/adrien13330/Projet_03_Adrien_Vagrant/master/bootstrap_volume.sh -so bootstrap.sh

# 3. Vagrant up

vagrant up