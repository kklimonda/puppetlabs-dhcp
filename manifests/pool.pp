define dhcp::pool (
  $network,
  $mask,
  $gateway     = '',
  $range       = '',
  $failover    = '',
  $pools       = [],
  $options     = '',
  $parameters  = '',
  $extra       = undef,
) {

  include dhcp::params

  $dhcp_dir = $dhcp::params::dhcp_dir

  $real_extra = $extra ? {
    undef   => '',
    default => template($extra),
  }

  concat::fragment { "dhcp_pool_${name}":
    target  => "${dhcp_dir}/dhcpd.pools",
    content => template('dhcp/dhcpd.pool.erb'),
  }

}

