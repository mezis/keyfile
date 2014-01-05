dir = File.expand_path('..', __FILE__)
$:.unshift(dir) unless $:.include?(dir)

require 'config/dragonfly'
require 'keyfile/app'
require 'keyfile/auth'
require 'unicorn/oob_gc'

use Keyfile::Auth
use Dragonfly::Middleware
use Unicorn::OobGC, 1
run Keyfile::App.new
