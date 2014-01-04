require 'dragonfly'
require 'dragonfly-activerecord/store'
require 'logger'

Dragonfly.app.configure do
  url_format '/media/:job'
  datastore Dragonfly::ActiveRecord::Store.new
end

Dragonfly.logger = Logger.new($stdout)
