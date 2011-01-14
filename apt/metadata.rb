maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Configures apt and apt services"
version           "0.9.1"
recipe            "apt::default", "Runs apt-get update during compile phase and sets up preseed directories"
recipe            "apt::cacher", "Set up an APT cache"
recipe            "apt::proxy", "Set up an APT proxy"
recipe            "apt::update", "Update all out of date apt packages"
recipe            "apt::autoremove", "Remove any unused apt packages"

%w{ ubuntu debian }.each do |os|
  supports os
end
