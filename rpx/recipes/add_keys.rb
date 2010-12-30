
#
# Copyright 2010, RPX
#
# All rights reserved - Do Not Redistribute
#

require_recipe "rpx::add_users"

directory "/home/rpx/.ssh/" do
  owner rpx
  group rpx
  permissions "0400"
  action :create
end

file "/home/rpx/.ssh/authorized_keys" do
  owner rpx
  group rpx
  permissions "0400"
  source "authorized_keys"
end
