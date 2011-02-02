
#
# Install Slony replication
#

#require_recipe "postgresql::server"

pkg = [
  "postgresql-#{node.postgresql.version}-slony1",
  "slony1-bin",
]

pkg.each do |i|
  package i
end

template "/etc/slony1/slon_tools.conf" do
  source "slon_tools.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

service "postgresql-#{node.postgresql.version}" do
  provider Chef::Provider::Service::Init::Debian
  action :restart
end

service "slony1" do
  provider Chef::Provider::Service::Init::Debian
  action :restart
end
