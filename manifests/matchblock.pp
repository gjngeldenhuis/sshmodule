include ssh
include ssh::params

define ssh::matchblock (
  $allowagentforwarding        = $::ssh::params::allowagentforwarding,
  $allowtcpforwarding          = $::ssh::parms::allowtcpforwarding,
  $banner                      = $::ssh::params::banner,
  $chrootdirectory             = $::ssh::paramschrootdirectory,
  $forcecommand                = $::ssh::params::forcecommand,
  $gatewayports                = $::ssh::params::gatewayports,
  $gssapiauthentication        = $::ssh::params::gssapiauthentication,
  $hostbasedauthentication     = $::ssh::params::hostbasedauthentication,
  $kbdinteractiveauthenticatio = $::ssh::params::kbdinteractiveauthentication,
  $kerberosauthentication      = $::ssh::params::kerberosauthentication,
  $kerberosusekuserok          = $::ssh::params::kerberosusekuserok,
  $maxauthtries                = $::ssh::params::maxauthtries,
  $maxsessions                 = $::ssh::params::maxsessions,
  $pubkeyauthentication        = $::ssh::params::pubkeyauthentication,
  $authorizedkeyscommand       = $::ssh::params::authorizedkeyscommand,
  $authorizedkeyscommandrunas  = $::ssh::params::authorizedkeyscommandrunas,
  $passwordauthentication      = $::ssh::params::passwordauthentication,
  $permitemptypasswords        = $::ssh::params::permitemptypasswords,
  $permitopen                  = $::ssh::params::permitopen,
  $permitrootlogin             = $::ssh::params::permitrootlogin,
  $requiredauthentications1    = $::ssh::params::requiredauthentications1,
  $requiredauthentications2    = $::ssh::params::requiredauthentications2,
  $rhostsrsaauthentication     = $::ssh::params::rhostsrsaauthentication,
  $rsaauthentication           = $::ssh::params::rsaauthentication,
  $x11displayoffset            = $::ssh::params::x11displayoffset,
  $x11forwarding               = $::ssh::params::x11forwarding,
  $X11uselocalhost             = $::ssh::params::X11uselocalhost,
)
{
  concat::fragment{ $name:
    target  => $::ssh::sshd_config,
    content => "blah $name",
    order   => '10',
  }
}
