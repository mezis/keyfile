require 'sinatra/base'
require 'sinatra/activerecord'
require 'config/env'
require 'keyfile/entry'

module Keyfile
  class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    set :database, ENV['DATABASE_URL']

    get '/pulse' do
      Entry.count
      halt 200
    end

    post '/:key' do
      Entry.transaction do
        Entry.where(key: params['key']).destroy_all
        Entry.new.tap do |entry|
          entry.key  = params['key']
          entry.file = params['filedata'][:tempfile]
          entry.save!
        end
      end
    end

    get '/:key' do
      halt 400 unless params['key']

      entry = Entry.where(key: params['key']).first
      halt 404 if entry.nil?

      entry.update_column(:updated_at, Time.now)
      redirect to(entry.file.url), 303
    end
  end
end

