class clamav {
  exec { "epel":
    command => "/bin/rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
  }

  package { "clamav":
    ensure => present,
    require => Exec["epel"],
  }
}