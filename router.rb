require 'sinatra'

require './api/firebase_request'

module Router
    class TimsRun < Sinatra::Base

        configure do
            enable :logging
            use Rack::CommonLogger, 'sinatra.log'
        end

        before do
            env['rack.logger'] = Logger.new "sinatra.log"
            env['firebase'] = FirebaseRequest.new
        end

        get '/' do
            env['firebase'].push("test", {test: 1})
        end
    end
end