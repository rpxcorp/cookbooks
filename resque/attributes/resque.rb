default.resque[:version] = "1.8.5"

# Configure the worker pools here
default.resque[:workers] = {
  # name => conf
  "load_patent" => {
      :count => 4,
      :env_vars => "RAILS_ENV=production",
      :log_path => "/opt/rpx/log/resque_workers.log",
      :working_dir => "/opt/rpx/app/current",
      :queues => "load_patent",
    },
}
