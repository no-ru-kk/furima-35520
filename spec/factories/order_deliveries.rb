FactoryBot.define do
  factory :order_delivery do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {"470-0212"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {'横浜市南区'}
    house_number  {'青山1-1-1'}
    building_name {'柳町ビル101'}
    phone_number  {Faker::Number.between(from: 1, to: 99999999999)}
  end
end