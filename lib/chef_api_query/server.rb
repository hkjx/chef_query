module ChefApiQuery
  class Server
    # include ChefAPI::Resource
    include Conversations

    # def nodes
    #   ChefAPI::Resource::Node.all
    # end

    attr_reader :node_list, :role_list, :connection

    def initialize(connection)
      @connection = connection
      @node_list = @connection.get_rest('nodes').keys
      @role_list = @connection.get_rest('roles').keys
    end

    def nodes(&block)
      @nodes ||= Node node_list#.select &block
    end

    def roles(&block)
      @nodes ||= Node node_list#.select &block
    end

  end
end