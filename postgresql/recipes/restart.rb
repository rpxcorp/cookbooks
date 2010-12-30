
#
# Stop, start postgres daemons
#

service "postgresql-#{node.postgresql.version}" do
  provider Chef::Provider::Service::Upstart
  action :stop
end

service "postgresql-#{node.postgresql.version}" do
  provider Chef::Provider::Service::Upstart
  action :start
end
