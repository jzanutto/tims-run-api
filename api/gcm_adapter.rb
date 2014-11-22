require 'gcm'

class GCMAdapter
    # class GCMAdapterError < Error; end

    def initialize
        api_key = "AIzaSyAALvk8TD_GnlYkYCvsrLobc_JW6KrINg8"
        @gcm = GCM.new(api_key)
    end

    def push(registration_ids, data)
        response = @gcm.send(registration_ids, data)
        response
    end

end