
#
# Install, configure nginx
#

require_recipe "ruby_enterprise"
require_recipe "passenger_enterprise"

execute "build nginx from source" do
  command "/opt/ruby-enterprise/bin/passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx"
end

template "/opt/nginx/conf/nginx.conf" do
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

template "/etc/init/nginx.conf" do
  source "nginx.upstart.erb"
  owner "root"
  group "root"
  mode "0755"
end

service "nginx" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end
