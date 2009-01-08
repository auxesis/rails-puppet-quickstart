
class samba_server {

	package { ['samba', 'tdb-tools']:
		ensure => present
	}

        file { "/etc/samba/smb.conf":
                source => "file:///home/amajuba/puppet/config/classes/samba_server/smb.conf",
                mode => 644, 
                owner => root,
                group => root 
        }

        service { samba:
                ensure => running,
       		subscribe => File["/etc/samba/smb.conf"]
	}

	exec { "update-rc.d samba defaults":
		path => "/sbin/:/usr/sbin:/bin:/usr/bin",
		onlyif => "test $(find /etc/rc*.d |grep samba |wc -l) != '7'"
	}

}
