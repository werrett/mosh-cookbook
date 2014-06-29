# Cookbook Name:: mosh
# Recipe:: default
#
# Copyright (C) 2014 Jonathan Werrett
#

package 'pkgconf'
package 'libncurses5-dev'
package 'libprotobuf-dev'
package 'protobuf-compiler'
package 'libutempter-dev'
package 'libssl-dev'

src_filepath  = "#{Chef::Config['file_cache_path'] || '/tmp'}/mosh-#{node['mosh']['version']}.tgz"

mosh_url = node['mosh']['url'] ||
  "http://mosh.mit.edu/mosh-#{node['mosh']['version']}.tgz"

remote_file mosh_url do
  source   mosh_url
  path     src_filepath
  backup   false
  notifies :run, "bash[install_mosh]", :immediately
end

configure_options = node['mosh']['configure_options']
make_options      = node['mosh']['make_options']
install_options   = node['mosh']['install_options']

bash "install_mosh" do
  cwd  ::File.dirname(src_filepath)
  user "root"

  code <<-EOH
    tar -zxf #{::File.basename(src_filepath)} -C #{::File.dirname(src_filepath)}

    (cd mosh-#{node['mosh']['version']}/ && \
    ./configure #{configure_options} && \
    make  #{make_options}            && \
    make install #{install_options})
  EOH

  action :nothing
  not_if "#{node['mosh']['binary']} --version 2>&1 | head -n1 | grep -q 'mosh #{node['mosh']['version']}'"
end
