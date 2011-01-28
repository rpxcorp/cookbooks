
#
# Configure server as slave
#

require_recipe "postgresql::server"

template "/var/lib/postgresql/#{node.postgresql.version}/main/recovery.conf" do
  source "recovery.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0644
end

service "postgresql" do
  service_name "#{node.postgresql.version}" == '9.0' ? 'postgresql' : "postgresql-#{node.postgresql.version}"
  action :restart
end
