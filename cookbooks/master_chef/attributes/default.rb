config_file = ENV['MASTER_CHEF_CONFIG']

raise "Please specify config file with env var MASTER_CHEF_CONFIG" unless config_file
raise "File not found #{config_file}" unless File.exists? config_file

config = JSON.load(File.read(config_file))

node_config = config["node_config"]

if node_config
  node_config.each do |k, v|
    normal[k] = v
  end
end

default[:master_chef][:chef_solo_scripts] = {
  :user => "chef",
  :log_prefix => "/tmp/last_chef",
  :config_file => "/etc/chef/local.json",
}

default[:local_storage] = {
  :file => "/var/chef/local_storage.yml",
  :owner => "root",
}

default[:tcp_port_manager][:range] = 18000..20000
