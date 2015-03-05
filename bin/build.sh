#! /usr/bin/env bash

cd packer
#packer build ubuntu-14.04-amd64.json
cd -
vagrant box add --force --name=lepew builds/virtualbox/lepew_ubuntu-14.04.box
vagrant up
