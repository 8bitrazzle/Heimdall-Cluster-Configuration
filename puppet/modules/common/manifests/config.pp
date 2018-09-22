class common::config {

    file { '/usr/site':
	ensure	=> directory,
	owner	=> 'root', 
	group	=> 'root',
	mode	=> '0770';
	}
    file { '/usr/site/lab':
        ensure  => directory,
        owner   => 'root',
        group   => 'root',
        mode    => '0770';
	}
    file { '/usr/site/lab/sbin':
        ensure  => directory,
        owner   => 'root',
        group   => 'root',
        mode    => '0770';
        }
}

