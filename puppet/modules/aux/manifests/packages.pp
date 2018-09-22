class aux::packages {

    package {
	'bind':
		ensure => present;
	'bind-utils':
		ensure => present;
	}
}
