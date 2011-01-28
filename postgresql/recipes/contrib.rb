
#
# Add postgres contrib package
# See: http://www.postgresql.org/docs/current/static/contrib.html
#

require_recipe "postgresql::server"

package "postgresql-contrib-#{node.postgresql.version}"

contrib_pkg = [
  'adminpack',
  #'fuzzystrmatch',
  #'dblink',
  #'pgcrypto',
  'hstore',
  #'intarray', # missing?
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
