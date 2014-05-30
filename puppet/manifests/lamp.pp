
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

class { 'php::pear':
  ensure   => 'present',
  provider => 'apt',
}

  # We don't want APC on any version of PHP greater than 5.3.
  # class { 'php::extension::apc':
  #   ensure   => 'present',
  #   provider => 'apt',
  #   package  => 'php-apc',
  # }


class { 'php::extension::curl':
  ensure   => 'present',
  provider => 'apt',
}

package { 'curl':
  ensure => 'present',
}

package { 'uploadprogress':
  ensure   => 'installed',
  provider => 'pecl',
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

# include drush

