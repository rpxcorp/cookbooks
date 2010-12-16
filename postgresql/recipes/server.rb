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
]
opt_pkg = [
  "postgresql-8.3-orafce",
  "postgresql-8.3-plruby",
  "postgresql-#{node.postgresql.version}-plproxy",
  "postgresql-#{node.postgresql.version}-postgis",
  "postgresql-#{node.postgresql.version}-slony1",
  "postgresql-autodoc",
  "postgresql-filedump-#{node.postgresql.version}",
]

pkg.each do |i|
  package "#{i}" do
    action :install
  end
end

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
