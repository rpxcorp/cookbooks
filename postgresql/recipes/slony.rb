
#
# Install Slony replication
#

pkg = [
  "postgresql-#{node.postgresql.version}-slony1",
  "slony1-bin",
]

pkg.each do |i|
  package i
end

service "postgresql-#{node.postgresql.version}" do
  provider Chef::Provider::Service::Init::Debian
  action :restart
end
