
#
# Copyright 2010, RPX
#
# All rights reserved - Do Not Redistribute
#

dirs = [
  "/opt/rpx",
  "/opt/postgres",
  "/opt/redis",
]

dirs.each do |d|
  next if File.directory?(d)
  directory d do
    action :create
    recursive true
  end
end
