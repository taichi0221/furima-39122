FactoryBot.define do
  factory :item do
    name               {'くるま'}
    explanation        {'タイヤ３個しかついてません'}
    price              {'2000'}
    association :user
    category_id        {'2'}
    situation_id       {'2'}
    prefecture_id      {'2'}
    shipping_day_id    {'2'}
    delivery_charge_id {'2'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
