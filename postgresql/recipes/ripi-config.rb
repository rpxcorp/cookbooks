
#
# Puts config files in place for RIPI after server install
#

service "postgresql" do
  service_name "postgresql-#{node.postgresql.version}"
  action :stop
end

template "#{node[:postgresql][:dir]}/pg_hba.conf" do
  source "pg_hba.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0600
  #notifies :reload, resources(:service => "postgresql")
end

template "#{node[:postgresql][:dir]}/postgresql.conf" do
  source "postgresql.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0600
  #notifies :restart, resources(:service => "postgresql")
end

service "postgresql" do
  service_name "postgresql-#{node.postgresql.version}"
  action :start
end
