require 'thread/pool'

module ChefApiQuery
  module Conversations

    def Node(arg)
      case arg
      when ChefApiQuery::Node then puts 0; arg
      when Chef::Node         then puts 1; ChefApiQuery::Node.new(arg)
      when String             then send __method__, @connection.get_rest("nodes/#{arg}")
      when Symbol             then puts 3; send __method__, arg.to_s
      when Hash               then puts 4; send __method__, arg.keys
      when Array
        pool = Thread.pool(40)
        array = []
        arg.each do |node_name|
          pool.process do
            array << @connection.get_rest("nodes/#{node_name}")
          end
        end
        pool.shutdown
        array
      else raise TypeError, "can't convert #{arg} into Node"
      end
    end

  end
end