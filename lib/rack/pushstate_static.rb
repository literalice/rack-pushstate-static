require 'rack/pushstate_static/version'

module Rack
  class PushstateStatic
    def initialize(app, excludes: [])
      @app = app
      @excludes = excludes
      @file_server = Rack::File.new('public')
      @catch = [404, 405]
    end

    def can_serve?(path)
      @excludes.all? do | exclude |
        !path.start_with?(exclude)
      end
    end

    def serve_path(path)
      if path.end_with?('/')
        path + 'index.html'
      else
        path
      end
    end

    def serve_statics(env, path)
      env[Rack::PATH_INFO] = serve_path(path)
      result = @file_server.call(env)
      if @catch.include?(result[0].to_i)
        env[Rack::PATH_INFO] = '/index.html'
        @file_server.call(env)
      else
        result
      end
    end

    def call(env)
      path = env[Rack::PATH_INFO]

      if can_serve?(path)
        serve_statics(env, path)
      else
        @app.call(env)
      end
    end
  end
end
