FactoryBot.define do
  factory :buy_shipping_address do
    post_code { '123-4567' }
    prefecture_id { '5' }
    municipality { '今治市青空町' }
    address { '3丁目15番地' }
    building { '豪邸マンション100F' }
    tel_number { '07012345678' }
    buy_id { '' }
    user_id { '1' }
    item_id { '2' }
  end
end
