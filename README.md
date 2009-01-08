
Installing and running Puppet against a single machine
======================================================

This repo is a really simple collection of Puppet manifests to set up an
Ubuntu Hardy machine with the necessary dependencies to run Rails. 

It uses mod_passenger with apache2 to serve Rails, Postfix for mail serving, 
and collectd for performance monitoring. 

It's intended that Puppet is run against these manifests locally, negating
the need for a Puppetmaster setup. That said, the manifests should work in a 
Puppet/Puppetmaster setup with little alteration. 


Installing Puppet on machine to manage
--------------------------------------

sudo aptitude install puppet git-core
git clone git://github.com/auxesis/rails-puppet-quickstart.git  

Describing your machine
-----------------------

You'll need to know the fqdn of the machine you're managing. The easiest way 
to get this is by running:

    $ facter |grep ^fqdn

(facter collects facts about a system for use by Puppet)

Next you'll need to specify the FQDN of the machine in 
manifests/nodes/railsnode.pp. Substitute the FQDN into the node section. 

You might want to rename the railsnode.pp file to the hostname of the machine,
but it's personal preference. 

Lastly, Rename the config/nodes/railsnode directory to the FQDN of the machine.

Running Puppet
--------------

Because we're not using Puppet in an end-to-end provisioning setup, we have to 
do a small amount of lifting to get it going: 

    sudo puppet --debug --verbose rails-puppet-quickstart/puppet/manifests/site.pp --tags ruby
    sudo puppet --debug --verbose rails-puppet-quickstart/puppet/manifests/site.pp

(path to site.pp is relative to your current working directory)

We run with '--tags ruby' the first time so that /etc/apt/source.list can be 
modified, and apt can be updated. 

Everything should be hunky-doory after that, so we run without any '--tags' option. 

If you make any changes, just run the second command again: 
    
		sudo puppet --debug --verbose rails-puppet-quickstart/puppet/manifests/site.pp

