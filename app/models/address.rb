class Address < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :prefecture

  POSTAL_CODE_REGEX = /^\d{3}[-]\d{4}$/
  PHONR_NUMBER_REGEX = /^\d{11}$/

  with_options presence: true do
    validates :postal_code, format { with: POSTAL_CODE_REGEX}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format { with: PHONR_NUMBER_REGEX}
    validates :purchase
  end
end
