# Lepew

Lepew is a (not-so) secret project aiming to build a CI & QA tool that can be
used to streamline the use of [Pull-Request](http://yangsu.github.io/pull-request-tutorial/) based workflow
to persist environments so that changes can be tested interactively by people
after being tested automatically by machines.


## Installing

1. Install [packer](https://packer.io/)
1. Install [VirtualBox](https://www.virtualbox.org/)
1. Install [vagrant](https://www.vagrantup.com)
1. Install [vagrant puppet librarian](https://github.com/mhahn/vagrant-librarian-puppet) using the command:
`vagrant plugin install vagrant-librarian-puppet`
1. Run `vagrant up`

This will use packer to build a fresh ubuntu 14.04 base box directly from the
canonical ISO, then use packer inside the VM to build Docker images for
Ubuntu 14.04, and it will install and configure packages needed for running
[ProboCi](https://github.com/proboci/probo).

After a successful `vagrant up` or `vagrant provision`, there should be a
container waiting inside the VM that can then be exported to docker hub. To
check the validity of this container jump onto the VM

- `vagrant ssh`
- `sudo su`
- `docker images`

You should see several images. `proboci/ubuntu-14.04-lamp:intermediary` is the
image that should be ready for deployment within Probo.
`proboci/ubuntu-14.04-lamp:latest` is an intermediary build artifact that has
everything installed but does not have a proper path environment set for
composer.
