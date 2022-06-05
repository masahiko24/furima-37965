FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '一' }
    last_name             { '田中' }
    first_name_reading    { 'ハジメ' }
    last_name_reading     { 'タナカ' }
    birthday              { Faker::Date.between(from: '2022-05-1', to: '2022-05-31') }

  end
end
