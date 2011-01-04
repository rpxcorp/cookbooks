
#
# Install Relational Junction
#

require_recipe "java::default"
require_recipe "tomcat::default"

cookbook_file "/home/rpx/rj/rj.jar" do
  source  "rj.jar"
  mode "0644"
end

