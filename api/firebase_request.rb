require 'firebase'
require 'sinatra'

class FirebaseRequest
    def initialize
        base_uri = 'https://blinding-torch-8597.firebaseio.com/'
        @firebase = Firebase::Client.new(base_uri)
    end

    # name is a hash
    def push(name, contents)
        @firebase.push(name, contents)
    end
end
