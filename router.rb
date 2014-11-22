require './app'
require 'sinatra'

module Router
    class TimsRun < Sinatra::Base
        get '/' do
           halt 404
        end
    end
end