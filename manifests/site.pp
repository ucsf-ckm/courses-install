exec { "yum update":
  command => "/usr/bin/yum update-minimal -y",
}

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

exec { "epel":
  command => "/bin/rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
}

package { "clamav":
  ensure => present,
  require => Exec["epel"],
}

augeas { "php.ini":
  context => "/files/etc/php.ini/Date",
  changes => [
    "set date.timezone America/Los_Angeles",
  ],
}
