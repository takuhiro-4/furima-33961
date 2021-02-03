FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    kjname                { "坂田" }
    namekj                { "坂田" }
    knname                { "サカタ" }
    namekn                { "サカタ" }
    dob                   { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
