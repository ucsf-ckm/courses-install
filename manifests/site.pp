exec { "yum update":
  command => "/usr/bin/yum update-minimal -y",
}

package { "httpd.x86_64":
  ensure => present,
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

package { "aspell.x86_64":
  ensure => present,
}

package { "graphviz.x86_64":
  ensure => present,
}

cron { moodle_cron:
  command => "/usr/bin/php /var/www/html/admin/cli/cron.php > /dev/null",
  user    => apache,
  minute  => "*/10",
  require => Package["httpd.x86_64"],
}
