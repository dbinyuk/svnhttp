package "subversion"
package "libapache2-svn"
package "apache2-mpm-prefork"

group "subversion" do
	action :create
end

user "www-data" do
	action :create
end

group "subversion" do
  action :modify
  members "www-data"
  append true
end

directory "/home/svn/myproject" do
	owner "root"
	group "root"
	mode 00766
	action :create
end


#htpasswd "/etc/subversion/passwd" do
#	user "admin"
#	password "admin"
#end



#template "DIR" do
#	variables({
#    :DIR => "myproject"
#  })
#end

bash "adding admin user to #{node[:svnhttp][:htpasswd_path]}" do
	code "htpasswd -b -c #{node[:svnhttp][:htpasswd_path]} admin #{node[:svnhttp][:admin_passwd]}"
end


#execute "running shell command" do
#  command "touch /tmp/chefhere"
#  action :run
#end


# cacher.default.name = node['apt']['cacher_ipaddress']