
#
# Add postgres pgagent
#

require_recipe "postgresql::server"

package "pgagent"

service "postgresql" do
  service_name VERSION == '9.0' ? 'postgresql' : "postgresql-#{VERSION}"
  action :restart
end
