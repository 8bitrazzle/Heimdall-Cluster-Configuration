class aux::config {

    file {'/usr/site/lab/sbin/run_puppet':
	ensure	=> present,
	owner	=> 'root',
	mode	=> '0550',
	source	=> "puppet:///modules/aux/usr/site/lab/sbin/run_puppet",
	}
    file {'/etc/ntp.conf':
	ensure	=> present,
	owner	=> 'root',
	mode	=> '0644',
	source	=> "puppet:///modules/aux/etc/ntp.conf";
	}
}
