
#
# Stop, start postgres daemons
#

service "postgresql-#{node.postgresql.version}" do
  provider Chef::Provider::Service::Init::Debian
  action :stop
end

service "postgresql-#{node.postgresql.version}" do
  provider Chef::Provider::Service::Init::Debian
  action :start
end
