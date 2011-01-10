
#
# Add pgpool to client
#

require_recipe "postgresql::client"

package "pgpool"

template "/etc/pgpool.conf" do
  source "pgpool.conf.erb"
end

service "pgpool" do
  provider Chef::Provider::Service::Init::Debian
  action :restart
end
