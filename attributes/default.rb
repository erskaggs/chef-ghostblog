
# Ghost server settings
default['ghostblog']['install_dir'] = '/var/www/html/ghost'
default['ghostblog']['version'] = 'latest'
default['ghostblog']['app']['server_url'] = 'localhost'
default['ghostblog']['app']['port'] = '2368'
default['ghostblog']['app']['mail_transport_method'] = 'SMTP'
default['ghostblog']['app']['mail_service'] = nil
default['ghostblog']['app']['mail_user'] = nil
default['ghostblog']['app']['mail_passwd'] = nil
default['ghostblog']['app']['db_type'] = 'sqlite3'
default['ghostblog']['app']['sites_en'] = '/etc/nginx/sites-available'
default['ghostblog']['app']['sever_name'] = 'ghostblog.com'

# Ghost MySQL settings
default['ghostblog']['mysql']['host'] = '127.0.0.1'
default['ghostblog']['mysql']['user'] = 'glog'
default['ghostblog']['mysql']['passwd'] = 'ChangePasswordQuick!'
default['ghostblog']['mysql']['database'] = 'glog'
default['ghostblog']['mysql']['charset'] = 'utf8'
