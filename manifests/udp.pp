# == Class: porttest::udp
#
# UDP port test
#
# === Parameters
#
# [*target*]
#   Target IP or hostname.
#
# [*port*]
#   Port to test.
#
# === Examples
#
# porttest::udp { 'test udp to google DNS':
#   target => '8.8.8.8',      
#   port   => '53',    
# }
#
# === Authors
#
# Bryan Andrews <bryanandrews@gmail.com>
#
# === Copyright
#
# Copyright 2015 Bryan Andrews <bryanandrews@gmail.com>, unless otherwise noted.
#
# === Note
#
# The destination UDP service must respond with some kind of message to be
# tested. There are some UDP based services that do not so they are not
# verifiable.

define porttest::udp (

  $target,
  $port,

) {

  include porttest::install
  $prefix = $porttest::install::prefix
  $store  = $porttest::install::store

  exec { "Test ${target} udp ${port}":
    require => File["${prefix}/portTest.py"],
    path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ],
    command => "portTest.py ${target} ${port} udp && touch ${store}/${target}-${port}.verified-udp",
    creates => "${store}/${target}-${port}.verified-udp",
  }
}
