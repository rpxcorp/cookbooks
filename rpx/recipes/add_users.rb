
#
# Copyright 2010, RPX
#
# All rights reserved - Do Not Redistribute
#

users = {
  "postgres" => "5000",
  "redis" => "5001",
  "rpx" => "5002",
}

users.each do | u,i |

  next if File.open("/etc/passwd").readlines().grep(/^#{u}/).size() > 0
  Chef::Log.info("Creating user: #{u} with UID: #{i}")

  execute "create group #{u}" do
    command "groupadd -g #{i} #{u}"
  end

  execute "create group #{u}" do
    command "useradd -u #{i} -c '#{u} user' -s '/bin/false' -d '/home' -g #{u} #{u}"
  end

end
