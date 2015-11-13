module EmberCli
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      path = env["PATH_INFO"].to_s

      if path == "/testem.js"
        [ 200, { "Content-Type" => "text/javascript" }, [""] ]
      else
        @app.call(env)
      end
    end
  end
end
