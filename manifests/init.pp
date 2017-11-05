class puppetSlaver {
	
	package {'puppet':
		ensure => installed,
	}
	
	file {'/ect/default/puppet':
		content => ("puppet/puppet"),
		require => Package ['puppet'],
		notify => Service ['puppet'],
	}
	
	file { '/etc/puppet/puppet.conf':
		content => ("puppet/puppet.conf"),
                require => Package ['puppet'],
                notify => Service ['puppet'],
	}
	
	service {'puppet':
		ensure => running,
		enable => true,
		require => Package ['puppet'],
	}
}
