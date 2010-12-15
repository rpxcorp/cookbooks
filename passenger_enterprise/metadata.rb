maintainer       "Opscode, Inc."
maintainer_email "ops@opscode.com"
license          "Apache 2.0"
description      "Installs and configures Passenger under Ruby Enterprise Edition"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.4.2"

recipe "passenger::default", "Installs Passenger gem with Ruby Enterprise Edition"

%w{ ruby_enterprise }.each do |cb|
  depends cb
end

supports "ubuntu"
