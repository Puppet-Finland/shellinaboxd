#
# == Class: shellinaboxd::install
#
# Install shellinaboxd
#
class shellinaboxd::install
(
    $ensure

) inherits shellinaboxd::params
{
    package { 'shellinaboxd':
        ensure => $ensure,
        name   => $::shellinaboxd::params::package_name,
    }
}
