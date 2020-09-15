class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shopping_cost
  belongs_to_active_hash :area
  belongs_to_active_hash :shopping_day
  

  validates :category_id, numericality: { other_than: 1 }


end
