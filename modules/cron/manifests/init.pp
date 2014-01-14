class cron {
  package { "postfix.x86_64":
    ensure => present,
  }

  service { "postfix":
    enable => true,
    ensure => running,
    require => Package["postfix.x86_64"],
  }

  augeas { "main.cf":
    context => "/files/etc/postfix/main.cf",
    changes => [
      "set mydomain library.ucsf.edu",
      "set myorigin \$mydomain",
      "set relayhost [mailhost.library.ucsf.edu]",
    ],
    notify => Service["postfix"],
    require => Package["postfix.x86_64"],
  }

  cron { moodle_cron:
    command => "/usr/bin/php /var/www/html/admin/cli/cron.php > /dev/null",
    environment => "MAILTO=CLE-Tech@ucsf.edu",
    user    => apache,
    minute  => "*/10",
    require => [Package["httpd.x86_64"], Package["php-cli.x86_64"], Package["postfix.x86_64"]],
  }
}