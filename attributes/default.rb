default[:svnhttp][:admin_passwd] = "admin"
default[:svnhttp][:project_path] = '/home/svn/myproject'
default[:svnhttp][:htpasswd_path] = '/etc/subversion/passwd'
default[:svnhttp][:http_location] = '/svn/myproject'
default[:svnhttp][:dav_svn_conf_path] = '/etc/apache2/mods-available/dav_svn.conf'
default[:svnhttp][:allow_anonymous] = false