
#
# Copyright 2010, RPX
#
# All rights reserved - Do Not Redistribute
#

# for ree_gem
include_recipe "ruby_enterprise::default"

# Installing debian packages necassary for gems...")
pkg = [
  "libexpat1-dev", # for xmlparser
  "postgresql-client-8.4", # for pg
  "postgresql-server-dev-8.4", # for pg
  "libsqlite0", # for rails -> sqlite
  "libsqlite3-dev", # for rails -> sqlite
  "g++",
  "g++-4.4",
  "libstdc++6-4.4-dev",
  "libxml2", # paperclip -> nokogiri
  "libxml2-dev",
  "libxslt1.1",
  "libxslt1-dev",
]
pkg.each do |i|
  Chef::Log.info("Installing debian package #{i}.")
  package "#{i}" do
    action :install
  end
end

# Add extra gem sources (for thoughtbot gems)
execute "Add github gem source" do
  command "#{node[:ruby_enterprise][:install_path]}/bin/gem sources --add http://gems.github.com"
  not_if "#{node[:ruby_enterprise][:install_path]}/bin/gem sources --list | grep http://gems.github.com"
end

# Install rake
ree_gem "rake" do
  version "0.8.7"
end

gems = {
  "actionpack" => "2.3.8",
  "activemerchant" => "1.4.2",
  "activerecord" => "2.3.8",
  "activeresource" => "2.3.8",
  "activesupport" => "2.3.8",
  "amazon-ec2" => "0.3.8",
  "amazon-fps-ruby" => "1.0.0",
  "amazon_sdb" => "0.6.7",
  "awesome_print" => "0.2.1",
  "aws-s3" => "0.6.2",
  "BlueCloth" => "1.0.1",
  "builder" => "2.1.2",
  "capistrano" => "2.5.5",
  "crack" => "0.1.7",
  "daemons" => "1.0.10",
  "devise" => "1.0.7",
  "escape" => "0.0.4",
  "eventmachine" => "0.12.6",
  "excelsior" => "0.0.9",
  "facets" => "2.8.4",
  "faker" => "0.3.1",
  "fastercsv" => "1.5.3",
  "fastthread" => "1.0.7",
  "haml" => "2.2.23",
  "highline" => "1.5.0",
  "hoe" => "2.6.0",
  "hpricot" => "0.8.1",
  "httparty" => "0.4.3",
  "httpclient" => "2.1.5.2",
  "image_science" => "1.1.3",
#  "johnreilly-activerecord-activesalesforce-adapter" => "2.3.5",
  "json" => "1.4.2",
  "json_pure" => "1.4.2",
  "libxml-ruby" => "1.1.3",
  "memcache-client" => "1.7.2",
  "mime-types" => "1.16",
  "mkrf" => "0.2.3",
  "mocha" => "0.9.5",
#  "mysql" => "2.7",
  "net-scp" => "1.0.2",
  "net-sftp" => "2.0.2",
  "net-ssh" => "2.0.11",
  "net-ssh-gateway" => "1.0.1",
  "newrelic_rpm" => "2.12.0",
  "nokogiri" => "1.4.1",
  "paginator" => "1.1.1",
  "ParseUserAgent" => "0.1.0",
  "passenger" => "2.2.11",
  "pg" => "0.9.0",
  "populator" => "0.2.5",
  "postgres" => "0.7.9.2008.01.28",
  "rack" => "1.1.0",
  "rails" => "2.3.8",
  "redis" => "1.0.6",
  "redis-namespace" => "0.4.4",
  "resque" => "1.8.5",
  "right_aws" => "1.10.0",
  "right_http_connection" => "1.2.4",
#  "rmagick" => "2.9.1",
  "rpm_contrib" => "1.0.9",
  "rsolr" => "0.12.1",
  "rspec" => "1.2.6",
  "ruby-ole" => "1.2.10.1",
  "ruby-openid" => "2.1.6",
  "rubyforge" => "2.0.4",
  "rubygems-update" => "1.3.6",
  "RubyInline" => "3.8.1",
#  "shoulda" => "1.2.0",
  "sinatra" => "1.0",
  "soap4r" => "1.5.8",
  "spreadsheet" => "0.6.4.1",
  "sqlite3-ruby" => "1.2.4",
  "sunspot" => "1.1.0",
  "sunspot_rails" => "1.1.0",
  "thin" => "1.0.0",
  "paperclip" => "2.2.8",
  "vegas" => "0.1.6",
  "warden" => "0.10.3",
  "will_paginate" => "2.3.12",
  "wss4r" => "0.5",
  "xml-simple" => "1.0.12",
  "xmlparser" => "0.6.81",
  "ZenTest" => "4.0.0",
  "mechanize" => "1.0.0",
  "thoughtbot-shoulda" => "2.10.2",
  "thoughtbot-factory_girl" => "1.2.2",
}

gems.sort.each do | g,v |
  Chef::Log.info("Installing gem #{g}-#{v}...")
  ree_gem "#{g}" do
    version "#{v}"
  end
end

ree_gem "warden" do
  version "0.10.7"
  action :uninstall
  ignore_failure
end
