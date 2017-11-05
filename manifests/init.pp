class puppetslaver {
	
	package {'puppet':
		ensure => installed,
	}
	
	file {'/ect/default/puppet':
		content => template ("puppet/puppet"),
		require => Package ['puppet'],
		notify => Service ['puppet'],
	}
	
	file { '/etc/puppet/puppet.conf':
		content => template ("puppet/puppet.conf"),
                require => Package ['puppet'],
                notify => Service ['puppet'],
	}
	
	service {'puppet':
		ensure => running,
		enable => true,
		require => Package ['puppet'],
	}
}
