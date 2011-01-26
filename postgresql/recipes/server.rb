#
# Cookbook Name:: postgresql
# Recipe:: server
#

include_recipe "postgresql::client"

case node[:postgresql][:version]
when "8.3"
  node.default[:postgresql][:ssl] = "off"
when "8.4"
  node.default[:postgresql][:ssl] = "true"
end

pkg = [
  "postgresql-#{node.postgresql.version}",
  "postgresql-contrib-#{node.postgresql.version}",
  "postgresql-server-dev-#{node.postgresql.version}",
]
opt = [
  "ptop",
  "pgtune",
]

pkg = pkg + opt
pkg.each do |i|
  package "#{i}" do
    action :install
  end
end


template "/etc/postgresql/#{node.postgresql.version}/main/pg_hba.conf" do
  source "pg_hba.default.conf.erb"
  owner "postgres"
  group "postgres"
  mode "0644"
end

template "/etc/postgresql/#{node.postgresql.version}/main/postgresql.conf" do
  source "postgresql.default.conf.erb"
  owner "postgres"
  group "postgres"
  mode "0644"
end

service "postgresql" do
  service_name "postgresql-#{node.postgresql.version}"
  action :restart
end

execute "dropcuster" do
 user "postgres"
 command "su - postgres -c 'pg_dropcluster --stop 9.0 main'"
end

execute "dropcuster" do
 user "postgres"
 command "su - postgres -c 'pg_createcluster --start -e UTF-8 9.0 main'"
end

execute "createlang" do
  user "postgres"
  command "su - postgres -c 'createlang plpgsql template1'"
  ignore_failure true
end
