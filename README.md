# porttest

#### Table of Contents

1. [Overview](#overview)
2. [Setup - The basics of getting started with porttest](#setup)
    * [What porttest affects](#what-porttest-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with porttest](#beginning-with-porttest)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

TCP and UDP port testing for Puppet.

## Setup

### What porttest affects

* A small python script is installed in a user configurable location. This runs the TCP and UDP testing. On success a file is touched so the host+port is only tested once instead of being tested on every puppet agent run.

### Setup Requirements

Python is needed and assumed installed. Even old RedHat 5 systems have the needed Python modules installed.

### Beginning with porttest

## Usage

~~~
porttest::tcp { 'test tcp 80 to google.com': 
  target => 'google.com', 
  port   => '80', 
}

porttest::udp { 'test udp to my server': 
  target => 'udp-host.domain.local', 
  port   => '5000', 
}
~~~

## Reference

###Defines

####Public defines
* `porttest::tcp`: Test TCP ports on hosts
* `porttest::udp`: Test UDP ports on hosts

####Private classes
* `porttest::install`: Installs the port test Python script

###Parameters

#####`target`

Specify the IP, hostname, or FQDN of the target to test

#####`port`

Specify the port of the target to test

## Limitations

Python is the only requirement and comes installed with all modern Linux flavors. UDP is inherently difficult to test for. Due to the nature of UDPs fire-and-forget packet it is up to the destination service application to respond in a detectable way. If the destination service port is closed or the service doesn