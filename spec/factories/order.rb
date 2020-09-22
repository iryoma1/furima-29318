FactoryBot.define do
  factory :order do
    postal_code           { '111-2233' }
    prefecture_id         { 12 }
    city                  { '名古屋市' }
    city_block            { '名東区' }
    building              { '中央ハイツ' }
    phone_number          { '00011112222' }
    purchase              {1}
    user_id               {2}
    item_id               {3}
    token                 {'test'}
  end
end
