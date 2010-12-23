
#
# Install Hudson vi apt package
#

require_recipe "java"

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

package "daemon"
package "hudson"

service "hudson" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

plugins = [
  "chucknorris.hpi", "git.hpi", "rake.hpi", "rubymetricfu.hpi", "sounds.hpi", "xunit.hpi",
  "cvs.hpi", "jsunit.hpi", "ruby.hpi", "selenium-aes.hpi", "ssh-slaves.hpi",
  "ec2.hpi", "maven-plugin.hpi", "rubyMetrics.hpi", "sloccount.hpi", "subversion.hpi",
]
