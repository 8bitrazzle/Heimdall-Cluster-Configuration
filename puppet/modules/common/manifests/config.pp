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
    file { '/etc/bashrc':
	ensure	=> file,
	owner	=> 'root',
	group	=> 'root',
	mode	=> '0644',
	source	=> 'puppet:///modules/common/etc/bashrc';
	}
    file { '/etc/resolv.conf':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
	source	=> 'puppet:///modules/common/etc/resolv.conf';
        }
    file { '/etc/selinux':
	ensure	=> file,
	source	=> 'puppet://modules/common/etc/selinux/conifg';
	}
     file { '/etc/DIR_COLORS':
	ensure	=> file,
	source	=> 'puppet:///modules/common/etc/DIR_COLORS';
	}	
	
}

