dir = File.expand_path('..', __FILE__)
$:.unshift(dir) unless $:.include?(dir)

require 'config/dragonfly'
require 'keyfile/app'
require 'keyfile/auth'
require 'unicorn'
require 'unicorn/oob_gc'
require 'newrelic_rpm'
require 'rack/chunked'
require 'keyfile/rack_chunker'

NewRelic::Agent.after_fork(force_reconnect: true)

use Rack::Chunked
use Keyfile::RackChunker
use Keyfile::Auth
use Dragonfly::Middleware
use Unicorn::OobGC, 1
run Keyfile::App.new
