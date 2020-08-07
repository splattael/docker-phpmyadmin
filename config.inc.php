<?php

/* Servers configuration */
$i = 0;

$vars = array(
    'PMA_SERVERS'
);
foreach ($vars as $var) {
    $env = getenv($var);
    if (!isset($_ENV[$var]) && $env !== false) {
        $_ENV[$var] = $env;
    }
}

# Examples:
# * mysql://user:pass@host:port,[...]
# * mysql://mysql
# * mysql://localhost:3306
# * mysql://root:secret@localhost
# * mysql://localhost/path/to/socket
# * mysql://host1,mysql://user:pass@host2
$env_servers = isset($_ENV['PMA_SERVERS']) ? $_ENV['PMA_SERVERS'] : 'mysql://mysql';
print var_dump($env_servers);
$servers = preg_split('/\s*,\s*/', $env_servers);

function url_part($url, $part) {
  return isset($url[$part]) ? $url[$part] : '';
}

foreach ($servers as $server) {
  $url = parse_url($server);
  if ($url === false) next;
  if (url_part($url, 'scheme') !== 'mysql') next;
  if (url_part($url, 'host') === '') next;

  $i++;

  $cfg['Servers'][$i]['verbose'] = url_part($url, 'host');
  $cfg['Servers'][$i]['host'] = url_part($url, 'host');
  $cfg['Servers'][$i]['port'] = url_part($url, 'port');
  $cfg['Servers'][$i]['socket'] = url_part($url, 'path');
  $cfg['Servers'][$i]['connect_type'] = 'tcp';
  $cfg['Servers'][$i]['auth_type'] = 'cookie';
  $cfg['Servers'][$i]['user'] = url_part($url, 'user');
  $cfg['Servers'][$i]['password'] = url_part($url, 'password');
}


/* End of servers configuration */

$cfg['blowfish_secret'] = 'NO_SECRET';
$cfg['DefaultLang'] = 'en';
$cfg['ServerDefault'] = 1;
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
$cfg['ExecTimeLimit'] = $_ENV['PHP_MAX_EXECUTION_TIME'];
?>
