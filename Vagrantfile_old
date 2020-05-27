Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian10"
  config.vm.synced_folder "", "/vagrant"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end
end
