#
# Cookbook Name:: mosh
# Recipe:: default
#
# Copyright (C) 2014 Jonathan Werrett
#


default['mosh']['version'] = '1.2.4'

default['mosh']['url'] = "http://mosh.mit.edu/mosh-#{node['mosh']['version']}.tar.gz"

default['mosh']['configure_options'] = ''
default['mosh']['make_options']      = ''
default['mosh']['install_options']   = ''

default['mosh']['binary'] = '/usr/local/bin/mosh'
