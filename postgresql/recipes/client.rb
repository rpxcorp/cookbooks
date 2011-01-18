#
# Cookbook Name:: postgresql
# Recipe:: client
#

pkg = [
  "postgresql-client-#{node.postgresql.version}",
  "libpq-dev",
]

pkg.each do |i|
  package "#{i}" do
    action :install
  end
end
