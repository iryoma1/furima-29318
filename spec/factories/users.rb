FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'123eee'}
    password_confirmation {password}
    first_name            {'田中'}
    last_name             {'太郎'}
    first_name_kana       {'タナカ'}
    last_name_kana        {'タロウ'}
    birth_data            {'1900-09-23'}
  end
end
