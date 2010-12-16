
ree_gem "warden" do
  version "> 0.10.3"
  action :remove
  ignore_failure
end

execute "cleanup apt repo" do
  command "apt-get -y autoremove"
  ignore_failure
end
