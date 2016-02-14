include git

package { 'wget':
  ensure => 'installed',
}->

# Needed so that the build won't fail.
file { '/var/www':
  ensure => 'directory',
  mode   => '0755',
  owner  => 'root',
  group  => 'root',
}->

class { drupal_php:
  server_manage_service => true,
  server_service_enable => false,
  server_service_ensure => 'stopped',
  opcache               => 'none',
}->

package { 'imagemagick':
  ensure => 'present',
}->

# Necessary on Apache 2015
apache::mod { 'access_compat': }->

file { '/var/www/html':
  ensure => 'absent',
}

file { '/root/.ssh':
  ensure => 'directory',
  mode   => '0700',
  owner => 'root',
  group => 'root',
}->

# TODO: There's got to be a better way...
file { '/root/.ssh/config':
  content => "Host *\n  StrictHostKeyChecking no",
  mode    => '0700',
  owner => 'root',
  group => 'root',
}

package { 'redis-server':
  ensure => 'installed',
}

class { 'memcached':
  max_memory => '10%'
}

# We need to set the root password so that the user can be loaded.
user { 'root':
  # Set the password to 'root'. The below line doesn't work for some reason.
  # password => sha1('root'),
  password => '$6$Q6Rg6ZS3$i4ibqDLRQQvJHq0OSOWhDGjSGmBdXaTLhDWkWxKgRfcX8Ll5BSFIME67Q4HL/75LwJHcZoCDfFA8LuGlpjyQK0',
}

# TODO: opcache tuning.
# class { 'php::extension::opcache':
#   require => Class['php::dev'],
#   # settings => [
#   #   'set ".anon/opcache.max_accelerated_files" "12000"',
#   #   'set ".anon/opcache.memory_consumption" "256"',
#   #   'set ".anon/opcache.validate_timestamps" "0"',
#   # ],
# }~>
# file { '/etc/php5/apache2/conf.d/opcache2.ini':
#   ensure  => file,
#   content => "opcache.max_accelerated_files = 12000\nopcache.memory_consumption = 256\nopcache.validate_timestamps = 0",
#   owner   => 'root',
#   group   => 'root',
# }


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

package { 'apt-transport-https':
  ensure => 'present',
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
  provider => 'npm',
}
