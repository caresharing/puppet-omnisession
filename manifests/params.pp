class omnisession::params {
  $gem_version    = latest
  $gem_source     = undef
  $redis_url      = 'redis://127.0.0.1:6381'
  $bind_address   = '127.0.0.1'
  $port           = '64996'
  $count          = '1'
  $log_file       = undef
  $err_file       = undef
  $pid_file       = undef
  $control_port   = undef
  $runuser        = undef
  $gem_bin        = 'omnisessiond'
  $config_file    = '/etc/omnisession.yml'
  $initscript     = '/etc/init.d/omnisessiond'
  $lock_file      = undef
  $init_functions = ''
}
