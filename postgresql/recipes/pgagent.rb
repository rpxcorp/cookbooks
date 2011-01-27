
#
# Add postgres pgagent
#

require_recipe "postgresql::server" do
  not_if "test -d /var/lib/postgresql/#{node.postgresql.version}/main/"
end

package "pgagent"

service "postgresql" do
  service_name "#{node.postgresql.version}" == '9.0' ? 'postgresql' : "postgresql-#{node.postgresql.version}"
  action :restart
end
