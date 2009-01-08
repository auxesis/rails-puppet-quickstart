Rails Puppet Quickstarter
=========================

This is a really simple collection of Puppet **manifests to set up a single
Ubuntu Hardy machine** with the necessary dependencies to run Rails. 

It uses mod\_passenger with apache2 to serve Rails, Postfix for mailing, and
collectd for performance monitoring. 

It's intended that Puppet is run against these manifests locally, negating
the need for a Puppetmaster. That said, the manifests should work in a 
Puppet/Puppetmaster setup with minimal alteration. 

Installing Puppet on machine
----------------------------

    sudo aptitude install puppet git-core
    git clone git://github.com/auxesis/rails-puppet-quickstart.git  

Describing your machine
-----------------------

You'll need to know the fqdn of the machine you're managing. The easiest way 
to get this is by running:

    $ facter |grep ^fqdn

(facter collects facts about a system that Puppet can use)

Next you'll need to specify the FQDN of the machine in 
`manifests/nodes/railsnode.pp`. Substitute the FQDN into the node section. 

You might want to rename the `railsnode.pp` file to the hostname of the machine,
but it's personal preference. 

Lastly, Rename the `config/nodes/railsnode` directory to the FQDN of the machine.

Running Puppet
--------------

Because we're not using Puppet in an end-to-end provisioning setup, we have to 
do a small amount of lifting to get it going: 

    sudo puppet --debug --verbose rails-puppet-quickstart/puppet/manifests/site.pp --tags ruby
    sudo puppet --debug --verbose rails-puppet-quickstart/puppet/manifests/site.pp

(path to `site.pp` is relative to your current working directory)

We run with `--tags ruby` the first time so that `/etc/apt/sources.list` can be 
modified, and apt can be updated. 

Everything should be hunky-doory after that, so we run without any `--tags` option. 

If you make any changes, just run the second command again: 
    
    sudo puppet --debug --verbose rails-puppet-quickstart/puppet/manifests/site.pp


TODO
====
 * create class structure for managing multiple apache vhosts
 * include example passenger config
 * manage /etc/apt/sources.list properly
 * include fastcgi + apache + php config

COPYRIGHT + LICENCE
===================

2009, Lindsay Holmwood <lindsay@holmwood.id.au>

Distributed under the MIT Licence: http://www.opensource.org/licenses/mit-license.php
