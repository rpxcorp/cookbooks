
#
# Install Hudson from source
#

require_recipe "java"

remote_file "/tmp/hudson.war" do
  source "http://hudson-ci.org/latest/hudson.war"
  mode "0644"
end

