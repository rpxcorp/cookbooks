
#
# Install oracle compat package
# See: http://pgfoundry.org/projects/orafce/
#

require_recipe "postgresql::server"

remote_file "/tmp/orafce.tar.gz" do
  source "http://pgfoundry.org/frs/download.php/2908/orafce-3.0.3.tar.gz"
  mode "0600"
end

bash "make_orafce" do
  cwd "/tmp"
  code <<-EOH
    tar xzf orafce.tar.gz
    cd orafce
    make USE_PGXS=1 install
    make USE_PGXS=1
  EOH
end

execute "install_orafce" do
  user postgres
  cwd "/tmp/orafce"
  comand "psql -U postgres postgres < orafunc.sql"
end

execute "cleanup_orafce" do
  cwd "/tmp"
  coommand "rm -r orafce.tar.gz orafce"
end
