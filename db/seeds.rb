
require_relative '../lib/populator_fix.rb'

User.populate 20 do |u|
    u.name = Faker::Name.first_name
    u.email = Faker::Internet.email
    u.encrypted_password = Faker::Number.number(digits: 10)
end


Person.populate 20 do |u|

    u.name = Faker::Name.name
    u.lastname = Faker::Name.name
    u.phone = Faker::Number.number(digits: 4)
    u.address = Faker::Address.street_name 
    u.identification = Faker::IDNumber.valid 
    u.company = Faker::Company.name 
    u.email = Faker::Internet.email
    u.user_id = Faker::Number.between(from: 1, to: 5)
end
