FactoryBot.define do
  factory :item do
    brandname                 { 'ut' }
    description               { 'nice' }
    details_category_id          { 0 }
    details_condition_id         { 0 }
    delivery_charge_id           { 0 }
    delivery_area_id             { 0 }
    delivery_number_of_date_id   { 0 }
    price { '1000' }
    user_id { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
