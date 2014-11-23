require './app'
require 'sinatra'
require 'active_record'
require './api/gcm_adapter'

module Router
    class TimsRun < Sinatra::Base
        # attr_accessor :gcm
        # before do
        #     @gcm = GCMAdapter.new
        # end

        get '/' do
           # response = gcm.push(["-1"], {:stuff => "not stuff"})
           # response
           status 200
        end
        
        post '/api/tims/user/create' do
          user = Users.find_by_email(params[:email])
          if !user.nil?
            body user.to_json
            status 200
            return
          end
          user = Users.new(name: params[:name], token: params[:token], email: params[:email])
          if !user.save
            status 422
          else
            puts user.id
            body user.to_json
            status 200
          end
        end

        post '/api/tims/group/create' do
          group = Groups.new(name: params[:name])
          group.save
          usergroup = UserGroups.new(uid: params[:uid], gid: group.gid, name: group.name)
          if !usergroup.save
            status 422
          else
            body group.to_json
            status 200
          end
        end

        post '/api/tims/group/join' do
          ug = UserGroups.find(uid: params[:uid], gid: params[:gid])
          if !ug.nil?
            message = {message: "You are part of that group"}
            body message.to_json
            status 200
            return
          end
          group = Group.find(params[:id])
          if !group
            status 404
          else
            ug = UserGroups.new(uid: params[:uid], gid: params[:gid])
            body ug.to_json
            status 200
          end
        end

        get '/api/tims/user/find' do
          user = Users.find_by_email(params[:email])
          if user.nil?
            status 404
          else
            body user.to_json
            status 200
          end
        end

        get '/api/tims/user/find_groups' do
          groups = UserGroups.where(uid: params[:uid])
          result = "["
          groups.each do |group|
            result << Groups.find(group.gid).to_json << ","
          end
          #hack
          result[result.size-1] = ''
          result << "]"
          puts result
          if !groups.nil?
            body result
            status 200
          else
            status 404
          end
        end

        get '/api/tims/group/requests' do
          requests = Requests.where(gid: params[:gid])
          if requests.nil?
            status 404
            return
          end
          result = "["
          requests.each do |req|
            order = Orders.find(req.orid)
            if !order.nil?
              result << order.to_json << ","
            end
          end
          # hack again
          if result.length > 5
            result[result.size-1] = ''
            result << "]"
          else
            status 404
            return
          end
          puts result
          if !requests.nil?
            body result
            status 200
          else
            status 404
          end
        end

        post '/api/tims/group/order/complete' do
          requests = Requests.where(gid: params[:gid])
          requests.each do |req|
            order = Orders.find(orid: req.orid);
            owing = Owing.new(balance: order.price, to_uid: params[:uid], from_uid: req.uid)
            owing.save
          end
          Requests.where(gid: params[:gid]).destroy_all

          status 200

        end

        delete '/api/tims/group/request' do
        end

        post '/api/tims/group/request' do
          group = Groups.find(params[:gid])
          order = Orders.new( item: params[:item],
                              size: params[:size],
                              price: params[:price],
                              details: params[:details])
          order.save
          request = Requests.new(gid: params[:gid], orid: order.orid, uid: params[:uid])
          puts order.to_json
          if request.save
            body order.to_json
            status 200
          else
            status 400
          end
        end


    end
end
