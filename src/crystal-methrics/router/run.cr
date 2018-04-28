require "./router"

def initialize
  web_server = Crystal::Methrics::WebServer.new
  web_server.draw_routes
  web_server.run
end

initialize
