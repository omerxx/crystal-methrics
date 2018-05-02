require "router"

# TODO: Write documentation for `Crystal::Methrics`
module Crystal::Methrics
  class WebServer
    include Router

    def draw_routes
      redisapp = RedisApp::Actions.new

      get "/" do |context, params|
        context.response.print "Hello WORLD"
        context
      end

      get "/redis" do |context, params|
        context.response.print redisapp.test
        context
      end

      post "/key/:key_id/value/:metric_value" do |context, params|
        metric = Data::Point.new(params["key_id"], params["metric_value"].to_i)
        context.response.print redisapp.metric_store(metric)
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
