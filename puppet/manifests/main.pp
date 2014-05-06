package { 'zip':
  ensure => 'installed',
}->

class { 'packer':
  install_dir => '/opt/packer',
  version => '0.5.2',
}

include nodejs
