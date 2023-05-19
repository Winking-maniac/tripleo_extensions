class michman::config (
  $ssh_key_name       = hiera(michman::config::ssh_key_name),
  $os_version         = hiera(michman::config::os_version),
  $boot_from_volume   = hiera(michman::config::boot_from_volume),
  $vault_prefix       = hiera(michman::config::vault_prefix),
  $os_key_path        = hiera(michman::config::os_key_path),
  $ssh_key_path       = hiera(michman::config::ssh_key_path),
  $ssh_key            = hiera(michman::config::ssh_key),
  $mysql_key_path     = hiera(michman::config::mysql_key_path),
  $mysql_addr         = hiera(michman::config::mysql_addr),
  $database_name      = hiera(michman::config::database_name),
  $database_password  = hiera(michman::config::database_password),
  $database_user      = hiera(michman::config::database_user),
  $vault_addr         = hiera(michman::config::vault_addr),
  $vault_port         = hiera(michman::config::vault_port),
  $keystone_addr      = hiera(michman::config::keystone_addr),
  $openstack_password = hiera(michman::config::openstack_password),
  $project_name       = hiera(michman::config::project_name),
  $region_name        = hiera(michman::config::region_name),
  $openstack_username = hiera(michman::config::openstack_username),
) {
  file { '/etc/michman/configs':
    ensure => directory,
    owner  => '0',
    group  => '0',
    mode   => '0755',
  }

  file { 'michman-config':
    ensure  => file,
    path    => '/etc/michman/config.yaml',
    content => template('michman/config.yaml.erb'),
    owner   => '0',
    group   => '0',
    mode    => '0640'
  }

  file { 'policy-config':
    ensure  => file,
    path    => '/etc/michman/configs/polisy.csv',
    content => template('michman/policy.csv.erb'),
    owner   => '0',
    group   => '0',
    mode    => '0640'
  }

  file { 'auth-config':
    ensure  => file,
    path    => '/etc/michman/configs/auth_model.conf',
    content => template('michman/auth_model.conf.erb'),
    owner   => '0',
    group   => '0',
    mode    => '0640'
  }

  file { 'mariadb_data':
    ensure  => file,
    path    => '/etc/michman/configs/mariadb_data.json',
    content => template('michman/mariadb_data.json.erb'),
    owner   => '0',
    group   => '0',
    mode    => '0640'
  }

  file { 'os_data':
    ensure  => file,
    path    => '/etc/michman/configs/openstack_data.json',
    content => template('michman/openstack_data.json.erb'),
    owner   => '0',
    group   => '0',
    mode    => '0640'
  }

  file { 'create_tables.sql':
    ensure  => file,
    path    => '/etc/michman/configs/create_tables.sql',
    content => file('michman/create_tables.sql'),
    owner   => '0',
    group   => '0',
    mode    => '0640'
  }
  
  file { 'ssh_key':
    ensure  => file,
    path    => '/etc/michman/configs/ssh_key',
    content => template('michman/ssh_key.erb'),
    owner   => '0',
    group   => '0',
    mode    => '0640'
  }

}

