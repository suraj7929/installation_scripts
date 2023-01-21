#!/bin/bash

# Update the package list
sudo apt-get update

# Install the Puppet agent
sudo apt-get install -y puppet-agent

# Configure the Puppet agent
sudo echo -e "[agent]\nserver = ${1}\nport = ${2}\ncertname = ${3}" > /etc/puppetlabs/puppet/puppet.conf

# Start the Puppet agent
sudo systemctl start puppet
