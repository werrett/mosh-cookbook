# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Machine setup
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, type: :dhcp

  # Provision using Berkshelf
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
        "recipe[apt]",
        "recipe[mosh]"
    ]
  end
end
