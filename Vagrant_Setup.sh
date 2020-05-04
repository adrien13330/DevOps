#Vagrant Plugin for box generic/debian10
vagrant plugin install vagrant-vbguest

#Vagrant Config Setup
vagrant init generic/debian10
vagrant box add generic/debian10 --provider=virtualbox

#Vagrant Startup
vagrant up --provider=virtualbox
