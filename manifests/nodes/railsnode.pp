
# fill in the fqdn here!
node 'railsnode' {

	include base_utils
	include collectd
	
	include postfix

	include apache2
	#include mod_php5
	include mod_fastcgi
	include passenger

	include ruby 

	include git

}
