# Lepew

Lepew is a (not-so) secret project aiming to build a CI & QA tool that can be
used to streamline the use of [Pull-Request](http://yangsu.github.io/pull-request-tutorial/)
based workflow to persist environments so that changes can be tested interactively
by people after being tested automatically by machines.

## Stability

This is not properly working yet at all.  Cloning will probably not give you a functional VM.

__*There is a [known issue](https://github.com/mitchellh/packer/issues/1752) with the current version of packer conflicting with the current version of docker.  To fix the packer/docker issues you can use the binaries available in a [stefancocora's repository](https://github.com/stefancocora/packer-issue1752-fix).*__

## Installing

1. Install [packer](https://packer.io/)
2. Install [VirtualBox](https://www.virtualbox.org/)
3. Install [vagrant](https://www.vagrantup.com)
4. Run ./bin/build.sh

This will use packer to build a fresh ubuntu 14.04 base box directly from the canonical ISO,
then use packer inside the VM to build Docker images for Ubuntu 12.04 and 14.04, and it will
install and configure [lepew-amore](https://github.com/tizzo/lepew-amore) to serve traffic
to the docker containers sitting behind it.
