#
# Remove unused apt packages
#

execute "apt-get autoremove" do
  command "apt-get -y autoremove"
  user "root"
  action :run
end
