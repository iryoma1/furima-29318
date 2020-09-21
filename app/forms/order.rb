class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase, :user_id, :item_id, :token

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  PHONE_NUMBER_REGEX = /\A\d{11}\z/

  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX}
    validates :user_id
    validates :item_id
  end

  def save
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase: purchase)
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
  end

end