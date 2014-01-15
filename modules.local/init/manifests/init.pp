class init {
  exec { "yum update":
    command => "/usr/bin/yum update-minimal -y",
  }
}