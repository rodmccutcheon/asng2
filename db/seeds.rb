require 'factory_girl'
require_relative('../spec/factories.rb')

puts 'TEST ROLES'

%w[user player admin].each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

puts 'TEST USERS'

user = FactoryGirl.create(:user, :name => 'Rod McCutcheon', :email => 'rodmccutcheon@gmail.com', :password => 'Rod123', :password_confirmation => 'Rod123')
puts 'user: ' << user.name
user.add_role :admin
user.add_role :player

user2 = FactoryGirl.create(:user, :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please')
puts 'user: ' << user2.name
user2.add_role :user

