dir = File.expand_path('..', __FILE__)
$:.unshift(dir) unless $:.include?(dir)

require 'config/dragonfly'
require 'keyfile/app'
require 'keyfile/auth'

use Keyfile::Auth
use Dragonfly::Middleware
run Keyfile::App.new
