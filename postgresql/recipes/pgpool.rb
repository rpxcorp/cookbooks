
#
# Add pgpool to client
#

package "pgpool"

service "postgresql-#{node.postgresql.version}" do
  provider Chef::Provider::Service::Init::Debian
  action :restart
end
