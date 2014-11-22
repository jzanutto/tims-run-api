require 'sequel'
require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection("mysql2://root@localhost/mydb")
# ActiveRecord::Base.connection.execute(IO.read("./db/db.sql"))
`/usr/local/mysql/bin/mysql -uroot < db/db.sql`

class Users < ActiveRecord::Base
  self.table_name = "USERS"
end

class Groups < ActiveRecord::Base
  self.table_name = "GROUPS"
end

class UserGroups < ActiveRecord::Base
  self.table_name = "USERGROUPS"
end

class Orders < ActiveRecord::Base
  self.table_name = "ORDERS"
end

class Requests < ActiveRecord::Base
  self.table_name = "REQUESTS"
end

class Owing < ActiveRecord::Base
  self.table_name = "OWNING"
end