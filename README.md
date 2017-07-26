# Probo Image Builder

This project is used to create docker images needed to run
[ProboCi](https://github.com/proboci/probo).

## Dependencies

1. [Ansible](https://docs.ansible.com/ansible/latest/index.html)
1. [VirtualBox](https://www.virtualbox.org/)
1. [Vagrant](https://www.vagrantup.com)

## Running

1. After installing dependencies...
1. Run `vagrant up`

This will use packer to build a fresh ubuntu base box using a predefined vagrant
box. The VM will run packer inside the VM to build Docker images for Ubuntu
14.04, and it will install and configure packages needed for running
[ProboCi](https://github.com/proboci/probo).

After a successful `vagrant up` or `vagrant provision`, there should be a
container waiting inside the VM that can then be exported to docker hub. To
check the validity of this container jump onto the VM

- `vagrant ssh`
- `sudo su`
- `docker images`

You should see several images. `proboci/ubuntu-14.04-lamp:nightly` is the
image that should be ready for deployment within Probo. This image will be saved
to a tar file that can be imported to other dev environments for testing Probo
prior to deployment. The tar file in question will be placed in the `workspace`
directory and will be called `ubuntu-14.04-lamp-nightly.tar`
