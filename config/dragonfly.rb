require 'dragonfly'
require 'dragonfly-activerecord/store'
require 'logger'

Dragonfly.app.configure do
  url_format '/media/:job'
  verify_urls false
  datastore Dragonfly::ActiveRecord::Store.new
end

Dragonfly.logger = Logger.new($stdout)
