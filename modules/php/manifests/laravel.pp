class php::laravel {
  include php

  #download
  exec { 'composer-download':
    cwd => '/vagrant/',
    command => "curl -sS https://getcomposer.org/installer | php",
    require => [Package['git']],
    before => Exec['composer-move']
  }

  exec { 'composer-move':
    cwd => '/vagrant/',
    command => "mv composer.phar /usr/local/bin/composer",
  }
}