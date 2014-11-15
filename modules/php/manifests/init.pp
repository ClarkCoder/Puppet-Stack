class php {

  # package install list
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "libapache2-mod-php5",
    "python-software-properties"
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }

  exec { 'add-apt-repository':
    require => Package['python-software-properties'],
    command => '/usr/bin/add-apt-repository ppa:ondrej/php5'
  }


  exec { 'apt-get dist-upgrade':
    require => Exec["apt-get update"],
    command => '/usr/bin/apt-get update'
  }
}
