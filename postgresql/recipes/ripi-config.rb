
#
# Puts config files in place for RIPI after server install
#

require_recipe "postgresql::server"

template "#{node[:postgresql][:dir]}/pg_hba.conf" do
  source "pg_hba.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0600
end

template "#{node[:postgresql][:dir]}/postgresql.conf" do
  source "postgresql.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0600
end

service "postgresql" do
  service_name VERSION == '9.0' ? 'postgresql' : "postgresql-#{node.postgresql.version}"
  action :restart
end
