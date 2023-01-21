#!/bin/bash

puppet_master_ip=$1
puppet_master_port=$2
puppet_master_certname=$3

# Install package manager
yum update -y
yum install -y wget

# Add Puppetlabs package repository
rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm

# Install Puppet agent
yum install -y puppet-agent

# Configure Puppet agent
echo "[agent]
server = ${puppet_master_ip}
port = ${puppet_master_port}
certname = ${puppet_master_certname}" > /etc/puppetlabs/puppet/puppet.conf

# Start and enable Puppet agent
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
