# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = 'ubuntu/trusty64'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']

    chef.add_recipe 'apt'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'vim'
    chef.add_recipe 'postgresql'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'imagemagick'
    chef.add_recipe 'redisio'
    chef.add_recipe 'redisio::enable'

    # Install Ruby 2.2.1 and Bundler
    # Set an empty root password for MySQL to make things simple
    chef.json =
      {
        rbenv: {
          user_installs:
            [
              {
                user:   'vagrant', # Local Vagrant
                rubies: [ '2.2.1' ],
                global: '2.2.1',
                gems:
                  {
                    '2.2.1' =>
                      [
                        {
                          name: 'bundler'
                        }
                      ]
                  }
              }
            ]
        },
        postgresql:
          {
            password:
              {
                postgres: 'postgres'
              }
          },
      }
  end
end
