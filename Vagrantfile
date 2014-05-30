# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "lapew"
  #config.vm.box_url = "http://domain.com/path/to/above.box"
  config.vm.network "private_network", type: "dhcp"
  config.vm.network :private_network, ip: "192.168.33.254"

  # Install puppet.
  config.vm.provision "shell", path: "scripts/puppet_setup.sh"

  # Run puppet
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "main.pp"
  end

  config.ssh.forward_agent = true
end
