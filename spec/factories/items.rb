FactoryBot.define do
  factory :item do
    image                     { 'IMG-4352.jpg' }
    brandname                 { 'ut' }
    description               { 'nice' }
    details_category_id          {1}
    details_condition_id         {1}
    delivery_charge_id           {1}
    delivery_area_id             {1}
    delivery_number_of_date_id   {1}
    price                     { '500' }

    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
