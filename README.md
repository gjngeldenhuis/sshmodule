sshmodule
=========

Puppet ssh module
ssh

This is the ssh module.

License
-------


Contact
-------


Support
-------

Please log tickets and issues at our [Projects site](http://projects.example.com)

Example Usage
-------------
  class { 'ssh':
    listenaddress => ['127.0.0.5:8888','127.0.0.6:9999'],
        matchblock    => {
          'User johnybravo' => {
            allowAgentForwarding  => 'yes',
            allowTcpForwarding     => 'yes',
          },
          'Address 192.168.75.0/24'   => {
            permitRootLogin       => 'no',
            allowAgentForwarding  => 'no',
          },
        }
   }


Docs used
---------
http://api.libssh.org/master/index.html

External Stuff
--------------
AuthorizedKeysCommand
http://www.sysadmin.org.au/index.php/2012/12/authorizedkeyscommand/


