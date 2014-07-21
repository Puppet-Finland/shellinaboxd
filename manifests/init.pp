#
# == Class: shellinaboxd
#
# This class installs and configures shellinaboxd. Currently limited to basic 
# installation/uninstallation and firewall management.
#
# == Parameters
#
# [*status*]
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
    $status = 'present',
    $allow_address_ipv4 = '127.0.0.1',
    $allow_address_ipv6 = '::1'
)
{

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_shellinaboxd', 'true') != 'false' {

    class { 'shellinaboxd::install':
        status => $status,
    }

    class { 'shellinaboxd::packetfilter':
        status => $status,
        allow_address_ipv4 => $allow_address_ipv4,
        allow_address_ipv6 => $allow_address_ipv6,
    }

}
}
