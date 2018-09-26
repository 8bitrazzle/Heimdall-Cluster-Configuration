class adm::packages {

    package {
	'rpm-build':
		ensure	=> present;
	'gcc':
		ensure	=> present;
	'openssl':
		ensure	=> present;
	'openssl-devel':
                ensure  => present;
        'libssh2-devel':
                ensure  => present;
        'pam-devel':
                ensure  => present;
        'numactl':
                ensure  => present;
        'numactl-devel':
                ensure  => present;
	'hwloc':
		ensure	=> present;
	'hwloc-devel':
		ensure	=> present;
	'lua':
		ensure	=> present;
	'lua-devel':
		ensure	=> present;
	'readline-devel':
                ensure  => present;
        'rrdtool-devel':
                ensure  => present;
	'rrdtool':
		ensure	=> present;
        'ncurses-devel':
                ensure  => present;
        'gtk2-devel':
                ensure  => present;
        'man2html':
                ensure  => present;
	'libibmad':
		ensure	=> present;
	'libibumad':
		ensure	=> present;
	'perl-Switch':
		ensure	=> present;
	'perl-ExtUtils-MakeMaker':
		ensure	=> present;
	'mariadb-server':
                ensure  => present;
        'mariadb-devel':
                ensure  => present;
        'munge':
                ensure  => present;
        'munge-libs':
                ensure  => present;
        'munge-devel':
                ensure  => present;
	'ganglia':
		ensure	=> present;
        'ganglia-gmetad':
                ensure  => present;
        'ganglia-gmond':
                ensure  => present;
        'ganglia-web':
                ensure  => present;
	}
}
