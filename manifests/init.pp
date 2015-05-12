#
# == Class: shellinaboxd
#
# This class installs and configures shellinaboxd. Currently limited to basic 
# installation/uninstallation and firewall management.
#
# == Parameters
#
# [*ensure*]
#   Presence of shellinaboxd. Either 'present' (default) or 'absent'.
# [*allow_address_ipv4*]
#   Allow connections from this IPv4 address/subnet. Use special value 'any' to 
#   allow access from anywhere. Defaults to 127.0.0.1.
# [*allow_address_ipv6*]
#   The IP-address part of an IPv6 subnet from which to allow connections. Use 
#   special value 'any' to allow access from anywhere. Defaults to ::1.
#
# == Authors
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-lisence
# See file LICENSE for details
#
class shellinaboxd
(
    $manage = 'yes',
    $ensure = 'present',
    $allow_address_ipv4 = '127.0.0.1',
    $allow_address_ipv6 = '::1'
)
{

if $manage == 'yes' {

    class { '::shellinaboxd::install':
        ensure => $ensure,
    }

    class { '::shellinaboxd::packetfilter':
        ensure             => $ensure,
        allow_address_ipv4 => $allow_address_ipv4,
        allow_address_ipv6 => $allow_address_ipv6,
    }

}
}
