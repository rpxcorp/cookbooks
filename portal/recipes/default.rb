
#
# setup portal app server
#

# - added /opt/ruby-enterprise/bin to /etc/environment
template "/etc/environment" do
  source "etc_environment.erb"
  owner "root"
  group "root"
  mode "0644"
end

# create rpx user
user "rpx" do
  shell "/bin/bash"
  home "/home/rpx"
  action :create
end

# set passenger user from "www-data" to "rpx" (in 2 places)

# set rails environment to "demo"
execute "set_rails_env" do
  user "rpx"
  command "echo 'export rails_env=DEMO' >> ~/.bashrc"
end

# chown /opt/rpx to user "rpx"
directory "/opt/rpx" do
  owner "rpx"
  group "rpx"
  mode "0755"
  action :create
end

# added ~/.gemrc flags
template "/home/rpx/.gemrc" do
  source "home_rpx_gemrc.erb"
  owner "rpx"
  group "rpx"
  mode "0644"
end

# added user "rpx" to the sudoers file to prevent bundle install from getting permission restrictions
template "/etc/sudoers" do
  source "etc_sudoers.erb"
  owner "root"
  group "root"
  mode "0440"
end
