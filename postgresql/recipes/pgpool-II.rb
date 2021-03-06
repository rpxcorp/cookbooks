
#
# pgpool-II
#

VERSION='3.0.1'

require_recipe "postgresql::client"

package "openssl"

remote_file "/root/pgpool-II.tar.gz" do
  source "http://pgfoundry.org/frs/download.php/2841/pgpool-II-3.0.1.tar.gz"
  mode "0600"
end

bash "install_pgpool-II" do
  user "root"
  cwd "/root"
  code <<-EOH
  tar xzf pgpool-II.tar.gz
  cd pgpool-II-3.0.1
  ./configure --with-openssl --prefix=/usr
  make
  make install
  EOH
end

template "/etc/pgpool.conf" do
  source "pgpool2.conf.erb"
  owner "root"
  group "root"
  mode "644"
end

template "/etc/init/pgpool.conf" do
  source "pgpool.upstart.erb"
  owner "root"
  group "root"
  mode "755"
end

directory "/var/run/pgpool" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

directory "/var/log/postgresql" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

service "pgpool" do
  provider Chef::Provider::Service::Upstart
  action :start
end
