remote_file "/tmp/ghost.zip" do
    source "https://ghost.org/zip/ghost-#{node['ghostblog']['version']}.zip"
    not_if { ::File.exist?("/tmp/ghost.zip") }
end

execute 'unzip' do
    user 'root'
    command "unzip /tmp/ghost.zip -d #{node['ghostblog']['install_dir']}"
end

nodejs_npm 'package.json' do
    user 'root'
    json true
    path node['ghostblog']['install_dir']
    options ['--production']
end

template '/etc/init.d/ghost' do
    source 'ghost.init.erb'
    owner 'root'
    group 'root'
    mode '0755'
end

template "#{node['ghostblog']['install_dir']}/config.js" do
    source 'config.js.erb'
    owner 'root'
    group 'root'
    variables(
        :url => node['ghostblog']['app']['server_url'],
        :port => node['ghostblog']['app']['port'],
        :transport => node['ghostblog']['app']['mail_transport_method'],
        :service => node['ghostblog']['app']['mail_service'],
        :user => node['ghostblog']['app']['mail_user'],
        :passwd => node['ghostblog']['app']['mail_passwd'],
        :aws_access => node['ghostblog']['ses']['aws_access_key'],
        :aws_secret => node['ghostblog']['ses']['aws_secret_key'],
        :db_type => node['ghostblog']['app']['db_type'],
        :db_host => node['ghostblog']['mysql']['host'],
        :db_user => node['ghostblog']['mysql']['user'],
        :db_passwd => node['ghostblog']['mysql']['passwd'],
        :db_name => node['ghostblog']['mysql']['database'],
        :charset => node['ghostblog']['mysql']['charset']
    )
    notifies :start, 'service[ghost]', :immediately
end

template "/etc/nginx/sites-available/#{node['ghostblog']['nginx']['server_name']}.conf" do
   source 'ghost.conf.erb'
   owner 'root'
   group 'root'
end

 bash 'enable site config' do
   user 'root'
   cwd '/etc/nginx/sites-available/'
   code <<-EOH
   nxdissite default
   nxensite #{node['ghostblog']['nginx']['server_name']}.conf
   EOH
   notifies :restart, 'service[nginx]', :immediately
end
