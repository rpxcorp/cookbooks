
#
# Refresh all out of date apt packages
#

execute "apt-get upgrade" do
  command "apt-get -y upgrade"
  user "root"
  action :run
end
