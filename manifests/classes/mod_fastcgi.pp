class mod_fastcgi {

	package { "libapache2-mod-fastcgi":
		ensure => present,
		notify => Service[apache2]
	}

	package { ["php5-mhash", "php5-sasl"]: 
		ensure => present
	}

	package { ["php5-mysql", "php5-ldap", "php5-pgsql"]:
		ensure => present
	}

}
