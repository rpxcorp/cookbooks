
#
# Add postgres contrib package
#

require_recipe "postgresql::server"

package "postgresql-contrib-#{node.postgresql.version}"

# Install inividual packages here
contrib_pkg = [
  'adminpack',
  'cube',
  'earthdistance',
  'pgcrypto',
]

contrib_pkg.each do |i|
  execute "install #{i}" do
    user "postgres"
    command "su - postgres -c 'psql -d template1 < /usr/share/postgresql/#{node.postgresql.version}/contrib/#{i}.sql'"
  end
end

service "postgresql" do
  service_name "#{node.postgresql.version}" == '9.0' ? 'postgresql' : "postgresql-#{node.postgresql.version}"
  action :restart
end
