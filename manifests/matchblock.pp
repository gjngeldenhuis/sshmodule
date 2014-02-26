define ssh::matchblock (
  $match                        = $name,
  $allowagentforwarding         = $::ssh::params::allowagentforwarding,
  $allowtcpforwarding           = $::ssh::params::allowtcpforwarding,
  $banner                       = $::ssh::params::banner,
  $chrootdirectory              = $::ssh::params::chrootdirectory,
  $forcecommand                 = $::ssh::params::forcecommand,
  $gatewayports                 = $::ssh::params::gatewayports,
  $gssapiauthentication         = $::ssh::params::gssapiauthentication,
  $hostbasedauthentication      = $::ssh::params::hostbasedauthentication,
  $kbdinteractiveauthentication = $::ssh::params::kbdinteractiveauthentication,
  $kerberosauthentication       = $::ssh::params::kerberosauthentication,
  $kerberosusekuserok           = $::ssh::params::kerberosusekuserok,
  $maxauthtries                 = $::ssh::params::maxauthtries,
  $maxsessions                  = $::ssh::params::maxsessions,
  $pubkeyauthentication         = $::ssh::params::pubkeyauthentication,
  $authorizedkeyscommand        = $::ssh::params::authorizedkeyscommand,
  $authorizedkeyscommandrunas   = $::ssh::params::authorizedkeyscommandrunas,
  $passwordauthentication       = $::ssh::params::passwordauthentication,
  $permitemptypasswords         = $::ssh::params::permitemptypasswords,
  $permitopen                   = $::ssh::params::permitopen,
  $permitrootlogin              = $::ssh::params::permitrootlogin,
  $requiredauthentications1     = $::ssh::params::requiredauthentications1,
  $requiredauthentications2     = $::ssh::params::requiredauthentications2,
  $rhostsrsaauthentication      = $::ssh::params::rhostsrsaauthentication,
  $rsaauthentication            = $::ssh::params::rsaauthentication,
  $x11displayoffset             = $::ssh::params::x11displayoffset,
  $x11forwarding                = $::ssh::params::x11forwarding,
  $X11uselocalhost              = $::ssh::params::X11uselocalhost,
)
{

  if ! defined(Class['ssh::server']) {
    fail('You must include the ssh::server base class before using any matchblock defined resources')
  }

  concat::fragment{ "sshd_matchblock_${name}":
    target  => $::ssh::params::sshd_cfg,
    content => template('ssh/sshd_matchblock.erb'),
    order   => '10',
  }

}
