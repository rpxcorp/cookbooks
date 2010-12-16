require_recipe "resque::default"

template "/etc/init/resque-worker.conf" do
  source "upstart_worker.erb"
  owner "root"
  group "root"
  mode "0644"
end

service "resque-worker" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end
