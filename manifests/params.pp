class ssh::params {
  $port                            = '22'
  $addressfamily                   = 'inet' # any, inet, inet6
  $listenaddress                   = ''  # Can be multiple entries, but must be preceded by Port value in config file if not port value is specified as part of the address.
  $protocol                        = '2'
  $syslogfacility                  = 'AUTHPRIV'
  $permitrootlogin                 = 'UNDEF' # 'no'
  $maxauthtries                    = 'UNDEF' # '6'
  $maxsessions                     = 'UNDEF' # '10'
  $allowagentforwarding            = 'UNDEF' # 'yes'
  $x11forwarding                   = 'UNDEF' # 'no'
  $allowtcpforwarding              = 'UNDEF' # 'yes'
  $matchblock                      = {}
  $usedns                          = 'yes'
  $compression                     = 'delayed'
  $usepam                          = 'yes'
  $serverkeybits                   = '1024'
  $sshloglevel                     = 'INFO'
  $logingracetime                  = '2m'
  $rhostsrsaauthentication         = 'UNDEF' # 'no'
  $hostbasedauthentication         = 'UNDEF' # 'no'
  $ignoreuserknownhosts            = 'no'
  $ignorerhosts                    = 'yes'
  $passwordauthentication          = 'UNDEF' # 'yes'
  $permitemptypasswords            = 'UNDEF' # 'no'
  $challengeresponseauthentication = 'no'
  $kerberosauthentication          = 'UNDEF' # 'no'
  $kerberosorlocalpasswd           = 'yes'
  $kerberosticketcleanup           = 'yes'
  $kerberosgetafstoken             = 'no'
  $kerberosusekuserok              = 'UNDEF' # 'yes'
  $gssapiauthentication            = 'UNDEF' # 'no'
  $gssapicleanupcredentials        = 'yes'
  $gssapistrictacceptorcheck       = 'yes'
  $gssapikeyexchange               = 'no'
  $gatewayports                    = 'UNDEF' # 'no'
  $x11displayoffset                = 'UNDEF' # '10'
  $x11uselocalhost                 = 'UNDEF' # 'yes'
  $printmotd                       = 'yes'
  $printlastlog                    = 'yes'
  $tcpkeepalive                    = 'yes'
  $uselogin                        = 'no'
  $useprivilegeseparation          = 'yes'
  $permituserenvironment           = 'no'
  $forcecommand                    = 'UNDEF' # Emtpy by default
  $kbdinteractiveauthentication    = 'UNDEF' # 'yes'
  $pubkeyauthentication            = 'UNDEF' # 'yes'
  $authorizedkeyscommand           = 'UNDEF' # ''
  $authorizedkeyscommandrunas      = 'UNDEF' # ''
  $permitopen                      = 'UNDEF' # 'any'
  $requiredauthentications1        = 'UNDEF' # ''
  $requiredauthentications2        = 'UNDEF' # ''
  $rsaauthentication               = 'UNDEF' # 'yes'
  $banner                          = 'UNDEF' # Empty string by default
  $chrootdirectory                 = 'UNDEF' # Not set by default    TODO: directory must be owned only by root, build in check
  # protocol version 1 only
}
