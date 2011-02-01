
#
# Sync DB data from master to slave
#

script "sync_master_to_slave" do
  interpreter "bash"
  user "postgres"
  code <<-EOH
    ssh db02 '/etc/init.d/postgresql stop'
    psql -c "SELECT pg_start_backup('IFYM');"
    rsync -a /var/lib/postgresql/#{node.postgresql.version}/main/ db02:/var/lib/postgresql/#{node.postgresql.version}/main/
    psql -c 'SELECT pg_stop_backup();'
    ssh db02 '/etc/init.d/postgresql start'
  EOH
end
