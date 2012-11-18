class utility_packages {
  package { ['bzip2', 'inotail', 'less', 'reportbug', 'xz-utils', 'zsh', 'tmux', 'pv', 'mosh', 'iotop', 'slurm']:
    ensure => present,
  }
}

class { 'utility_packages': }
