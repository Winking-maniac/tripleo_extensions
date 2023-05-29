class vault::config (
  $mysql_addr        = hiera(vault::config::mysql_addr),
  $api_addr          = hiera(vault::config::api_addr),
  $port              = hiera(vault::config::port),
  $database_name     = hiera(vault::config::database_name),
  $database_user     = hiera(vault::config::database_user),
  $database_password = hiera(vault::config::database_password),
) {
  file { '/etc/vault':
    ensure => directory,
    owner  => '0',
    group  => '0',
    mode   => '0755',
  }
  
  file { '/etc/vault/config':
    ensure => directory,
    owner  => '0',
    group  => '0',
    mode   => '0755',
  }
  
  file { 'vault-config.hcl':
    ensure  => file,
    path    => '/etc/vault/config/vault-config.hcl',
    content => template('vault/vault-config.hcl.erb'),
    owner   => '0',
    group   => '0',
    mode    => '0640'
  }

  file { '/opt/vault/':
    ensure => directory,
    owner  => '0',
    group  => '0',
    mode   => '0755',
  }

  file { 'vault-start':
    ensure  => file,
    path    => '/opt/vault/vault-start',
    content => file('vault/vault-start'),
    owner   => '0',
    group   => '0',
    mode    => '0755'
  } 

}
