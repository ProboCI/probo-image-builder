# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
  config.vm.network "private_network", type: "dhcp"
  config.vm.network :private_network, ip: "192.168.33.254"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Sync all of the projects to your local machine
  # To enable, create a workspace directory in this directory
  if File.directory?("workspace")
    config.vm.synced_folder "workspace", "/vagrant/workspace" , type: "nfs"
  end

  # Install puppet.
  config.vm.provision "shell", path: "scripts/puppet_setup.sh"

  # Run puppet
  config.librarian_puppet.puppetfile_dir = "puppet"
  config.vm.provision "puppet" do |puppet|
    puppet.manifest_file = "main.pp"
    puppet.options = ["--debug", "--trace"]
    puppet.module_path = [
      "puppet/modules",
      "puppet/custom-modules"
    ]
    puppet.manifests_path = "puppet/manifests"
  end

  config.vm.provision "shell", path: "scripts/create_image.sh"

  config.vm.provision "shell", path: "scripts/export_image.sh"

  # config.vm.define :external do |external|
  #     external.vm.provision "puppet" do |puppet|
  #       puppet.module_path = "puppet/modules"
  #       puppet.manifests_path = "puppet/manifests"
  #       puppet.manifest_file = "main.pp"
  #       puppet.options = ["--debug", "--trace"]
  #     end
  # end
  #
  # config.vm.define :internal do |internal|
  #     internal.vm.provision "puppet" do |puppet|
  #       puppet.module_path = [
  #         "puppet/modules",
  #         "puppet/custom-modules"
  #       ]
  #       puppet.manifests_path = "puppet/manifests"
  #       puppet.manifest_file = "lamp.pp"
  #       puppet.options = ["--debug", "--trace"]
  #       puppet.hiera_config_path = "puppet/hiera.yaml"
  #     end
  # end

  config.ssh.forward_agent = true
end
