
require_relative '../lib/populator_fix.rb'

User.populate 20 do |u|

    u.name = Faker::Name.name
    u.lastname = Faker::Name.name
    u.phone = Faker::PhoneNumber.phone_number
    u.address = Faker::Address.street_name 
    u.identification = Faker::IDNumber.valid 
    u.company = Faker::Company.name 
    u.email = Faker::Internet.email
    u.encrypted_password = Faker::Number.number(digits: 10)

    
end