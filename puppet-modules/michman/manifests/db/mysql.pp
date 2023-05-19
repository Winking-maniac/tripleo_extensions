class michman::db::mysql(
  $password,
  $dbname        = 'michman',
  $user          = 'michman',
  $host          = '127.0.0.1',
  $charset       = 'utf8',
  $collate       = 'utf8_general_ci',
  $allowed_hosts = undef,
) {

  ::openstacklib::db::mysql { 'michman':
    user          => $user,
    password_hash => mysql::password($password),
    dbname        => $dbname,
    host          => $host,
    charset       => $charset,
    collate       => $collate,
    allowed_hosts => $allowed_hosts
  }
}
