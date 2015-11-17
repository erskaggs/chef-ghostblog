
# Ghost server settings
default['ghost-blog']['install_dir'] = '/var/www/html/ghost'
default['ghost-blog']['version'] = 'latest'
default['ghost-blog']['app']['server_url'] = 'localhost'
default['ghost-blog']['app']['port'] = '2368'
default['ghost-blog']['app']['mail_transport_method'] = 'SMTP'
default['ghost-blog']['app']['mail_service'] = nil
default['ghost-blog']['app']['mail_user'] = nil
default['ghost-blog']['app']['mail_passwd'] = nil
default['ghost-blog']['app']['db_type'] = 'sqlite3'

# Ghost MySQL settings
default['ghost-blog']['mysql']['host'] = '127.0.0.1'
default['ghost-blog']['mysql']['user'] = 'glog'
default['ghost-blog']['mysql']['passwd'] = 'ChangePasswordQuick!'
default['ghost-blog']['mysql']['database'] = 'glog'
default['ghost-blog']['mysql']['charset'] = 'utf8'
