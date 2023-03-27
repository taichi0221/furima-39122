FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email {Faker::Internet.free_email}
    password_confirmation {password}
    birth_day { Faker::Date.birthday(min_age: 5) }
    last_name { Faker::Japanese.last_name }
  #   first_name { Faker::JapaneseMedia::Name.first_name }
  #   last_name_kana { Faker::JapaneseMedia::Name.last_name.yomi }
  #   first_name_kana { Faker::JapaneseMedia::Name.first_name.yomi }
  # #  password { Faker::Internet.password(min_length: 6, mix_case: true, digits: true) }
  end
end