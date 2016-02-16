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

package { 'php5-mcrypt':
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

package { 'zip':
  ensure   => 'installed',
  provider => 'pecl',
}

class { 'mysql::server':
  root_password    => 'strongpassword',
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

class { 'drush':
  git_ref => '8.0.3',
}

drush::config { 'root':
  key   => 'root',
  value => '/var/www/html',
}

drush::config { 'disable-prompts':
  key    => 'yes',
  value  => 'TRUE',
  string => false,
}

# Add WordPress CLI
wget::fetch { 'WordPress CLI':
  source      => 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar',
  destination => '/tmp/wp-cli.phar',
  require     => Package['wget'],
}->

file { '/usr/local/bin/wp':
  ensure => 'file',
  source => '/tmp/wp-cli.phar',
  mode   => '755',
}

# Install Ruby and compass
package { 'ruby-dev':
  ensure => 'present'
}->

package { 'ruby-compass':
  ensure => 'present'
}->

exec { 'gem install bundler':
  path    => ['/usr/bin/'],
  creates => '/usr/local/bin/bundler',
}

# Install Drupal Console
wget::fetch { 'Drupal Console':
  source      => 'https://drupalconsole.com/installer',
  destination => '/tmp/drupal.phar',
  require     => Package['wget'],
}->

file { '/usr/local/bin/drupal':
  ensure => 'file',
  source => '/tmp/drupal.phar',
  mode   => '755',
}
