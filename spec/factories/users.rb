FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    first_name_reading    { 'ハジメ' }
    last_name_reading     { 'タナカ' }
    birthday              { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
  end
end
