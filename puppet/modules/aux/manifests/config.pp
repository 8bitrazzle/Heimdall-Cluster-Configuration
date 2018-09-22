class aux::config {

    file {"/etc/site/lab/sbin/run_puppet":
	ensure	=> present,
	owner	=> root,
	mode	=> "0550",
	source	=> "puppet:///modules/aux/usr/site/lab/sbin/run_puppet",
	}
}
