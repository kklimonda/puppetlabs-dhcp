define dhcp::class($match = undef) {
  $class = $name
  include dhcp::params

  $dhcp_dir = $dhcp::params::dhcp_dir

  concat::fragment { "dhcp_class_${name}":
    target  => "${dhcp_dir}/dhcpd.classes",
    content => template('dhcp/dhcpd.class.erb'),
    order   => 10,
  }
}
