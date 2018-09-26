class aux::packages {

    package {
	'bind':
		ensure	=> present;
	'bind-utils':
		ensure	=> present;
	'ntp':
		ensure	=> present;
	'ipa-server':
		ensure	=> present;
	'rng-tools':
		ensure	=> present;
	}
}
