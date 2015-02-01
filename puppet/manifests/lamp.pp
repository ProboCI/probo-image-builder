package { 'git':
  ensure => 'installed',
}

include creature_comforts

class { 'redis':
}

class { 'memcached':
  max_memory => '10%'
}

class { 'apache':
  default_mods   => false,
  mpm_module     => 'prefork',
  servername     => 'dev.local',
  service_enable => false,
  # Do not purge configs because it will remove any vhosts we put in palce.
  purge_configs => false,
}

# TODO: Match this up with acquia's web heads https://gist.github.com/beejeebus/34c4e8fb4f76dd9ec47e
class { 'apache::mod::mime': }->

class { 'apache::mod::rewrite': }->

class { 'apache::mod::deflate': }->

# TODO: We probably want this module but this isn't working for some reason.
# class { 'apache::mod::expires': }->
class { 'apache::mod::ssl': }

# mod php is not included here beacuse it is added by the php::apache class.

Php::Extension <| |> -> Php::Config <| |> ~> Service["apache2"]

include php

# We need to set the root password so that the user can be loaded.
user { 'root':
  # Set the password to 'root'. The below line doesn't work for some reason.
  # password => sha1('root'),
  password => '$6$Q6Rg6ZS3$i4ibqDLRQQvJHq0OSOWhDGjSGmBdXaTLhDWkWxKgRfcX8Ll5BSFIME67Q4HL/75LwJHcZoCDfFA8LuGlpjyQK0',
}

# TODO: Add support for yum.
class { 'php::cli':
  ensure   => 'present',
  provider => 'apt',
}

class { 'php::apache':
  ensure   => 'present',
  provider => 'apt',
}

class { 'php::dev':
  ensure   => 'present',
  provider => 'apt',
}

package { 'curl':
  ensure => 'present',
}

class { 'php::extension::curl':
  require => Class['php::dev'],
}

class { 'php::pear':
  require => Class['php::dev'],
}->


php::config { 'php-extension-redis':
  file => "${php::params::config_root_ini}/redis.ini",
  config => [],
}

file { '/etc/php5/apache2/redis.ini':

}

package { 'uploadprogress':
  ensure   => 'installed',
  provider => 'pecl',
}->

class { 'php::extension::opcache':
  require => Class['php::dev'],
  # settings => [
  #   'set ".anon/opcache.max_accelerated_files" "12000"',
  #   'set ".anon/opcache.memory_consumption" "256"',
  #   'set ".anon/opcache.validate_timestamps" "0"',
  # ],
}~>
file { '/etc/php5/apache2/conf.d/opcache2.ini':
  ensure  => file,
  content => "opcache.max_accelerated_files = 12000\nopcache.memory_consumption = 256\nopcache.validate_timestamps = 0",
  owner   => 'root',
  group   => 'root',
}



class { 'php::extension::gd':
  require => Class['php::dev'],
}

package { 'zip':
  ensure   => 'installed',
  provider => 'pecl',
}

class { 'mysql::server':
  root_password   => 'strongpassword',
  service_enabled  => true,
  service_manage   => true,
  # Upstart is not supported inside a docker container.
  service_provider => 'init',
  restart          => false,
}

class { 'mysql::bindings':
  php_enable => true,
}

class { "ssh::server":
  permit_root_login       => 'yes',
  manage_service          => false,
  password_authentication => 'yes',
  use_pam                 => 'no',
  use_dns                 => 'no',
}~>

file { '/var/run/sshd':
  ensure => 'directory',
  owner  => 'root',
  group  => 'root',

}

package { 'wget':
  ensure => 'installed',
}->

class { 'php::composer': }

include php::phpunit

class { 'drush_fetcher':
  fetcher_host => 'https://extranet.zivtech.com'
}

class { 'nodejs':
  manage_repo => true,
}~>

file { '/usr/bin/node':
  ensure => 'link',
  target => '/usr/bin/nodejs',
}->

package { 'lepew-penelope':
  ensure   => 'installed',
  provider => 'npm',
}

package { 'Console_Table':
  ensure   => installed,
  provider => pear,
}->

vcsrepo { '/usr/lib/drush':
  provider => 'git',
  source   => 'https://github.com/drush-ops/drush.git',
  revision => '6.4.0',
  require        => Package['git'],
}->

file { '/usr/local/bin/drush':
  ensure => 'link',
  target => '/usr/lib/drush/drush',
  mode   => 755,
}
