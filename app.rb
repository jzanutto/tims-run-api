require 'sequel'
require 'sinatra'

DB = Sequel.connect('mysql2://root@localhost/mydb')


class Users
  def initialize
    @@user = DB.from(:users)
  end
  def user
    @@user
  end
end

class Groups
  def initialize
    @@groups = DB.from(:orders)
  end

  def group
    @@group
  end
end

class UserGroups
  def initialize
    @@usergroups = DB.from(:orders)
  end

  def usergroup
    @@usergroup
  end
end

class Orders
  def initialize
    @@orders = DB.from(:orders)
  end

  def orders
    @@orders
  end
end

class Requests
  def initialize
    @@requests = DB.from(:requests)
  end

  def requests
    @@requests
  end
end

get '/' do
  a = Users.new
  a.user.insert(name: "FASIH", token: "FFF")
  puts a.user.count
  
end