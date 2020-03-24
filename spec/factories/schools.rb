FactoryBot.define do
  factory :school do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    website { Faker::Internet.domain_name }
    phone { Faker::PhoneNumber.phone_number }

    trait :with_avatar do
      logo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'thumb.png'), 'image/png') }
    end

    is_active { ['Y', 'N'].sample }
  end
end