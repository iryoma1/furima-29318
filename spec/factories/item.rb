FactoryBot.define do
  factory :item do
    name              { '時計' }
    description       { '中古の時計です。' }
    category_id       { 2 }
    status_id         { 2 }
    shopping_cost_id  { 2 }
    area_id           { 2 }
    shopping_day_id   { 2 }
    price             { 900 }
    user

    # after(:build) do |item|
    #   item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
    # after(:build) { |item| item.image.attach(content_type: image/png) }
  end
end
