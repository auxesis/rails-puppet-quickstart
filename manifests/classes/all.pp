
# used when sources.list is updated
exec { "aptitude update":
	refreshonly => true,
	alias => apt-update
}
