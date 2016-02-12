
class { 'docker':
  manage_kernel => false,
}

class { 'packer':
  bin_dir => '/opt/packer',
  version => '0.8.6',
}->

file { '/usr/bin/packer':
  ensure => 'link',
  target => '/opt/packer/packer',
}

package { 'zip':
  ensure => 'installed',
}->

class { 'nodejs':
  version => 'v4.3.0',
  make_install => false,
}->

file { '/usr/bin/node':
  ensure => 'link',
  target => '/usr/local/node/node-default/bin/node',
}->

package { 'lepew-penelope':
  ensure   => 'installed',
  provider => 'npm'
}

package { 'git':
  ensure => 'installed',
}
