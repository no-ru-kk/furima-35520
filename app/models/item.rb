class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :record
  has_one_attached :image

  validates :category_id, :status_id, :fee_id, :prefecture_id, :days_id, numericality: { other_than: 1 } 
 
  with_options presence: true do
    validates :name, :item_explain, :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: {with: /\A[0-9]+\z/i, message: "is invalid. Input half-width number."}
  
  end

  # def was_attached?
  #   self.image.attached?
  # end
end