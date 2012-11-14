class build_packages {
  package { ['git', 'build-essential', 'openssl', 'libgnutls-openssl27', 'libssl-dev', 'libreadline-dev', 'zlib1g-dev']:
    ensure => present,
  }
}

class { 'build_packages': }
