require 'config/env'
require 'rack/auth/basic'
require 'rack/auth/digest/md5'

module Keyfile
  class Auth < Rack::Auth::Digest::MD5
    def initialize(app)
      @app = app
      super(app) do |username|
        credentials[username]
      end
      self.realm =  ENV['KEYFILE_REALM']
      self.opaque = ENV['KEYFILE_SECRET']
    end

    private

    def credentials
      @_credentials ||= JSON.parse ENV['KEYFILE_CREDENTIALS']
    end
  end
end
