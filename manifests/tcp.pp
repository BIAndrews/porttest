# == Class: porttest::tcp
#
# TCP port test
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
# porttest::tcp { 'test tcp 80 to google.com':
#   target => 'google.com',
#   port   => '80',    
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

define porttest::tcp (

  $target,
  $port,

) {

  include porttest::install
  $prefix = $porttest::install::prefix
  $store  = $porttest::install::store

  exec { "Test ${target} tcp ${port}":
    require => File["${prefix}/portTest.py"],
    path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ],
    command => "portTest.py ${target} ${port} tcp && touch ${store}/${target}-${port}.verified",
    creates => "${store}/${target}-${port}.verified",
  }
}
