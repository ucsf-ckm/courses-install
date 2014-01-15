class php {
  package { "php-mysql.x86_64":
    ensure => present,
  }

  package { "php-mbstring.x86_64":
    ensure => present,
  }

  package { "php-xmlrpc.x86_64":
    ensure => present,
  }

  package { "php-soap.x86_64":
    ensure => present,
  }

  package { "php-intl.x86_64":
    ensure => present,
  }

  package { "php-cli.x86_64":
    ensure => present,
  }

  augeas { "php.ini":
    context => "/files/etc/php.ini/Date",
    changes => [
      "set date.timezone America/Los_Angeles",
    ],
  }
}