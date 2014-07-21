#
# == Class: shellinaboxd::params
#
# Defines some variables based on the operating system
#
class shellinaboxd::params {

    case $::osfamily {
        'Debian': {
            $package_name = 'shellinabox'
        }
        default: {
            $package_name = 'shellinabox'
        }
    }
}
