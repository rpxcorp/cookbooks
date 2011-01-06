
#
# Add pgpool to client
#

package "pgpool"

template "/etc/pgpool.conf" do
  source "pgpool.conf.erb"
end

service "pgpool" do
  provider Chef::Provider::Service::Init::Debian
  action :restart
end
