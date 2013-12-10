package "subversion"
package "libapache2-svn"
package "apache2-mpm-prefork"

service "apache2" do
	action :enable
end

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

directory "#{node[:svnhttp][:project_path]}" do
	recursive true
	action :delete

end

directory "#{node[:svnhttp][:project_path]}" do
	owner "www-data"
	group "subversion"
	mode 00766
	action :create
end


bash "adding admin user to #{node[:svnhttp][:htpasswd_path]}" do
	code "htpasswd -b -c #{node[:svnhttp][:htpasswd_path]} admin #{node[:svnhttp][:admin_passwd]}"
end

execute "initializing repo #{node[:svnhttp][:project_path]}" do
  command ""
end

bash "create svn repo on #{node[:svnhttp][:project_path]}" do
	code <<-EOH
		svnadmin create #{node[:svnhttp][:project_path]}
		chown -R www-data:subversion #{node[:svnhttp][:project_path]}
		chmod -R g+rws #{node[:svnhttp][:project_path]}
	EOH
end


template "#{node[:svnhttp][:dav_svn_conf_path]}" do
	  source "dav_svn.conf.erb"
      mode 0644
      owner "root"
      group "root"
      notifies :restart, "service[apache2]"
end
