class ssh::client inherits ssh::params
{
  package { $ssh::params::ssh_pkg:
    ensure => present,
  }

  file { $ssh::params::ssh_cfg:
    ensure => file,
    mode   => '0644',
  }

}
