Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/9"
  
  config.vm.define "chserver" do |chserver|
    chserver.vm.hostname = "chserver"
    chserver.vm.network "private_network", ip: "192.168.1.10"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
  end
    
  config.vm.box = "almalinux/9"
  config.vm.provider "virtualbox"
  config.vm.define "chclient" do |chclient|
    chclient.vm.hostname = "chclient"
    chclient.vm.network "private_network", ip: "192.168.1.11"
  end

    config.vm.box = "almalinux/9"
  config.vm.provider "virtualbox"
  config.vm.define "chwork" do |chwork|
    chwork.vm.hostname = "chwork"
    chwork.vm.network "private_network", ip: "192.168.1.12"
  end


end
