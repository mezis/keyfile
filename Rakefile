dir = File.expand_path('..', __FILE__)
$:.unshift(dir) unless $:.include?(dir)

require 'sinatra/activerecord/rake'
require 'keyfile/app'
require 'keyfile/cleaner'
require 'keyfile/entry'

namespace :keyfile do
  desc 'removes least recently accessed files to make space'
  task :clean do
    Keyfile::Cleaner.new.run
  end

  desc 'prints usage statistics'
  task :usage do
    puts "entries: #{Keyfile::Entry.count}"
    puts "bytes:   #{Keyfile::Entry.sum(:file_size)}"
  end
end
