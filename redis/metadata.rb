maintainer        "37signals"
maintainer_email  "sysadmins@37signals.com"
description       "Configures redis"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version           "0.1"

%w{rhel centos fedora ubuntu debian suse}.each do |os|
  supports os
end

recipe            "redis::default", "Configure redis server"

