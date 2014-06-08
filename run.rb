require 'chef'
require 'chef-api'
require 'thread/channel'
require_relative 'lib/chef_api_query.rb'

# ChefAPI.configure do |config|
#   config.endpoint = 'http://10.75.10.118:4000'
#   config.client = 'hwd1-tchain02.swlab.rmscloud.net'
#   config.key    = 'client.pem'
# end

credentials = {
  chef_server_url: 'http://10.75.10.118:4000', 
  client_name: 'hwd1-tchain02.swlab.rmscloud.net', 
  signing_key_filename: "client.pem"
}

connection = Chef::REST.new(*credentials.values)
chef_server = ChefApiQuery::Server.new(connection)
p Time.now
p chef_server.role_list# { |node| node == "mgbcfg2ced02c8.swlab.rmscloud.net" }
p Time.now



# chef_server.nodes