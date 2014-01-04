dir = File.expand_path('..', __FILE__)
$:.unshift(dir) unless $:.include?(dir)

require 'config/dragonfly'
require 'keyfile/app'

use Dragonfly::Middleware
run Keyfile::App.new
