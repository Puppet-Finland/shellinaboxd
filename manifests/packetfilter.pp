#
# == Class shellinaboxd::packetfilter
#
# Configures packetfiltering rules for shellinaboxd
#
class shellinaboxd::packetfilter
(
    $status,    
    $allow_address_ipv4,
    $allow_address_ipv6
)
{

    # IPv4 rules
    firewall { '003 ipv4 accept shellinaboxd':
        ensure => $status,
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $allow_address_ipv4 ? {
            'any' => undef,
            default => $allow_address_ipv4,
        },
        dport => 12320,
        action => 'accept',
    }

    # IPv6 rules
    firewall { '003 ipv6 accept shellinaboxd':
        ensure => $status,
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $allow_address_ipv6 ? {
            'any' => undef,
            default => $allow_address_ipv6,
        },
        dport => 12320,
        action => 'accept',
    }
}
