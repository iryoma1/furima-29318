require 'rails_helper'
RSpec.describe Order, type: :model do
  describe '購入する時の購入者の情報' do
    before do
      @order = FactoryBot.build(:order)
    end

    describe '購入できる' do
      it '全ての情報が正しく入力されている' do
        expect(@order).to be_valid
      end
    end
    context '購入できない' do
      it '郵便番号が空の場合' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空の場合' do
        @order.prefecture_id = ''
        @order.valid?
      end
      it '市区町村が空の場合' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空の場合' do
        @order.city_block = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City block can't be blank")
      end
      it '電話番号が空の場合' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号に-がない場合' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it '電話番号に-がある場合' do
        @order.phone_number = '000-1111-2222'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁の場合' do
        @order.phone_number = '000111122222'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it '都道府県の[--]を選択している場合' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'クレジットカード情報が空の場合' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
