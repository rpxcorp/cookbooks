maintainer       "RPX Corp"
maintainer_email "cookbooks@rpxcorp.com"
license          "All rights reserved"
description      "Custom Checf scripts for RPX"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

recipe "rpx::default", "Perform all RPX recipes"
recipe "rpx::create_dirs", "Create RPX dirs"
recipe "rpx::add_users", "Add RPX users"
recipe "rpx::mount_ebs", "Mount RPX EBS Volumes"
recipe "rpx::install_gems", "Install RPX gems"
recipe "rpx::add_cron", "Add RPX crons"
recipe "rpx::start_solr", "Start solr."
recipe "rpx::cleanup", "Cleanup any final things."

attribute "rpx/aws_access_key",
  :display_name => "AWS_ACCESS_KEY",
  :description => "Pulldown cred then select AWS_ACCESS_KEY_ID.",
  :required => true,
  :type => "string",
  :recipes => [ "rpx::mount_ebs", "rpx::default" ]

attribute "rpx/aws_secret_access_key",
  :display_name => "AWS_SECRET_ACCESS_KEY",
  :description => "Pulldown cred then select AWS_SECRET_ACCESS_KEY.",
  :required => true,
  :type => "string",
  :recipes => [ "rpx::mount_ebs", "rpx::default" ]

attribute "rpx/ebs_volume_app",
  :display_name => "EBS_VOLUME_APP",
  :description => "EBS volume for the app.",
  :type => "string",
  :required => true,
  :recipes => [ "rpx::mount_ebs", "rpx::default" ]

attribute "rpx/ebs_volume_postgres",
  :display_name => "EBS_VOLUME_POSTGRES",
  :description => "EBS volume for postgres.",
  :type => "string",
  :required => true,
  :recipes => [ "rpx::mount_ebs", "rpx::default" ]
