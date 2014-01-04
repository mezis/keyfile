require 'config/dragonfly'
require 'active_record'

module Keyfile
  class Entry < ActiveRecord::Base
    extend Dragonfly::Model

    dragonfly_accessor :file
  end
end

