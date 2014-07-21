#
# == Class: shellinaboxd::install
#
# Install shellinaboxd
#
class shellinaboxd::install
(
    $status
)
{

    include shellinaboxd::params

    package { 'shellinaboxd':
        name => "${::shellinaboxd::params::package_name}",
        ensure => $status,
    }
}
