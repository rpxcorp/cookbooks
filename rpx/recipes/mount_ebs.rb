
#
# Copyright 2010, RPX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "aws"


aws_ebs_volume "ebs_volume_app" do
  aws_access_key @node[:rpx][:aws_access_key]
  aws_secret_access_key @node[:rpx][:aws_secret_access_key]
  volume_id  @node[:rpx][:ebs_volume_app]
  device "/dev/sdf"
  action [ :attach ]
end

ruby_block do
  block do
    sleep 10
    Chef::Log.info('Mounting RPX App Volume.')
  end
end

mount "/opt/rpx" do
  device "/dev/sdf"
  fstype "ext3"
  options "defaults,noatime,nodev,nosuid"
end

execute "chown_rpx" do
  command "chown -R rpx:rpx rpx"
  cwd "opt"
end


aws_ebs_volume "ebs_volume_postgres" do
  aws_access_key @node[:rpx][:aws_access_key]
  aws_secret_access_key @node[:rpx][:aws_secret_access_key]
  volume_id  @node[:rpx][:ebs_volume_postgres]
  device "/dev/sdp"
  action [ :attach ]
end

ruby_block do
  block do
    Chef::Log.info('Mounting Postgres Volume.')
    sleep 10
  end
end

mount "/opt/postgres" do
  device "/dev/sdp"
  fstype "ext3"
  options "defaults,noatime,nodev,nosuid"
end

execute "chown_postgres" do
  command "chown -R postgres:postgres postgres"
  cwd "opt"
end
