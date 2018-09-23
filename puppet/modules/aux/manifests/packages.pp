class aux::packages {

    package {
	'bind':
		ensure	=> present;
	'bind-utils':
		ensure	=> present;
	'openldap':
		ensure	=> present;
	'openldap-clients':
                ensure  => present;
        'openldap-servers':
                ensure  => present;
        'openldap-servers-sql':
                ensure  => present;
        'openldap-devel':
                ensure  => present;
        'compat-openldap':
                ensure  => present;
	}
}
