
#
# Install Hudson vi apt package
#

require_recipe "java"

package "daemon"

script "install_hudson" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget -O /tmp/key http://hudson-ci.org/debian/hudson-ci.org.key
  apt-key add /tmp/key
  wget -O /tmp/hudson.deb http://hudson-ci.org/latest/debian/hudson.deb
  dpkg --install /tmp/hudson.deb
  EOH
end

package "hudson"

service "hudson" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
