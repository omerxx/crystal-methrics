require "router"
require "../redis/redis"

# TODO: Write documentation for `Crystal::Methrics`
module Crystal::Methrics
  class WebServer
    include Router

    def draw_routes
      get "/" do |context, params|
        context.response.print "Hello WORLD"
        context
      end

      get "/redis" do |context, params|
        context.response.print test
        context
      end

      post "/key/:key_id/metric/:metric_id/value/:metric_value" do |context, params|
        context.response.print metric_store(params)
        context
      end
    end

    def run
      port = ENV["PORT"] ||= "3000"
      server = HTTP::Server.new(port.to_i, route_handler)
      puts "Listening on #{port}..."
      server.listen
    end
  end
end
