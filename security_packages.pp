class security_packages {
  package { ['bcrypt', 'checksecurity', 'harden-clients', 'harden-servers', 'nmap', 'logcheck', 'logcheck-database', 'mlocate', 'debsums']:
    ensure => present
  }

  package {'denyhosts':
    ensure => present,
  }

  service {'denyhosts':
    ensure => running,
    enable => true
  }

  #make sure these get removed
  package {['nfs-common', 'portmap', 'rpcbind', 'locate', 'xinetd']:
    ensure => purged
  }
}

class {'security_packages': }
