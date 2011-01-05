
#
# Quick install of a radiant site for dev purpose
#

pkg = [
  "ruby-dev", "libopenssl-ruby", "rubygems", "libsqlite3-dev",
]
pkg.each do |i|
  package i
end

gems = [ 
  "rails", "radiant",
]
gems.each do |i|
  gem i
end

user "rpx" do
  action :create
end

execute "create demo radiant site" do
  cwd "/home/rpx"
  user rpx
  command "radiant myapp"
end

