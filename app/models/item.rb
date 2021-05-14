class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :record

  validates :category_id, :status_id, :fee_id, :prefecture_id, :days_id, numericality: { other_than: 1 } 

  with_options presence: true do
    validates :name, :item_explain, :price
  end
end