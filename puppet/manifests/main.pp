
class { 'docker':
  manage_kernel => false,
}

file { '/opt/packer':
  ensure => 'directory',
  mode   => '0755'
}->

class { 'packer':
  bin_dir => '/opt/packer',
  version => '1.0.2',
}->

file { '/usr/bin/packer':
  ensure => 'link',
  target => '/opt/packer/packer',
}
