require 'sequel'
require 'sinatra'

DB = Sequel.connect('mysql2://mydb')


class Users
  @@user = DB.from(:users)
  def user
    @@user
  end
end

class Groups
  @@groups = DB.from(:orders)
end

class UserGroups
  @@usergroups = DB.from(:orders)
end

class Orders
  @@orders = DB.from(:orders)
end

get '/' do
  a = Users.new
  puts a.get_user
end