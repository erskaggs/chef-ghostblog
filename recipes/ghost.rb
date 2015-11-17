remote_file "/tmp/ghost.zip" do
    source "https://ghost.org/zip/ghost-#{node['ghost-blog']['version']}.zip"
    not_if { ::File.exist?("/tmp/ghost.zip") }
end

execute 'unzip' do
    user 'root'
    command "unzip /tmp/ghost.zip -d #{node['ghost-blog']['install_dir']}"
end

nodejs_npm 'package.json' do
    user 'root'
    json true
    path node['ghost-blog']['install_dir']
    options ['--production']
end

template '/etc/init.d/ghost' do
    source 'ghost.init.erb'
    owner 'root'
    group 'root'
    mode '0755'
end

template "#{node['ghost-blog']['install_dir']}/config.js" do
    source 'config.js.erb'
    owner 'root'
    group 'root'
    variables(
        :url => node['ghost-blog']['app']['server_url'],
        :port => node['ghost-blog']['app']['port'],
        :transport => node['ghost-blog']['app']['mail_transport_method'],
        :service => node['ghost-blog']['app']['mail_service'],
        :user => node['ghost-blog']['app']['mail_user'],
        :passwd => node['ghost-blog']['app']['mail_passwd'],
        :aws_access => node['ghost-blog']['ses']['aws_access_key'],
        :aws_secret => node['ghost-blog']['ses']['aws_secret_key'],
        :db_type => node['ghost-blog']['app']['db_type'],
        :db_host => node['ghost-blog']['mysql']['host'],
        :db_user => node['ghost-blog']['mysql']['user'],
        :db_passwd => node['ghost-blog']['mysql']['passwd'],
        :db_name => node['ghost-blog']['mysql']['database'],
        :charset => node['ghost-blog']['mysql']['charset']
    )
    notifies :start, 'service[ghost]', :immediately
end

template "/etc/nginx/sites-available/#{node['ghost-blog']['nginx']['server_name']}.conf" do
   source 'ghost.conf.erb'
   owner 'root'
   group 'root'
end

 bash 'enable site config' do
   user 'root'
   cwd '/etc/nginx/sites-available/'
   code <<-EOH
   nxdissite default
   nxensite #{node['ghost-blog']['nginx']['server_name']}.conf
   EOH
   notifies :restart, 'service[nginx]', :immediately
end
