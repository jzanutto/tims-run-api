require './app'
require 'sinatra'
require 'active_record'

module Router
    class TimsRun < Sinatra::Base
      get '/' do
         status 200
      end

      post '/api/tims/user/create' do
        status 200
      end
    end
end