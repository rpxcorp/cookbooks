
#
# Add pgpool to client
#

require_recipe "postgresql::client"

package "pgpool2"

template "/etc/pgpool.conf" do
  source "pgpool.conf.erb"
end

directory "/var/run/postgresql" do
  owner "postgres"
  group "root"
  mode "0755"
  action :create
end

service "pgpool2" do
  provider Chef::Provider::Service::Init::Debian
  action :restart
end
