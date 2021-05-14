FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'2021te'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'隆太郎'}
    lname_reading         {'ヤマダ'}
    fname_reading         {'リクタロウ'}
    birth_date            {Faker::Date.in_date_period}
  end
end
