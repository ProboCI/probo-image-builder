# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", type: "dhcp"
  config.vm.network :private_network, ip: "192.168.33.254"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "ansible/vagrant.yml"
  end

  config.vm.provision "shell", path: "scripts/build_images.sh"

  config.vm.provision "shell", path: "scripts/export_images.sh"

  config.ssh.forward_agent = true
end
