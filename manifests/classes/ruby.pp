
class ruby {

	package { ['ruby', 'ri', 'rdoc', 'rubygems']: 
		ensure => present,
		tag => ruby
	}

	# brightbox ubuntu ppa with backported ruby updates (including passenger + rubygems)
	append_if_no_such_line { ubuntu_ruby_backports:
		file => "/etc/apt/sources.list",
		line => "deb http://ppa.launchpad.net/ubuntu-ruby-backports/ubuntu hardy main",
		notify => Exec[apt-update],
		tag => ruby
	}

}
