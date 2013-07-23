FactoryGirl.define do

  factory :person do
    first_name "John"
    last_name  "Doe"
    phone Faker::PhoneNumber.phone_number
  end

end