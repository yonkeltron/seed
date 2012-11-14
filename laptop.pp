class security_packages {
  package { ['bcrypt', 'checksecurity' 'harden-clients', 'harden-servers', 'nmap', 'logcheck', 'logcheck-database', 'mlocate', 'debsums']:
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
  pacakge {['nfs-common', 'portmap', 'rpcbind', 'locate']:
    ensure => purged
  }
}

class general_utils {
  package {'bzip2':
    ensure => present,
  }

  package {'git':
    ensure => present,
  }

  package {'inotail':
    ensure => present,
  }

  package {'less':
    ensure => present,
  }

  package {'lsof':
    ensure => present,
  }

  package {'reportbug':
    ensure => present,
  }

  package {'xz-utils':
    ensure => present,
  }

  package {'zsh':
    ensure => present,
  }
  package {'tmux':
    ensure => present,
  }
}

class {'security_packages': }
class {'general_utils': }
