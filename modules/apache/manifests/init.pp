class apache {

  # install apache
  package { "apache2":
    ensure => present,
    require => Exec["apt-get update"]
  }

  # ensures that mode_rewrite is loaded and modifies the default configuration file
  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"]
  }


  # create apache config from main vagrant manifests
  file { 'site-config':
    path    => '/etc/apache2/sites-enabled/000-default',
    source  => '/vagrant/site-config',
    require => Package["apache2"],
  }

  # starts the apache2 service
  service { 'apache2':
    ensure      => 'running',
    hasrestart  => true,
    subscribe   => File["site-config"]
  }

  # Create the Apache landing Page
  file { '/vagrant/index.html':
    content => "<h1>Vagrant + Puppet</h1>",
  }
}

