class DeliveryInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to :prefecture

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :house_number
    validates :phone_number, numericality: {only_integer: true, length: { maximum: 11 } message: "is invalid.Only numbers within 11 digits can be saved"}
  end

  validates :prefecture_id, numericality: { other_than: 1 } 
end