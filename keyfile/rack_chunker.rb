require 'rack'

module Keyfile
  # Enables chunking for Dragonfly resources
  class RackChunker
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env).tap do |status, headers, response|
        headers.delete 'Content-Length' if env['REQUEST_PATH'] =~ %r{^/media/}
      end
    end
  end
end
