class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :record
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 } 
    validates :item_explain, length: { maximum: 1000 } 
  end

  validates :category_id, :status_id, :fee_id, :prefecture_id, :days_id, numericality: { other_than: 1 } 

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: {with: /\A[0-9]+\z/i, message: "is invalid. Input half-width number."}
  
  # def was_attached?
  #   self.image.attached?
  # end
end