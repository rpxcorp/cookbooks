
#
# Stop, start postgres daemons
#

service "postgresql" do
  service_name VERSION == '9.0' ? 'postgresql' : "postgresql-#{node.postgresql.version}"
  action :restart
end
