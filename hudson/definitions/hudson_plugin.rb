define :hudson_plugin, :plugin => '', :version => "1.0", :plugin_dir => "/var/lib/hudson/plugins" do

  directory plugin_dir do
    recursive true
    owner "hudson"
    group "hudson"
    mode 0700
    not_if "test -d #{plugin_dir}"
  end

  execute "remove previous Hudson plugin version: #{plugin_name}" do
    user "hudson"
    command "rm #{plugin_dir}/#{plugin}.hpi"
    only_if "test -f #{plugin_dir}/#{plugin}.hpi"
  end

  remote_file "#{plugin_dir}/#{plugin}.hpi" do
    owner "hudson"
    source "http://hudson-ci.org/download/plugins/#{plugin}/#{version}/#{plugin}.hpi"
  end

end
