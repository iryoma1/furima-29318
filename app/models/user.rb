class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, format: { with: PASSWORD_REGEX }
    validates :first_name, format: { with: NAME_REGEX }
    validates :last_name, format: { with: NAME_REGEX }
    validates :first_name_kana, format: { with: NAME_KANA_REGEX }
    validates :last_name_kana, format: { with: NAME_KANA_REGEX } 
    validates :birth_data
  end
end

