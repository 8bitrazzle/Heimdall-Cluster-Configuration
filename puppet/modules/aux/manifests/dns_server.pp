class aux::dns_server {

    File {
        ensure  => "present",
        owner   => "root",
        group   => "named",
        mode    => "0660",
        require => Class['aux::packages'],
        notify  => Service['named'], 
       }

    file { "/etc/named.conf":
        source  => "puppet:///modules/aux/etc/named.conf",
        }
    file { "/var/named/fwd.cluster.lab":
        source  => "puppet:///modules/aux/var/named/fwd.cluster.lab",
        }
    file { "/var/named/reverse.cluster.lab":
        source  => "puppet:///modules/aux/var/named/reverse.cluster.lab",
        }

    service { "named":
        ensure  => $run_sevices,
        enable  => true,
        require => [ File["/etc/named.conf"], File["/var/named/fwd.cluster.lab"],
                     File["/var/named/reverse.cluster.lab"] ],
       }
}


