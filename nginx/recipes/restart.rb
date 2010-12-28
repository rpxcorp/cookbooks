
#
# Stop, start nginx daemon
#

service "nginx" do
  provider Chef::Provider::Service::Upstart
  action :stop
end

service "nginx" do
  provider Chef::Provider::Service::Upstart
  action :start
end
