configure :development do
 set :database, 'mysql2:///mydb'
 set :show_exceptions, true
end

configure :production do

 ActiveRecord::Base.establish_connection(
   :adapter  => 'mysql2',
   :host     => 'localhost',
   :username => 'root',
   :database => 'mydb',
   :encoding => 'utf8'
 )
end