
#
# Puts config files in place for Portal after server install
#

require_recipe "postgresql::server"

service "postgresql" do
  service_name "postgresql-#{node.postgresql.version}"
  action :stop
end

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
  service_name "postgresql-#{node.postgresql.version}"
  action :start
end

execute "createuser" do
  user "postgres"
  command 'su - postgres -c "createuser --no-superuser --no-createdb --no-createrole portal_prod"'
  ignore_failure true
end

execute "createdb" do
  user "postgres"
  command 'su - postgres -c "createdb --encoding=UTF8 --owner=portal_prod portal_prod"'
  ignore_failure true
end
