# 1. Host machine environment setup

timer=`date +%Y-%m-%d_%H:%M:%S`
docker_env=$HOME/GitHub/Projet_03_Adrien_Docker/
vagrant_env=$HOME/GitHub/Projet_03_Adrien_Vagrant/
prod_env=$HOME/oc_projet_03_$timer/

mkdir $prod_env
cd $prod_env

# 2. Vagrant

cp $vagrant_env/Vagrantfile $prod_env/
cp $vagrant_env/bootstrap.sh $prod_env/

# 3. Docker

cp $docker_env/Dockerfile  $prod_env/

# 4. Vagrant up

vagrant up
