
class apache2 {

	# use worker over prefork so passenger
	package { 'apache2-mpm-worker':
		ensure => present
	}

	file { "/etc/apache2/apache2.conf":
		content => template("/home/amajuba/puppet/config/classes/apache2/apache2.conf.erb"),
		mode => 644, 
		owner => root,
		group => root 
	}

	service { apache2:
		ensure => running,
		subscribe => File["/etc/apache2/apache2.conf"]
	}

	exec { "update-rc.d apache2 defaults":
		path => "/sbin/:/usr/sbin:/bin:/usr/bin",
		onlyif => "test $(find /etc/rc*.d |grep apache2 |wc -l) != '7'"
	}

}
