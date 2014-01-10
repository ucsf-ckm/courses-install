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
