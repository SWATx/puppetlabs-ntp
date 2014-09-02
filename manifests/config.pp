#
class ntp::config inherits ntp {

  if $keys_enable {
    file { $keys_file:
      ensure  => file,
      owner   => 0,
      group   => ntp,
      mode    => '0640',
    }   

    $directory = dirname($keys_file)
    if $directory =~ /^\/.+\/.+$/ {
      file { $directory:
        ensure  => directory,
        owner   => 0,
        group   => 0,
        mode    => '0640',
        recurse => true,
      }
    }
  }

  file { $config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($config_template),
  }

}
