
package "redis-server" do
  version node[:redis][:version]
end

# Ensure data dir exists
directory "/opt/rpx/redis" do
  owner "redis"
  group "redis"
  mode "755"
  recursive true
  action :create
end

service "redis-server" do
  action :enable
end

template "/etc/redis/redis.conf" do
  notifies :restart, resources(:service => "redis-server")
  mode "644"
end

service "redis-server" do
  action :start
end