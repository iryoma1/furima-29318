FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Name.name}
    last_name             {Faker::Name.name}
    first_name_kana       {Faker::Name.name}
    last_name_kana        {Faker::Name.name}
    birth_data            {"1900-09-23"}
  end
end