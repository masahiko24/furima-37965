FactoryBot.define do
  factory :item do
    image                     {'IMG-4352.jpg'}
    brandname                 {'ut'}
    description               {'nice'}
    details_category          {'メンズ'}
    details_condition         {'新品'}
    delivery_charge           {'着払い'}
    delivery_area             {'福岡県'}
    delivery_number_of_date   {'1〜2日で発送'}
    price                     {'100'}
    price_is_invalid          {}
    
  end
end
