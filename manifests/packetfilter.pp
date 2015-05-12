#
# == Class shellinaboxd::packetfilter
#
# Configures packetfiltering rules for shellinaboxd
#
class shellinaboxd::packetfilter
(
    $ensure,
    $allow_address_ipv4,
    $allow_address_ipv6
)
{
    # IPv4 rules
    $source_v4 = $allow_address_ipv4 ? {
        'any'   => undef,
        default => $allow_address_ipv4,
    }

    firewall { '003 ipv4 accept shellinaboxd':
        ensure   => $ensure,
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v4,
        dport    => 12320,
        action   => 'accept',
    }

    # IPv6 rules
    $source_v6 = $allow_address_ipv6 ? {
        'any'   => undef,
        default => $allow_address_ipv6,
    }

    firewall { '003 ipv6 accept shellinaboxd':
        ensure   => $ensure,
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v6,
        dport    => 12320,
        action   => 'accept',
    }
}
