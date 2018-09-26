class adm::config {


     file {'/usr/site/lab/sbin/run_puppet':
	ensure	=> present,
	owner	=> 'root',
	mode	=> '0550',
	source	=> "puppet:///modules/adm/usr/site/lab/sbin/run_puppet",
	}
}
