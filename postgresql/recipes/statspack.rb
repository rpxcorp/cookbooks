
#
# PGStatspack
#

#require_recipe "postgres::server"

remote_file "/root/pgstatspack.tar.gz" do
  source "http://pgfoundry.org/frs/download.php/2800/pgstatspack_version_2.2.tar.gz"
end

bash "install_pgstatspack" do
  code <-EOH
  tar xzf pgstatspack.tar.gz
  cd pgstatspack
  make install
  EOH
end

# add crons, etc
