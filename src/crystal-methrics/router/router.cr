require "router"

# TODO: Write documentation for `Crystal::Methrics`
module Crystal::Methrics
  class WebServer
    include Router

    def draw_routes
      redisapp = RedisApp::Actions.new

      get "/health" do |context, params|
        context.response.print "4Cyl750!"
        context
      end

      get "/test" do |context, params|
        context.response.print redisapp.test
        context
      end

      get "/metric/:metric_id/value/:metric_value" do |context, params|
        metric = Data::Point.new(params["metric_id"], params["metric_value"].to_i)
        context.response.print redisapp.metric_store(metric)
        context
      end
    end

    def run
      port = ENV["PORT"] ||= "3000"
      server = HTTP::Server.new("0.0.0.0", port.to_i, route_handler)
      puts "Listening on #{port}..."
      server.listen
    end
  end
end
