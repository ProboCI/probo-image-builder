sed -i 's/\\us\./\\us\./g' /etc/apt/sources.list
apt-get install -y puppet vim
# touch /etc/puppet/hiera.yaml
# # apt-get install -y wget
# # wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
# # dpkg -i puppetlabs-release-precise.deb
# # apt-get update
# # apt-get install -y puppet
