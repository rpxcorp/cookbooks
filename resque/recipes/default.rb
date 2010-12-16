require_recipe "ruby_enterprise"
require_recipe "redis"

ree_gem "resque" do
  version node[:resque][:version]
end
