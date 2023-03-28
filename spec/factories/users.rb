FactoryBot.define do
  factory :user do
    nickname              {'がけっぷち'}
    email                 {Faker::Internet.free_email}
    password              {'user11'}
    password_confirmation {password}
    last_name             {'むた'}
    first_name            {'たいち'}
    last_name_kana        {'ムタ'}
    first_name_kana       {'タイチ'}
    birth_day             {'1984-02-21'}
  end
end