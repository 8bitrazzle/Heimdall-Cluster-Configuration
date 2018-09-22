class aux::dns_server {

    file { "/etc/named.conf":
	ensure	=> file,
	owner	=> "root",
	group	=> "named",
	mode	=> "0660",
	source	=> "puppet:///modules/aux/etc/named.conf",
	notify 	=> Service['named'];
	}	
    file { "/var/named/fwd.cluster.lab":
        ensure  => file,
        owner   => "root",
        group   => "named",
        mode    => "0660",
        source  => "puppet:///modules/aux/var/named/fwd.cluster.lab",
	notify	=> Service['named'];
	}

    service { "named":
	ensure	=> $run_sevices,
	enable	=> true,
	require	=> File["/etc/named.conf"],
	}
}
