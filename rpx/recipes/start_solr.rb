
execute "start solr" do
  command "/opt/ruby-enterprise/bin/sunspot-solr start -d /opt/rpx/solr-data-dir/ -s /opt/rpx/app/releases/current/solr"
end
