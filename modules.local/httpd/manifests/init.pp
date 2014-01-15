class httpd {
  package { "httpd.x86_64":
    ensure => present,
  }
}