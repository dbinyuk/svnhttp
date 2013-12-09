Vagrant.configure("2") do |config|   config.vm.box = "svncookbooktest"
config.vm.network :forwarded_port, guest: 80, host: 8080   config.vm.provision
:chef_solo do |chef|     chef.cookbooks_path = "~/chef-repo/cookbooks"
chef.add_recipe "apt"     chef.add_recipe "svnhttp"     chef.json = { :svnhttp
=> { :allow_anonymous => true } }   end end


