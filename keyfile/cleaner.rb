require 'config/env'
require 'keyfile/entry'

module Keyfile
  class Cleaner
    def run
      while total_bytes > max_bytes
        Entry.order(:updated_at).first.destroy
      end
    end

    private

    def total_bytes
      Entry.sum(:file_size)
    end

    def max_bytes
      @_max_bytes ||= ENV['KEYFILE_MAX_BYTES'].to_i
    end
  end
end
