
class base_utils {

	package { 'screen':
		ensure => present
	}

	package { ['nmap', 'ngrep', 'tcpdump', 'tshark']:
		ensure => present
	}

	package { 'rsync':
		ensure => present
	}

	package { ['sysstat', 'dstat']:
		ensure => present
	}

	package { ['rar', 'zip']: 
		ensure => present
	} 
		
}
