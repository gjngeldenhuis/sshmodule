class ssh::params {

}
class ssh (
  $port                    = '22',
  $addressfamily           = 'inet', # any, inet, inet6
  $listenaddress, # Can be multiple entries, but must be preceded by Port value in config file if not port value is specified as part of the address.
  $protocol                = '2',
  $syslogfacility          = 'AUTHPRIV',
  $permitrootlogin         = 'no',
  $maxauthtries            = '6',
  $maxsessions             = '10',
  $allowagentforwarding    = 'yes',
  $x11forwarding           = 'no',
  $allowtcpforwarding      = 'yes',
  $matchblock              = {},
  $usedns                  = 'yes',
  $compression             = 'delayed',
  $usepam                  = 'yes',
  $serverkeybits           = '1024',
  $sshloglevel             = 'INFO',
  $logingracetime          = '2m',
  $rhostsrsaauthentication = 'no',
  $hostbasedauthentication = 'no',
  $ignoreuserknownhosts    = 'no',
  $ignorerhosts            = 'yes',
  $passwordauthentication  = 'yes',
  $permitemptypasswords    = 'no',
  $passwordauthentication  = 'yes',
  $challengeresponseauthentication = 'no',
  $kerberosauthentication = 'no',
  $kerberosorlocalpasswd = 'yes',
  $kerberosticketcleanup = 'yes',
  $kerberosgetafstoken = 'no',
  $kerberosusekuserok = 'yes',
  $gssapiauthentication = 'no',
  $gssapicleanupcredentials = 'yes',
  $gssapistrictacceptorcheck = 'yes',
  $gssapikeyexchange = 'no',
  $gatewayports = 'no',
  $x11displayoffset = '10',
  $x11uselocalhost = 'yes',
  $printmotd = 'yes',
  $printlastlog = 'yes',
  $tcpkeepalive = 'yes',
  $uselogin = 'no',
  $useprivilegeseparation = 'yes',
  $permituserenvironment = 'no',

){

  # TODO
  # 1. Write generic data validator or at least generic for yes/no
  # 2. Find a way to improve matchblock or at least do data checking.

  # Data validation
  if ! ($addressfamily in['inet','inet6','any']) { 
    fail("${module_name}: Invalid AddressFamily Parameter") 
  }

  if ! ($syslogfacility in ['DAEMON','USER','AUTH','AUTHPRIV','LOCAL0','LOCAL1','LOCAL2','LOCAL3','LOCAL4','LOCAL5','LOCAL6','LOCAL7']) {
    fail("${module_name}: Invalid SyslogFacility Parameter") 
  }

  if ! ($permitrootlogin in ['yes','no','without-password','forced-commands-only']) {
    fail("${module_name}: Invalid PermitRootLogin Parameter") 
  }

  if ! ($compression in ['yes','no','delayed']) {
    fail("${module_name}: Invalid Compression Parameter") 
  }

  #rhostsrsaauthentication  only valid for protocol 1, provide warning message.
  #hostbasedauthentication  only valid for protocol 2, provide warning message.

  
  #  $conditional_block = {
  #    allowagentforwarding => 'yes',
  #    AllowTcpForwarding,
  #    Banner,
  #    ChrootDirectory,
  #    ForceCommand,
  #    GatewayPorts,
  ##    GSSAPIAuthentication,
  #    HostbasedAuthentication,
  #    KbdInteractiveAuthentication,
  #    KerberosAuthentication,
  #    KerberosUseKuserok,
  #    MaxAuthTries,
  #    MaxSessions,
  #    PubkeyAuthentication,
  #    AuthorizedKeysCommand,
  #    AuthorizedKeysCommandRunAs,
  #    PasswordAuthentication,
  #    PermitEmptyPasswords,
  #    PermitOpen,
  #    PermitRootLogin,
  #    RequiredAuthentications1,
  #    RequiredAuthentications2,
  #    RhostsRSAAuthentication,
  #    RSAAuthentication,
  #    X11DisplayOffset,
  #    X11Forwarding,
  #    X11UseLocalHost,
  #}

  # do data validation for ListenAddress, it can take multiple arguments in the form of x.x.x.x or x.x.x.x:y or ipv6 compatible.

  package { 'openssh':
    ensure    => installed,
  }

  service { 'sshd':
    ensure => running,
    #    subscribe => File['/etc/ssh/sshd_config'],
  }

  file { '/etc/ssh/sshd_config':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('ssh/sshd_config.erb'),
  }

}
