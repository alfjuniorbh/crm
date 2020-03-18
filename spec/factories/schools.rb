FactoryBot.define do
  factory :school do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    website { Faker::Internet.domain_name }
    phone { Faker::PhoneNumber.phone_number }
    logo { "#{Rails.root}/spec/fixtures/thumb.png" }
    is_active { ['Y', 'N'].sample }
  end
end