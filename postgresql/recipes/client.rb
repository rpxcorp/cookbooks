#
# Cookbook Name:: postgresql
# Recipe:: client
#

pkg = [
  "postgresql-client-8.4",
]

pkg.each do |i|
  package "#{i}" do
    action :install
  end
end
