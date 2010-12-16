require_recipe "resque::default"

ree_gem "json" do
  action :install
end

template "/etc/init/resque-web.conf" do
  source "upstart_web.erb"
  owner "root"
  group "root"
  mode "0644"
end

service "resque-web" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end
