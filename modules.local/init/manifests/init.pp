class init {
  package { "yum-plugin-security":
    ensure => "present",
  }

  exec { "yum update-minial":
    command => "/usr/bin/yum update-minimal -y",
    require => Package["yum-plugin-security"],
  }
}