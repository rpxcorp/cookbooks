
#
# Copyright 2010, RPX
#
# All rights reserved - Do Not Redistribute
#

cron "dump_db" do
  hour "3"
  minute "0"
  user "www-data"
  command "/opt/rpx/scripts/dump_db.sh"
end
