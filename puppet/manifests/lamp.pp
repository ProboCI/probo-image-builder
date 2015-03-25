include git
include creature_comforts
#include wget

package { 'wget':
  ensure => 'installed',
}->

class { drupal_php:
  server_manage_service => true,
  server_service_enable => false,
  server_service_ensure => 'stopped',
}

include drush_fetcher

file { '/root/.ssh':
  ensure => 'directory',
  mode   => '0700',
  owner => 'root',
  group => 'root',
}->

# There is probably a better way, but I can't seed all remotes keys...
file { '/root/.ssh/config':
  content => "Host *\n  StrictHostKeyChecking no",
  mode    => '0700',
  owner => 'root',
  group => 'root',
}

drush::config { 'fetcher-class':
  file  => 'fetcher-services',
  key   => "fetcher']['info_fetcher.class",
  value => 'FetcherServices\InfoFetcher\FetcherServices',
}

drush::config { 'fetcher-services-host':
  file  => 'fetcher-services',
  key   => "fetcher']['info_fetcher.config']['host",
  value => 'https://extranet.zivtech.com',
}

# Inside penelope the regular `services` command cannot do its thing.
drush::config { 'fetcher-apache-restart':
  file  => 'fetcher-services',
  key   => "fetcher']['server.restart_command",
  value => 'apache2ctl graceful',
}

drush::config { 'fetcher-enable-site':
  file  => 'fetcher-services',
  key   => "fetcher']['server.enable_site_command",
  value => 'true',
}

drush::config { 'fetcher-disable-site':
  file  => 'fetcher-services',
  key   => "fetcher']['server.disable_site_command",
  value => 'true',
}

drush::config { 'fetcher-services-server-port':
  file   => 'fetcher-services',
  key    => "fetcher']['server.port",
  string => false,
  value  => $drupal_php::server::apache::server_port,
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
