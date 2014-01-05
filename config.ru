dir = File.expand_path('..', __FILE__)
$:.unshift(dir) unless $:.include?(dir)

require 'config/dragonfly'
require 'keyfile/app'
require 'keyfile/auth'
require 'unicorn'
require 'unicorn/oob_gc'
require 'newrelic_rpm'

NewRelic::Agent.after_fork(force_reconnect: true)

use Keyfile::Auth
use Dragonfly::Middleware
use Unicorn::OobGC, 1
run Keyfile::App.new
