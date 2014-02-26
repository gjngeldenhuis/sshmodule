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

# Data validation
  if $addressfamily { validate_re($addressfamily, '(inet|inet6|any)') }
  if $syslogfacility { validate_re($syslogfacility, '(DAEMON|USER|AUTH|AUTHPRIV|LOCAL0|LOCAL1|LOCAL2|LOCAL3|LOCAL4|LOCAL5|LOCAL6|LOCAL7)') }
  if $permitrootlogin { validate_re($permitrootlogin, '(yes|no|without-password|forced-commands-only)') }
  if $compression { validate_re($compression, '(yes|no|delayed)') }
  if $maxsessions { validate_number($maxsessions) }
  if $maxauthtries { validate_number($maxuauthtries) }
  if $allowagentforwarding { validate_re($allowagentforwarding, '(yes|no)') }
  if $x11forwarding { validate_re($x11forwarding, '(yes|no)') }
  if $allowtcpforwarding { validate_re($allowtcpforwarding, '(yes|no)') }
  if $usedns { validate_re($usedns, '(yes|no)') }
#  $compression                     = undef # 'delayed'
#  $usepam { validate_re($usepam, '(yes|no)'}
#  $serverkeybits                   = undef # '1024' only protocol 1
#  $sshloglevel                     = undef # 'INFO'
#  $logingracetime                  = undef # '2m'
#  if $rhostsrsaauthentication { validate_re($rhostsrsaauthentication, '(yes|no)') }# only protocol 1
#  if $hostbasedauthentication { validate_re($hostbasedauthentication, '(yes|no)') }# only protocol 1
  if $ignoreuserknownhosts { validate_re($ignoreuserknownhosts, '(yes|no)') }
  if $ignorerhosts { validate_re($ignorerhosts, '(yes|no)') }
  if $passwordauthentication { validate_re($passwordauthentication, '(yes|no)') }
  if $permitemptypasswords { validate_re($permitemptypasswords, '(yes|no)') }
  if $challengeresponseauthentication { validate_re($challengeresponseauthentication, '(yes|no)') }
  if $kerberosauthentication { validate_re($kerberosauthentication, '(yes|no)') }
  if $kerberosorlocalpasswd { validate_re($kerberosorlocalpasswd, '(yes|no)') }
  if $kerberosticketcleanup { validate_re($kerberosticketcleanup, '(yes|no)') }
  if $kerberosgetafstoken { validate_re($kerberosgetafstoken, '(yes|no)') }
  if $kerberosusekuserok { validate_re($kerberosusekuserok, '(yes|no)') }
  if $gssapiauthentication { validate_re($gssapiauthentication, '(yes|no)') }
  if $gssapicleanupcredentials { validate_re($gssapicleanupcredentials, '(yes|no)') }
  if $gssapistrictacceptorcheck { validate_re($gssapistrictacceptorcheck, '(yes|no)') }
  if $gssapikeyexchange { validate_re($gssapikeyexchange, '(yes|no)') }
  if $gatewayports { validate_re($gatewayports, '(yes|no)') }
  if $x11displayoffset { validate_number($x11displayoffset) }
  if $x11uselocalhost { validate_re($x11uselocalhost, '(yes|no)') }
  if $printmotd { validate_re($printmotd, '(yes|no)') }
  if $printlastlog { validate_re($printlastlog, '(yes|no)') }
  if $tcpkeepalive { validate_re($tcpkeepalive, '(yes|no)') }
  if $uselogin { validate_re($uselogin, '(yes|no)') }
  if $useprivilegeseparation { validate_re($useprivilegeseparation, '(yes|no)') }
  if $permituserenvironment { validate_re($permituserenvironment, '(yes|no)') }
  if $kbdinteractiveauthentication { validate_re($kbdinteractiveauthentication, '(yes|no)') }
  if $pubkeyauthentication { validate_re($pubkeyauthentication, '(yes|no)') }

  # do data validation for ListenAddress, it can take multiple arguments in the form of x.x.x.x or x.x.x.x:y or ipv6 compatible.

  package { $::ssh::params::sshd_pkg:
    ensure => installed,
  }

  service { $::ssh::params::sshd_svc:
    ensure    => running,
    enable    => true,
    subscribe => File[$::ssh::params::sshd_cfg],
  }

  concat{ $::ssh::params::sshd_cfg:
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }


  concat::fragment { 'main':
    target  => $::ssh::params::sshd_cfg,
    content => template('ssh/sshd_config.erb'),
    order   => '00'
  }

}
