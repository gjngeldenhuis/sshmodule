class ssh::params {
  $port                            = '22'
  $addressfamily                   = undef # any, inet, inet6
  $listenaddress                   = undef  # Can be multiple entries
  $protocol                        = '2'
  $syslogfacility                  = undef # 'AUTHPRIV'
  $permitrootlogin                 = undef # 'no'
  $maxauthtries                    = undef # '6'
  $maxsessions                     = undef # '10'
  $allowagentforwarding            = undef # 'yes'
  $x11forwarding                   = undef # 'no'
  $allowtcpforwarding              = undef # 'yes'
  $usedns                          = undef # 'yes'
  $compression                     = undef # 'delayed'
  $usepam                          = undef # 'yes'
  $serverkeybits                   = undef # '1024'
  $sshloglevel                     = undef # 'INFO'
  $logingracetime                  = undef # '2m'
  $rhostsrsaauthentication         = undef # 'no'
  $hostbasedauthentication         = undef # 'no'
  $ignoreuserknownhosts            = undef # 'no'
  $ignorerhosts                    = undef # 'yes'
  $passwordauthentication          = undef # 'yes'
  $permitemptypasswords            = undef # 'no'
  $challengeresponseauthentication = undef # 'no'
  $kerberosauthentication          = undef # 'no'
  $kerberosorlocalpasswd           = undef # 'yes'
  $kerberosticketcleanup           = undef # 'yes'
  $kerberosgetafstoken             = undef # 'no'
  $kerberosusekuserok              = undef # 'yes'
  $gssapiauthentication            = undef # 'no'
  $gssapicleanupcredentials        = undef # 'yes'
  $gssapistrictacceptorcheck       = undef # 'yes'
  $gssapikeyexchange               = undef # 'no'
  $gatewayports                    = undef # 'no'
  $x11displayoffset                = undef # '10'
  $x11uselocalhost                 = undef # 'yes'
  $printmotd                       = undef # 'yes'
  $printlastlog                    = undef # 'yes'
  $tcpkeepalive                    = undef # 'yes'
  $uselogin                        = undef # 'no'
  $useprivilegeseparation          = undef # 'yes'
  $permituserenvironment           = undef # 'no'
  $forcecommand                    = undef # Emtpy by default
  $kbdinteractiveauthentication    = undef # 'yes'
  $pubkeyauthentication            = undef # 'yes'
  $authorizedkeyscommand           = undef # ''
  $authorizedkeyscommandrunas      = undef # ''
  $permitopen                      = undef # 'any'
  $requiredauthentications1        = undef # ''
  $requiredauthentications2        = undef # ''
  $rsaauthentication               = undef # 'yes'
  $banner                          = undef # Empty string by default
  $chrootdirectory                 = undef # Not set by default    TODO: directory must be owned only by root, build in check

  case $::osfamily {
    'RedHat': {
      $sshd_pkg = 'openssh-server'
      $ssh_pkg = 'openssh-clients'
      $sshd_cfg = '/etc/ssh/sshd_config'
      $ssh_cfg = '/etc/ssh/ssh_config'
      $sshd_svc = 'sshd'
    }

    default: {
      fail("OSFamily ${::osfamily} not supported")
    }
  }
}
