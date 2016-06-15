class vhost_settings {
  file { '/etc/apache2/sites-available/default.conf':
    ensure => 'file',
    source => 'puppet:///modules/vhost_settings/default.conf',
  }->

  file { '/etc/apache2/sites-enabled/zzz-default.conf':
    ensure => 'link',
    source => '/etc/apache2/sites-available/default.conf',
  }->

  # Not happy about this but every other attempt to remove that directory
  # failed.
  exec { 'rm -rf /var/www/default':
    path => ['/bin']
  }
}
