class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shopping_cost
  belongs_to_active_hash :area
  belongs_to_active_hash :shopping_day
  has_one_attached :image
  



  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :shopping_cost_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :shopping_day_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :user
    validates :image
  end
end
