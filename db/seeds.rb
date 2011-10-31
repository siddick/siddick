
if AdminUser.count == 0
  AdminUser.create( :name => "Admin", :email => "admin@example.com", :password => "password" )
end