
#
# Add postgres pgagent
#

require_recipe "postgresql::server"

package "pgagent"

service "postgresql" do
  service_name "postgresql-#{node.postgresql.version}"
  action :restart
end
