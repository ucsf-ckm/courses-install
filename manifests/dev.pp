include init
include httpd
include php
include clamav
include aspell
include graphviz
# include '::mysql::server'

class { '::mysql::server':
#    root_password    => 'strongpassword',
#    override_options => { 'mysqld' => { 'max_connections' => '1024' } }
  package_ensure => 'latest',
  service_enabled => 'true',
}
