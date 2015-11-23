class omnisession (
  $gem_version  = $::omnisession::params::gem_version,
  $gem_source   = $::omnisession::params::gem_source,
  $redis_url    = $::omnisession::params::redis_url,
  $bind_address = $::omnisession::params::bind_address,
  $port         = $::omnisession::params::port,
  $count        = $::omnisession::params::count,
  $log_file     = $::omnisession::params::log_file,
  $pid_file     = $::omnisession::params::pid_file,
  $control_port = $::omnisession::params::control_port,
  $runuser      = $::omnisession::params::runuser,
  $gem_bin      = $::omnisession::params::gem_bin,
  $config_file  = $::omnisession::params::config_file,
  $lock_file    = $::omnisession::params::lock_file,
  $initscript   = $::omnisession::params::initscript,

) inherits ::omnisession::params {

  package { "palmade-omnisession":
    ensure   => $gem_version,
    provider => 'gem',
    source   => $gem_source,
  }

  file { $config_file:
    ensure  => file,
    owner   => $runuser,
    content => epp('omnisession/omnisession.yml.epp'),
    require => Package['palmade-omnisession'],
  }

  file { $initscript:
    ensure  => present,
    owner   => root,
    content => epp('omnisession/omnisessiond.init'),
    require => File[$config_file],
    notify  => Service['omnisessiond'],
  }

  service { "omnisessiond":
    ensure => running,
    enable => true,
  }
}



