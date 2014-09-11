require 'spec_helper'
require 'keyfile/app'
require 'keyfile/entry'

describe Keyfile::App do
  include Rack::Test::Methods

  def app
    described_class
  end

  let(:test_file) { Rack::Test::UploadedFile.new('spec/assets/test.bin') }

  describe 'post /:key' do
    def perform
      post '/foo', filedata: test_file
    end

    it 'saves an entry' do
      expect { perform }.to change(Keyfile::Entry, :count).by(1)
    end

    it 'overwrites any existing entry' do
      old_id = Keyfile::Entry.create!(key: 'foo').id
      perform
      expect(Keyfile::Entry.count).to eq(1)
      expect(Keyfile::Entry.first.id).not_to eq(old_id)
    end
  end

  describe 'get /:key' do
    def perform
      get '/foo'
    end

    it 'raises 404 for unknown entries' do
      perform
      expect(last_response).to be_not_found
    end

    context 'when the entry exists' do
      before do
        Keyfile::Entry.create!(key: 'foo', file: test_file)
      end

      it 'redirects to the entry' do
        perform
        expect(last_response).to be_redirect

        entry_path = Keyfile::Entry.last.file.url
        response_path = URI.parse(last_response.location).path
        expect(response_path).to eq(entry_path)
      end

      it 'bumps the entry timestamp' do
        expect { perform }.to change{ Keyfile::Entry.first.updated_at }
      end
    end
  end
end
