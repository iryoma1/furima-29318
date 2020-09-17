require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '出品する商品の新規登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("public/images/test_image.png")
    end

    it 'すべての情報が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
    it '価格の範囲が、￥300以上でないと登録できない' do
      @item.price = "100"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格の範囲が、￥9999999以下でないと登録できない' do
      @item.price = "100000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '価格は半角数字でないと、登録できない' do
      @item.price = "１００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it '価格は半角数字でないと、登録できない' do
      @item.price = "aaaas"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'カテゴリーの[--]は選択できない' do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
  end
end