# == Class: ssh::server
#
# Full description of class ssh here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { ssh:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Gerhardus Geldenhuis <gerhardus.geldenhuis@gmail.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#

# Maybe make listenaddress an defined resource, rather than an array. that way it makes checking the data easier

class ssh::server (
  $port                            = $::ssh::params::port,
  $addressfamily                   = $::ssh::params::addressfamily,
  $listenaddress                   = $::ssh::params::listenaddress,
  $protocol                        = $::ssh::params::protocol,
  $syslogfacility                  = $::ssh::params::syslogfacility,
  $permitrootlogin                 = $::ssh::params::permitrootlogin,
  $maxauthtries                    = $::ssh::params::maxauthtries,
  $maxsessions                     = $::ssh::params::maxsessions,
  $allowagentforwarding            = $::ssh::params::allowagentforwarding,
  $x11forwarding                   = $::ssh::params::x11forwarding,
  $allowtcpforwarding              = $::ssh::params::allowtcpforwarding,
  $usedns                          = $::ssh::params::usedns,
  $compression                     = $::ssh::params::compression,
  $usepam                          = $::ssh::params::usepam,
  $serverkeybits                   = $::ssh::params::serverkeybits,
  $sshloglevel                     = $::ssh::params::sshloglevel,
  $logingracetime                  = $::ssh::params::logingracetime,
  $rhostsrsaauthentication         = $::ssh::params::rhostsrsaauthentication,
  $hostbasedauthentication         = $::ssh::params::hostbasedauthentication,
  $ignoreuserknownhosts            = $::ssh::params::ignoreuserknownhosts,
  $ignorerhosts                    = $::ssh::params::ignorerhosts,
  $passwordauthentication          = $::ssh::params::passwordauthentication,
  $permitemptypasswords            = $::ssh::params::permitemptypasswords,
  $passwordauthentication          = $::ssh::params::passwordauthentication,
  $challengeresponseauthentication = $::ssh::params::challengeresponseauthentication,
  $kerberosauthentication          = $::ssh::params::kerberosauthentication,
  $kerberosorlocalpasswd           = $::ssh::params::kerberosorlocalpasswd,
  $kerberosticketcleanup           = $::ssh::params::kerberosticketcleanup,
  $kerberosgetafstoken             = $::ssh::params::kerberosgetafstoken,
  $kerberosusekuserok              = $::ssh::params::kerberosusekuserok,
  $gssapiauthentication            = $::ssh::params::gssapiauthentication,
  $gssapicleanupcredentials        = $::ssh::params::gssapicleanupcredentials,
  $gssapistrictacceptorcheck       = $::ssh::params::gssapistrictacceptorcheck,
  $gssapikeyexchange               = $::ssh::params::gssapikeyexchange,
  $gatewayports                    = $::ssh::params::gatewayports,
  $x11displayoffset                = $::ssh::params::x11displayoffset,
  $x11uselocalhost                 = $::ssh::params::x11uselocalhost,
  $printmotd                       = $::ssh::params::printmotd,
  $printlastlog                    = $::ssh::params::printlastlog,
  $tcpkeepalive                    = $::ssh::params::tcpkeepalive,
  $uselogin                        = $::ssh::params::uselogin,
  $useprivilegeseparation          = $::ssh::params::useprivilegeseparation,
  $permituserenvironment           = $::ssh::params::permituserenvironment,
  $permitopen                      = $::ssh::params::permitopen,

) inherits ssh::params {

  # TODO
  # 1. Write generic data validator or at least generic for yes/no
  # 2. Find a way to improve matchblock or at least do data checking.

  # Data validation
  if $addressfamily { validate_re($addressfamily, '(inet|inet6|any)') }
  if $syslogfacility { validate_re($syslogfacility, '(DAEMON|USER|AUTH|AUTHPRIV|LOCAL0|LOCAL1|LOCAL2|LOCAL3|LOCAL4|LOCAL5|LOCAL6|LOCAL7)') }
  if $permitrootlogin { validate_re($permitrootlogin, '(yes|no|without-password|forced-commands-only)') }
  if $compression { validate_re($compression, '(yes|no|delayed)') }
  if $maxsessions { validate_number2($maxsessions) }

  #  if $maxauthtries { is_numeric($maxauthtries) }
  #  if $maxsessions { is_numeric($maxsessions) }

  #rhostsrsaauthentication  only valid for protocol 1, provide warning message.
  #hostbasedauthentication  only valid for protocol 2, provide warning message.


  # do data validation for ListenAddress, it can take multiple arguments in the form of x.x.x.x or x.x.x.x:y or ipv6 compatible.

  package { 'openssh':
    ensure    => installed,
  }

  service { 'sshd':
    ensure => running,
    #    subscribe => File['/etc/ssh/sshd_config'],
  }

  $sshd_config = '/etc/ssh/sshd_config'

  concat{ $sshd_config:
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }


  concat::fragment { 'main':
    target  => $sshd_config,
    content => template('ssh/sshd_config.erb'),
    order   => '00'
  }

}
