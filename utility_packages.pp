class utility_packages {
  package { ['bzip2', 'inotail', 'less', 'reportbug', 'xz-utils', 'zsh', 'tmux', 'pv', 'mosh']:
    ensure => present,
  }
}

class { 'utility_packages': }
