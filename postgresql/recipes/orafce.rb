
#
# Install oracle compat package
# See: http://pgfoundry.org/projects/orafce/
#

require_recipe "postgresql::server"

package "ora2pg"

remote_file "/root/orafce.tar.gz" do
  source "http://pgfoundry.org/frs/download.php/2908/orafce-3.0.3.tar.gz"
  mode "0600"
end

bash "make_orafce" do
  cwd "/root"
  code <<-EOH
    tar xzf orafce.tar.gz
    cd orafce*
    make USE_PGXS=1
    make USE_PGXS=1 install
  EOH
end

execute "install_orafce" do
  cwd "/root/orafce*"
  user postgres
  comand "su - postgres -c 'psql -U postgres -d template1 < orafunc.sql'"
end

execute "cleanup_orafce" do
  cwd "/root"
  command "rm -rf orafce*"
end
