class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id, :item_id, :city, :house_number
    validates :phone_number, numericality: {only_integer: true, length: { maximum: 11 }, message: "is invalid.Only numbers within 11 digits can be saved"}
  end

  validates :prefecture_id, numericality: { other_than: 1 } 

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end