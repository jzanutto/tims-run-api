require './app'
require 'sinatra'
require 'active_record'
require './api/gcm_adapter'

module Router
    class TimsRun < Sinatra::Base
        attr_accessor :gcm
        before do
            @gcm = GCMAdapter.new
        end

        get '/' do
           response = gcm.push(["-1"], {:stuff => "not stuff"})
           response
        end
        
        post '/api/tims/user/create' do
          status 200
        end
    end
end