FactoryBot.define do
  factory :item do
    name                     { Faker::Lorem.sentence }
    description              { Faker::Lorem.sentence }
    kategory_id              { "1" }
    state_id                 { "2" }
    burden_id                { "3" }
    area_id                  { "4" }
    sipping_id               { "5" }
    price                    { "1000" }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

end
